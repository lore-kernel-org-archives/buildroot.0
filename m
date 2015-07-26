From: Jaap Crezee <jaap@jcz.nl>
Date: Sun, 26 Jul 2015 12:49:38 +0200
Subject: [Buildroot] [PATCH 1/1] Added extra patch to qt5base package for
	fixing ccache related compile error with new QT 5.5
Message-ID: <1437907778-3734-1-git-send-email-jaap@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jaap Crezee <jaap@jcz.nl>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/qt5/qt5base/0008-ccache_buildroot_fix.patch | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 package/qt5/qt5base/0008-ccache_buildroot_fix.patch

diff --git a/package/qt5/qt5base/0008-ccache_buildroot_fix.patch b/package/qt5/qt5base/0008-ccache_buildroot_fix.patch
new file mode 100644
index 0000000..62aa57b
--- /dev/null
+++ b/package/qt5/qt5base/0008-ccache_buildroot_fix.patch
@@ -0,0 +1,16 @@
+Author: Jaap Crezee <jaap@jcz.nl>
+---
+diff --git a/mkspecs/features/device_config.prf b/mkspecs/features/device_config.prf
+index cd3a0cf..674b3dd 100644
+--- a/mkspecs/features/device_config.prf
++++ b/mkspecs/features/device_config.prf
+@@ -35,6 +35,9 @@ defineTest(deviceSanityCheckCompiler) {
+             return()
+     }
+ 
++    # Last resort, check if we can still execute it (for example in Buildroot/Crosscompile...)
++    system("which $$QMAKE_CXX > /dev/null"):return()
++
+     # QMAKE_CXX does not point to a compiler.
+     error("Compiler $$QMAKE_CXX not found. Check the value of CROSS_COMPILE -device-option")
+ }
-- 
2.4.6
