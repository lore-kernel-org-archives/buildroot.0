From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Apr 2012 16:08:09 +0200
Subject: [Buildroot] [git commit] pkg-*.mk: add some comments,
	update some existing comments
Message-ID: <20120419194555.9B9E096B1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0e6b52482f244e5da6e8011d1737b0a21cef207
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-autotargets.mk |    4 +---
 package/pkg-download.mk    |    9 +++++++++
 package/pkg-gentargets.mk  |   10 ++++------
 package/pkg-utils.mk       |   13 +++++++++++++
 4 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/package/pkg-autotargets.mk b/package/pkg-autotargets.mk
index fd118dc..c9887c2 100644
--- a/package/pkg-autotargets.mk
+++ b/package/pkg-autotargets.mk
@@ -3,9 +3,7 @@
 #
 # This file implements an infrastructure that eases development of
 # package .mk files for autotools packages. It should be used for all
-# packages that use the autotools as their build system. Non-autotools
-# packages should use the generic infrastructure in
-# package/Makefile.package.in.
+# packages that use the autotools as their build system.
 #
 # See the Buildroot documentation for details on the usage of this
 # infrastructure
diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index a565ae6..ccf819e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -1,3 +1,12 @@
+############################################################################
+#
+# This file contains the download helpers for the various package
+# infrastructures. It is used to handle downloads from HTTP servers,
+# FTP servers, Git repositories, Subversion repositories, Mercurial
+# repositories, Bazaar repositories, and SCP servers.
+#
+############################################################################
+
 # Download method commands
 WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
 SVN:=$(call qstrip,$(BR2_SVN))
diff --git a/package/pkg-gentargets.mk b/package/pkg-gentargets.mk
index a535681..1c9b458 100644
--- a/package/pkg-gentargets.mk
+++ b/package/pkg-gentargets.mk
@@ -2,9 +2,10 @@
 # Generic package infrastructure
 #
 # This file implements an infrastructure that eases development of
-# package .mk files. It should be used for all non-autotools based
-# packages. Autotools-based packages should use the specialized
-# autotools infrastructure in package/Makefile.autotools.in.
+# package .mk files. It should be used for packages that do not rely
+# on a well-known build system for which Buildroot has a dedicated
+# infrastructure (so far, Buildroot has special support for
+# autotools-based and CMake-based packages).
 #
 # See the Buildroot documentation for details on the usage of this
 # infrastructure
@@ -17,9 +18,6 @@
 #
 #   2. Description of the commands to be executed to configure, build
 #      and install the package
-#
-# The autotools infrastructure specializes this generic infrastructure
-# by already implementing the configure, build and install steps.
 ################################################################################
 
 ################################################################################
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 729f8bb..953dbc9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -1,3 +1,10 @@
+############################################################################
+#
+# This file contains various utility functions used by the package
+# infrastructure, or by the packages themselves.
+#
+############################################################################
+
 # UPPERCASE Macro -- transform its argument to uppercase and replace dots and
 # hyphens to underscores
 
@@ -16,6 +23,12 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
 			$(__tmp)))) \
      $(__tmp))
 
+#
+# Manipulation of .config files based on the Kconfig
+# infrastructure. Used by the Busybox package, the Linux kernel
+# package, and more.
+#
+
 define KCONFIG_ENABLE_OPT
        $(SED) "/\\<$(1)\\>/d" $(2)
        echo "$(1)=y" >> $(2)
