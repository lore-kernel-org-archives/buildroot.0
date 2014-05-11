From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 11 May 2014 17:38:46 +0200
Subject: [Buildroot] [PATCH 2 of 7] infra: add comment describing
 single/double dollar-sign rules
In-Reply-To: <patchbomb.1399822724@argentina>
References: <patchbomb.1399822724@argentina>
Message-ID: <32d9759c21dfe0792ff0.1399822726@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the rules with respect to variable and function references and the need
for single or double dollar signs are not trivial, add a comment in
pkg-generic.mk describing them.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -250,6 +250,19 @@ endif
 #  argument 3 is the uppercase package name, without the HOST_ prefix
 #             for host packages
 #  argument 4 is the type (target or host)
+#
+# Note about variable and function references: inside all blocks that are
+# evaluated with $(eval), which includes all 'inner-xxx-package' blocks,
+# specific rules apply with respect to variable and function references.
+# Numbered variables (parameters to the block) can be referenced with a single
+# dollar sign: $(1), $(2), $(3), etc. All other variables should be referenced
+# with a double dollar sign: $$(TARGET_DIR), $$($(2)_VERSION), etc. Also all
+# make functions should be referenced with a double dollar sign: $$(subst),
+# $$(call), $$(filter-out), etc.
+# These rules ensure that these variables and functions are only expanded during
+# the $(eval) step, and not earlier. Otherwise, unintuitive and undesired
+# behavior occurs with respect to these variables and functions.
+#
 ################################################################################
 
 define inner-generic-package
