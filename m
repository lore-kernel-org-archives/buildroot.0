From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 13 Aug 2020 09:39:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/cpio: fix build with gcc 10
Message-ID: <20200813073922.3126319-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/22fefd9774cbd6648d67f29826f47f1978e9c069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cpio/0001-Minor-fix.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/cpio/0001-Minor-fix.patch

diff --git a/package/cpio/0001-Minor-fix.patch b/package/cpio/0001-Minor-fix.patch
new file mode 100644
index 0000000000..429df7d5f8
--- /dev/null
+++ b/package/cpio/0001-Minor-fix.patch
@@ -0,0 +1,30 @@
+From 641d3f489cf6238bb916368d4ba0d9325a235afb Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Mon, 20 Jan 2020 07:45:39 +0200
+Subject: Minor fix * src/global.c: Remove superfluous declaration of
+ program_name
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=641d3f489cf6238bb916368d4ba0d9325a235afb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/global.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/global.c b/src/global.c
+index fb3abe9..acf92bc 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
+ /* Extract to standard output? */
+ bool to_stdout_option = false;
+ 
+-/* The name this program was run with.  */
+-char *program_name;
+-
+ /* A pointer to either lstat or stat, depending on whether
+    dereferencing of symlinks is done for input files.  */
+ int (*xstat) ();
+-- 
+cgit v1.2.1
+
-- 
2.27.0
