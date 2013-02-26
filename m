From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 26 Feb 2013 12:50:31 +0100
Subject: [Buildroot] [PATCH v3] manual: minor fix in patch-policy.txt
Message-ID: <1361879431-21694-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/patch-policy.txt | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 14c6efc..0f55b26 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -34,12 +34,18 @@ Most patches are provided within Buildroot, in the package
 directory; these typically aim to fix cross-compilation, libc support,
 or other such issues.
 
-These patch files should be named +<packagename>-<description>.patch+.
+These patch files should be named +<packagename>-<number>-<description>.patch+.
 
 A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
 application order.
 
+.Notes
+- The patch files coming with Buildroot should not contain any package version
+reference in their filename.
+- The field +<number>+ in the patch file name refers to the 'apply order'.
+
+
 How patches are applied
 ~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -56,8 +62,12 @@ How patches are applied
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching `<packagename>-*.patch` are applied
-  following the +ls+ command order.
+* Otherwise, patch files matching +<packagename>-*.patch+
+  are applied in alphabetical order.
+  So, to ensure they are applied in the right order, it is hightly
+  recommended to named the patch files like this:
+  +<packagename>-<number>-<description>.patch+, where +<number>+
+  refers to the 'apply order'.
 
 . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
 
-- 
1.8.1.4
