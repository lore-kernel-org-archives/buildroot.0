From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 15:24:14 +0200
Subject: [Buildroot] [git commit] toolchain: fix the helpers.mk comment
Message-ID: <20131009143430.248FE9B970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e0cd951fe864415dbcaa75e236fc4766cf1dd3d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit fixes various typos and mistakes in the comment at the top
of the helpers.mk file:

 * usefull -> useful

 * The optional stripping of libraries no longer exists, so there's no
   reason to mention it.

 * Indicate that the copy_toolchain_lib_root function is also used by
   the glibc package, not only by the external toolchain logic.

 * Separate more clearly the top comment introducing the entire file,
   from the comment introducing the first function.

[Peter: reword top comment, add missing 'by']
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/helpers.mk |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 37f2cf9..0144674 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -1,9 +1,10 @@
-# This Makefile fragment declares helper functions, usefull to handle
-# non- buildroot-built toolchains, eg. purely external toolchains.
-#
-# Copy a toolchain library and its symbolic links from the sysroot
-# directory to the target directory. Also optionaly strips the
-# library.
+# This Makefile fragment declares toolchain related helper functions.
+
+# The copy_toolchain_lib_root function copies a toolchain library and
+# its symbolic links from the sysroot directory to the target
+# directory. Note that this function is used both by the external
+# toolchain logic, and the glibc package, so care must be taken when
+# changing this function.
 #
 # Most toolchains (CodeSourcery ones) have their libraries either in
 # /lib or /usr/lib relative to their ARCH_SYSROOT_DIR, so we search
