From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2011 09:54:47 +0100
Subject: [Buildroot] [PATCH 5/5] doc: update
	GENTARGETS/AUTOTARGETS/CMAKETARGETS on the number of arguments
In-Reply-To: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
References: <cover.1321174391.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a6646ae086d34f5edaf34c01feb73d70f96e15b1.1321174391.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-autotargets.txt  |    2 +-
 docs/manual/adding-packages-cmaketargets.txt |    2 +-
 docs/manual/adding-packages-gentargets.txt   |   29 +++++++------------------
 3 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/docs/manual/adding-packages-autotargets.txt b/docs/manual/adding-packages-autotargets.txt
index cb41ead..428a182 100644
--- a/docs/manual/adding-packages-autotargets.txt
+++ b/docs/manual/adding-packages-autotargets.txt
@@ -23,7 +23,7 @@ package, with an example :
 11: LIBFOO_CONF_OPT = --enable-shared
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call AUTOTARGETS,package,libfoo))
+14: $(eval $(call AUTOTARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
diff --git a/docs/manual/adding-packages-cmaketargets.txt b/docs/manual/adding-packages-cmaketargets.txt
index b03eb68..3e400ec 100644
--- a/docs/manual/adding-packages-cmaketargets.txt
+++ b/docs/manual/adding-packages-cmaketargets.txt
@@ -23,7 +23,7 @@ with an example :
 11: LIBFOO_CONF_OPT = -DBUILD_DEMOS=ON
 12: LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
 13:
-14: $(eval $(call CMAKETARGETS,package,libfoo))
+14: $(eval $(call CMAKETARGETS))
 ------------------------
 
 On line 6, we declare the version of the package.
diff --git a/docs/manual/adding-packages-gentargets.txt b/docs/manual/adding-packages-gentargets.txt
index 9a319d1..29fc640 100644
--- a/docs/manual/adding-packages-gentargets.txt
+++ b/docs/manual/adding-packages-gentargets.txt
@@ -38,7 +38,7 @@ system is based on hand-written Makefiles or shell scripts.
 24: 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
 25: endef
 26:
-27: $(eval $(call GENTARGETS,package,libfoo))
+27: $(eval $(call GENTARGETS))
 --------------------------------
 
 The Makefile begins on line 6 to 8 with metadata information: the
@@ -84,32 +84,19 @@ Makefile code necessary to make your package working.
 +GENTARGETS+ Reference
 ~~~~~~~~~~~~~~~~~~~~~~
 
-The +GENTARGETS+ macro takes three arguments:
-
-* The first argument is the package directory prefix. If your package
-  is in +package/libfoo+, then the directory prefix is +package+. If
-  your package is in +package/editors/foo+, then the directory prefix
-  must be +package/editors+.
-
-* The second argument is the lower-cased package name. It must match
-  the prefix of the variables in the +.mk+ file and must match the
-  configuration option name in the +Config.in+ file. For example, if
-  the package name is +libfoo+, then the variables in the +.mk+ file
-  must start with +LIBFOO_+ and the configuration option in the
-  +Config.in+ file must be +BR2_PACKAGE_LIBFOO+.
-
-* The third argument is optional. It can be used to tell if the
-  package is a target package (cross-compiled for the target) or a
-  host package (natively compiled for the host). If unspecified, it is
-  assumed that it is a target package. See below for details.
+The +GENTARGETS+ macro takes one optional argument. This argument can
+be used to tell if the package is a target package (cross-compiled for
+the target) or a host package (natively compiled for the host). If
+unspecified, it is assumed that it is a target package. See below for
+details.
 
 For a given package, in a single +.mk+ file, it is possible to call
 GENTARGETS twice, once to create the rules to generate a target
 package and once to create the rules to generate a host package:
 
 ----------------------
-$(eval $(call GENTARGETS,package,libfoo))
-$(eval $(call GENTARGETS,package,libfoo,host))
+$(eval $(call GENTARGETS))
+$(eval $(call GENTARGETS,host))
 ----------------------
 
 This might be useful if the compilation of the target package requires
-- 
1.7.4.1
