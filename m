From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 29 Jul 2014 23:12:30 +0200
Subject: [Buildroot] [PATCH 03 of 20] pkg-generic: add check on deprecated
 variable FOO_MAKE_OPT
In-Reply-To: <patchbomb.1406668347@localhost>
References: <patchbomb.1406668347@localhost>
Message-ID: <9b89581eb95a3c1678ca.1406668350@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch introduces a check for the usage of deprecated variable
FOO_MAKE_OPT, and suggests to use FOO_MAKE_OPTS instead.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-generic.mk |  3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff -r 7372c704f6a9 -r 9b89581eb95a package/pkg-generic.mk
--- a/package/pkg-generic.mk	Mon Jul 28 21:19:08 2014 +0200
+++ b/package/pkg-generic.mk	Mon Jul 28 21:28:40 2014 +0200
@@ -717,6 +717,9 @@
 	$$(eval $$(call virt-provides-single,$$(pkg),$$(call UPPERCASE,$$(pkg)),$(1))$$(sep)))
 endif
 
+# Ensure unified variable name conventions between all packages
+$(eval $(call check-deprecated-variable,$(2)_MAKE_OPT,$(2)_MAKE_OPTS))
+
 TARGETS += $(1)
 
 ifneq ($$($(2)_PERMISSIONS),)
