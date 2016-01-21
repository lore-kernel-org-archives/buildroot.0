From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jan 2016 22:10:09 +0100
Subject: [Buildroot] [PATCH 1/2] vboot-utils: convert to Git formatted
	patches
Message-ID: <1453410610-12040-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since vboot-utils is hosted in a Git repository, it makes sense to use
Git formatted patches for this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...Add-missing-definition-of-MTD_CHAR_MAJOR.patch} | 15 +++++++++++-
 ...02-Add-missing-header-include-for-ssize_t.patch | 27 ++++++++++++++++++++++
 package/vboot-utils/0002-ssize-t.patch             | 14 -----------
 3 files changed, 41 insertions(+), 15 deletions(-)
 rename package/vboot-utils/{0001-mtd-char-major.patch => 0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch} (57%)
 create mode 100644 package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
 delete mode 100644 package/vboot-utils/0002-ssize-t.patch

diff --git a/package/vboot-utils/0001-mtd-char-major.patch b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
similarity index 57%
rename from package/vboot-utils/0001-mtd-char-major.patch
rename to package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
index 9db90b2..42410c8 100644
--- a/package/vboot-utils/0001-mtd-char-major.patch
+++ b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
@@ -1,7 +1,17 @@
-This definition missing from <linux/major.h> for kernels <= 3.13.
+From 1438211660e700b2c9505863aae1cc957236b7c8 Mon Sep 17 00:00:00 2001
+From: Alex Suykov <alex.suykov@gmail.com>
+Date: Thu, 21 Jan 2016 21:59:46 +0100
+Subject: [PATCH] Add missing definition of MTD_CHAR_MAJOR
+
+This definition missing from <linux/major.h> for kernels <= 3.13
 
 Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+---
+ cgpt/cgpt_wrapper.c | 4 ++++
+ 1 file changed, 4 insertions(+)
 
+diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
+index dcfaab9..4d07aad 100644
 --- a/cgpt/cgpt_wrapper.c
 +++ b/cgpt/cgpt_wrapper.c
 @@ -25,6 +25,10 @@
@@ -15,3 +25,6 @@ Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
  // Check if cmdline |argv| has "-D". "-D" signifies that GPT structs are stored
  // off device, and hence we should not wrap around cgpt.
  static bool has_dash_D(int argc, const char *const argv[]) {
+-- 
+2.6.4
+
diff --git a/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch b/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
new file mode 100644
index 0000000..4d559ea
--- /dev/null
+++ b/package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch
@@ -0,0 +1,27 @@
+From b6bed8d4e9453bc74ba021c8c17e20c3b5964c37 Mon Sep 17 00:00:00 2001
+From: Alex Suykov <alex.suykov@gmail.com>
+Date: Thu, 21 Jan 2016 22:00:34 +0100
+Subject: [PATCH] Add missing header include for ssize_t
+
+The code uses ssize_t which is usually defined in <unistd.h>.
+
+Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+---
+ host/lib/fmap.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/host/lib/fmap.c b/host/lib/fmap.c
+index c95338d..e3db826 100644
+--- a/host/lib/fmap.c
++++ b/host/lib/fmap.c
+@@ -6,6 +6,7 @@
+ 
+ #include <stdio.h>
+ #include <string.h>
++#include <unistd.h>
+ 
+ #include "fmap.h"
+ 
+-- 
+2.6.4
+
diff --git a/package/vboot-utils/0002-ssize-t.patch b/package/vboot-utils/0002-ssize-t.patch
deleted file mode 100644
index 9f1df45..0000000
--- a/package/vboot-utils/0002-ssize-t.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-The code uses ssize_t which is usually defined in <unistd.h>
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
-
---- a/host/lib/fmap.c
-+++ a/host/lib/fmap.c
-@@ -6,6 +6,7 @@
- 
- #include <stdio.h>
- #include <string.h>
-+#include <unistd.h>
- 
- #include "fmap.h"
- 
-- 
2.6.4
