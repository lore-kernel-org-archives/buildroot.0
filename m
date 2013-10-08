From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Oct 2013 20:17:07 +0200
Subject: [Buildroot] [PATCHv3 10/20] toolchain: fix the helpers.mk comment
In-Reply-To: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1381256237-27948-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit fixes various typos and mistakes in the comment at the top
of the helpers.mk file:

 * usefull -> useful

 * The optional stripping of libraries no longer exists, so there's no
   reason to mention it.

 * Indicate that the copy_toolchain_lib_root function is also used by
   the glibc package, not only by the external toolchain logic.

 * Separate more clearly the top comment introducing the entire file,
   from the comment introducing the first function.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 37f2cf9..d9051ae 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -1,9 +1,11 @@
-# This Makefile fragment declares helper functions, usefull to handle
+# This Makefile fragment declares helper functions, useful to handle
 # non- buildroot-built toolchains, eg. purely external toolchains.
-#
-# Copy a toolchain library and its symbolic links from the sysroot
-# directory to the target directory. Also optionaly strips the
-# library.
+
+# The copy_toolchain_lib_root function copies a toolchain library and
+# its symbolic links from the sysroot directory to the target
+# directory. Note that this function is used both the external
+# toolchain logic, and the glibc package, so care must be taken when
+# changing this function.
 #
 # Most toolchains (CodeSourcery ones) have their libraries either in
 # /lib or /usr/lib relative to their ARCH_SYSROOT_DIR, so we search
-- 
1.8.1.2
