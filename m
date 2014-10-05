From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 05 Oct 2014 09:58:31 +0200
Subject: [Buildroot] [PATCH 1 of 2] check-deprecated-variable: move from
 pkg-generic.mk to pkg-utils.mk
Message-ID: <98b4f7f5e2ea63e41fa1.1412495911@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  15 ---------------
 package/pkg-utils.mk   |   9 +++++++++
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -264,21 +264,6 @@
 endef
 
 ################################################################################
-# check-deprecated-variable -- throw an error on deprecated variables
-#
-# argument 1 is the deprecated variable
-# argument 2 is the new variable to use
-#
-# example:
-#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
-################################################################################
-define check-deprecated-variable
-ifneq ($$(origin $(1)),undefined)
-$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
-endif
-endef
-
-################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
 #
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -88,6 +88,15 @@
 
 endef
 
+# check-deprecated-variable -- throw an error on deprecated variables
+# example:
+#   $(eval $(call check-deprecated-variable,FOO_MAKE_OPT,FOO_MAKE_OPTS))
+define check-deprecated-variable # (deprecated var, new var)
+ifneq ($$(origin $(1)),undefined)
+$$(error Package error: use $(2) instead of $(1). Please fix your .mk file)
+endif
+endef
+
 #
 # legal-info helper functions
 #
