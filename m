From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:30:39 +0200
Subject: [Buildroot] [git commit] pkg-generic: declare phony targets as such
Message-ID: <20150406093206.D713F800FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=97eeb54598cf02d8b12752edd6d96a30b7a00be1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit improves the pkg-generic package infrastructure so that it
declares all the <pkg>-<something> targets as PHONY, which they
actually are.

[Thomas:
   - add some missing phony targets, noticed by Yann E. Morin;
   - put one target per line, order alphabetically. Makes it easier to
     spot missing targets.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk |   30 ++++++++++++++++++++++++++++++
 1 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9070f8b..f77aab2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -777,6 +777,36 @@ ifneq ($$(call suitable-extractor,$$($(2)_SOURCE)),$$(XZCAT))
 DL_TOOLS_DEPENDENCIES += $$(firstword $$(call suitable-extractor,$$($(2)_SOURCE)))
 endif
 
+# Ensure all virtual targets are PHONY. Listed alphabetically.
+.PHONY:	$(1) \
+	$(1)-all-external-deps \
+	$(1)-all-legal-info \
+	$(1)-all-source \
+	$(1)-build \
+	$(1)-clean-for-rebuild \
+	$(1)-clean-for-reconfigure \
+	$(1)-clean-for-reinstall \
+	$(1)-configure \
+	$(1)-depends \
+	$(1)-dirclean \
+	$(1)-external-deps \
+	$(1)-extract \
+	$(1)-graph-depends \
+	$(1)-install \
+	$(1)-install-host \
+	$(1)-install-images \
+	$(1)-install-staging \
+	$(1)-install-target \
+	$(1)-legal-info \
+	$(1)-patch \
+	$(1)-rebuild \
+	$(1)-reconfigure \
+	$(1)-reinstall \
+	$(1)-rsync \
+	$(1)-show-depends \
+	$(1)-show-version \
+	$(1)-source
+
 endif # $(2)_KCONFIG_VAR
 endef # inner-generic-package
 
