From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Aug 2020 00:07:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: fix build with gcc
 10
Message-ID: <20200828220720.431870-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/02828f2d9956d1e3727774b5045790aa3611428d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...move-redundant-demoextend-definition.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch

diff --git a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
new file mode 100644
index 0000000000..bbfbdbb2d6
--- /dev/null
+++ b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
@@ -0,0 +1,29 @@
+From a8fd4b1f563d24d4296c3e8225c8404e2724d4c2 Mon Sep 17 00:00:00 2001
+From: Jordan Christiansen <xordspar0@gmail.com>
+Date: Sun, 15 Mar 2020 16:55:33 -0500
+Subject: [PATCH] Remove redundant demoextend definition
+
+GCC 10 enables -fno-common by default, which causes the linker to fail when
+there are multple definitions of a global variable.
+
+See https://gcc.gnu.org/gcc-10/porting_to.html
+
+[Retrieved from:
+https://github.com/chocolate-doom/chocolate-doom/commit/a8fd4b1f563d24d4296c3e8225c8404e2724d4c2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/hexen/mn_menu.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/hexen/mn_menu.c b/src/hexen/mn_menu.c
+index 059f45b3e..a97b7fcd1 100644
+--- a/src/hexen/mn_menu.c
++++ b/src/hexen/mn_menu.c
+@@ -131,7 +131,6 @@ boolean MenuActive;
+ int InfoType;
+ int messageson = true;
+ boolean mn_SuicideConsole;
+-boolean demoextend; // from h2def.h
+ 
+ // PRIVATE DATA DEFINITIONS ------------------------------------------------
+ 
-- 
2.28.0
