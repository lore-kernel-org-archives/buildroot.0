From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Aug 2019 23:35:21 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/qt5/qt5base: drop
 wrong optimization flag
Message-ID: <20190829214311.17EBA88598@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9836148670a5bca52e1e7021d6f8f7b9580b57bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

In qmake.conf.in has been left 'QMAKE_CXXFLAGS_RELEASE += -O3' but this
leads to not use Buildroot CXXFLAGS when building in release
mode(without debugging symbols). So let's remove it to let Qt5 to follow
Buildroot optimization flags like other packages do.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0650c4c7a3415399e3e099ec742685b8469418e7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
