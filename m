From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 18:05:22 +0200
Subject: [Buildroot] [PATCH v1] qt5base: remove nostrip qmake.conf config
	option
Message-ID: <20171027160522.21892-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re-enables the qmake default behaviour for qmake projects living
out-side of buildroot (debug build with-out strip, release build with
strip).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5base/qmake.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qt5/qt5base/qmake.conf b/package/qt5/qt5base/qmake.conf
index 8b6debe583..b8699ac1f4 100644
--- a/package/qt5/qt5base/qmake.conf
+++ b/package/qt5/qt5base/qmake.conf
@@ -16,7 +16,6 @@ QMAKE_CXX               = $${CROSS_COMPILE}g++
 QMAKE_CFLAGS           += $${BR_COMPILER_CFLAGS}
 QMAKE_CXXFLAGS         += $${BR_COMPILER_CXXFLAGS}
 QMAKE_CXXFLAGS_RELEASE += -O3
-CONFIG                 += nostrip
 
 QMAKE_LIBS             += -lrt -lpthread -ldl
 QMAKE_CFLAGS_ISYSTEM   =
-- 
2.14.2
