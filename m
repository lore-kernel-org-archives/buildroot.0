From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:01:15 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] package/cpio: fix build
 with gcc 10
Message-ID: <20200828155426.00D4782DA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=87f0bdcc9a9bfcc0dd8e029b3b75bbba49e088aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Fixes:
 - http://autobuild.buildroot.org/results/22fefd9774cbd6648d67f29826f47f1978e9c069

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0428b87a6a559cbcba4f2620bc6c77332e9f55b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cpio/0001-Minor-fix.patch | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

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
