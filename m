From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:15:03 +0200
Subject: [Buildroot] [git commit branch/next] core/legal-info: use the
	helper to install source archives
Message-ID: <20160511211510.6984E81EF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0ca22215cfa27d5c3ac1e224e08e10b2e4025c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

.. and use $(Q) instead of a hard-coded @.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 3904c09..f9c7cf8 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -803,9 +803,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Copy the source tarball (just hardlink if possible)
-	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Save the source tarball
+	$$(Q)support/scripts/hardlink-or-copy \
+		$$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) \
+		$$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
 endif # redistribute
 
 endif # other packages
