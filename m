From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Feb 2013 22:31:22 +0100
Subject: [Buildroot] [PATCH 02/11] manual: minor fix in patch-policy.txt
In-Reply-To: <cover.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
Message-ID: <677f6fbb5a9c1994131975c171a285c4335c38d8.1361827174.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/patch-policy.txt | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 14c6efc..114c81e 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -40,6 +40,14 @@ A +series+ file, as used by +quilt+, may also be added in the
 package directory. In that case, the +series+ file defines the patch
 application order.
 
+.Notes
+- The patch files coming with Buildroot should not contain any package version
+reference in their filename.
+- If a patch does some package version fixes, this should be documented in the
+commit message of the patch itself (or the message prepended to the 'diff'
+itself).
+
+
 How patches are applied
 ~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -56,8 +64,8 @@ How patches are applied
 * If a +series+ file exists in the package directory, then patches are
   applied according to the +series+ file;
 +
-* Otherwise, patch files matching `<packagename>-*.patch` are applied
-  following the +ls+ command order.
+* Otherwise, patch files matching +<packagename>-<description>.patch+
+  are applied following the +ls+ command order.
 
 . Run the +<packagename>_POST_PATCH_HOOKS+ commands if defined.
 
-- 
1.8.1.4
