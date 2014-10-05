From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 13:38:06 +0200
Subject: [Buildroot] [git commit] check-deprecated-variable: move from
	pkg-generic.mk to pkg-utils.mk
Message-ID: <20141005113901.4FC54B76E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2dc51b7c4da119de9a5dd4d7fea1fc9053eb7925
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   15 ---------------
 package/pkg-utils.mk   |    9 +++++++++
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a6d3bb2..ec8afdd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -264,21 +264,6 @@ endif
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
index 44766a0..902531d 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -88,6 +88,15 @@ define sep
 
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
