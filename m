From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 09:40:01 +0200
Subject: [Buildroot] [PATCH v2] docs/manual: document the new patch naming
	convention
Message-ID: <1413272401-3203-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To ease generating patches, we now use a naming convention that is in
line with what git-format-patch does, that is:
  - do not prefix patches with the package name
  - prefix patches with a 4-digit mber
  - start numbering at 0001

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>

---
Changes v1 -> v2:
  - rewprd slightly  (Thomas DS)
---
 docs/manual/patch-policy.txt | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/docs/manual/patch-policy.txt b/docs/manual/patch-policy.txt
index 745f58d..6e27e71 100644
--- a/docs/manual/patch-policy.txt
+++ b/docs/manual/patch-policy.txt
@@ -31,16 +31,23 @@ Most patches are provided within Buildroot, in the package
 directory; these typically aim to fix cross-compilation, libc support,
 or other such issues.
 
-These patch files should be named +<packagename>-<number>-<description>.patch+.
-
-A +series+ file, as used by +quilt+, may also be added in the
-package directory. In that case, the +series+ file defines the patch
-application order.
+These patch files should be named +<number>-<description>.patch+.
 
 .Notes
 - The patch files coming with Buildroot should not contain any package version
-reference in their filename.
-- The field +<number>+ in the patch file name refers to the 'apply order'.
+  reference in their filename.
+- The field +<number>+ in the patch file name refers to the 'apply order',
+  and shall start at 1; It is preferred to pad the number with zeros up to 4
+  digits, like 'git-format-patch' does. E.g.: +0001-foobar-the-buz.patch+
+- Previously, it was mandatory for patches to be prefixed with the name of
+  the package, like +<package>-<number>-<description>.patch+, but that is
+  no longer the case. Existing packages will be fixed as time passes. 'Do
+  not prefix patches with the package name.'
+- Previously, a +series+ file, as used by +quilt+, could also be added in
+  the package directory. In that case, the +series+ file defines the patch
+  application order. This is deprecated, and will be removed in the future.
+  'Do not use a series file.'
+
 
 ==== Global patch directory
 
-- 
1.9.1
