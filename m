From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 26 Jun 2019 16:04:11 +0200
Subject: [Buildroot] [PATCH 1/2] package/qt5/qt5base: drop wrong
 optimization flag
Message-ID: <20190626140412.101607-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In qmake.conf.in has been left 'QMAKE_CXXFLAGS_RELEASE += -O3' but this
leads to not use Buildroot CXXFLAGS when building in release
mode(without debugging symbols). So let's remove it to let Qt5 to follow
Buildroot optimization flags like other packages do.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/qt5/qt5base/qmake.conf.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index f14527aa7f..26bee2cb39 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -15,7 +15,6 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
 # modifications to gcc-base.conf
 QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
-QMAKE_CXXFLAGS_RELEASE += -O3
 CONFIG                 += nostrip
 
 QMAKE_LIBS             += -lrt -lpthread -ldl
-- 
2.17.1
