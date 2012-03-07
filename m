From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:34:21 +0100
Subject: [Buildroot] [PATCH 08/13] pkg-*.mk: add some comments,
	update some existing comments
In-Reply-To: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
Message-ID: <cbc16362f82f41106230951e1dbda7d0752837a9.1331148806.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
index 7e25674..b58e12c 100644
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
index b8c437e..d693845 100644
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
-- 
1.7.4.1
