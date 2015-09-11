From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Sep 2015 14:26:27 +0100
Subject: [Buildroot] [PATCH] util-linux: bump version to 2.27
Message-ID: <1441977987-43640-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed 0002-program-invocation-short-name.patch since the changes it
does are now upstream:

  https://kernel.googlesource.com/pub/scm/utils/util-linux/util-linux/+/37edac9a0ca83f311279d2e49bacd6ac80310dc8

This release includes a security fix:

CVE-2015-5224 - chfn, chsh file name collision due to incorrect mkstemp
use if compiled without libuser.
[thanks to Qualys Security Advisory team; qualys.com]

Release notes here:

  https://www.kernel.org/pub/linux/utils/util-linux/v2.27/v2.27-ReleaseNotes

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 .../0002-program-invocation-short-name.patch       |   11 -----------
 package/util-linux/util-linux.hash                 |    4 ++--
 package/util-linux/util-linux.mk                   |    4 ++--
 3 files changed, 4 insertions(+), 15 deletions(-)
 delete mode 100644 package/util-linux/0002-program-invocation-short-name.patch

diff --git a/package/util-linux/0002-program-invocation-short-name.patch b/package/util-linux/0002-program-invocation-short-name.patch
deleted file mode 100644
index 95fea3f..0000000
--- a/package/util-linux/0002-program-invocation-short-name.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure.ac	2013-09-05 15:31:21.590981268 -0500
-+++ b/configure.ac	2013-09-05 15:31:29.160981049 -0500
-@@ -387,7 +387,7 @@
- 
- AC_MSG_CHECKING([whether program_invocation_short_name is defined])
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
--	#include <argp.h>
-+	#include <errno.h>
- ]], [[
- 	program_invocation_short_name = "test";
- ]])], [
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index e04d78f..b97bda2 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/util-linux/v2.26/sha256sums.asc
-sha256	0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666	util-linux-2.26.2.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.27/sha256sums.asc
+sha256 fcbf04e3ef8377fc8369af7f9afee341c5eef9b02dd5a7ce71532d0957e86dc7  util-linux-2.27.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a44a45e..3669d5c 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).2
-UTIL_LINUX_VERSION_MAJOR = 2.26
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MAJOR = 2.27
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
1.7.1
