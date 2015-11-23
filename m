From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 23 Nov 2015 15:47:35 +0100
Subject: [Buildroot] [PATCH 05/51] core/legal-info: use the macro to install
	source archives
In-Reply-To: <cover.1448289515.git.yann.morin.1998@free.fr>
References: <cover.1448289515.git.yann.morin.1998@free.fr>
Message-ID: <f7b80c9adbb10a7c583783eabd188a8f84e37de1.1448289515.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pkg-generic.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 357a5c7..e69c970 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -805,9 +805,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
 ifneq ($$($(2)_ACTUAL_SOURCE_TARBALL),$$($(2)_SOURCE))
 	$$(call DOWNLOAD,$$($(2)_ACTUAL_SOURCE_SITE)/$$($(2)_ACTUAL_SOURCE_TARBALL))
 endif
-# Copy the source tarball (just hardlink if possible)
-	@cp -l $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))) 2>/dev/null || \
-	    cp $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL) $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4)))
+# Copy the source tarball
+	$$(Q)$$(call hardlink-copy,\
+		     $$(DL_DIR)/$$($(2)_ACTUAL_SOURCE_TARBALL),\
+		     $$(REDIST_SOURCES_DIR_$$(call UPPERCASE,$(4))))
 endif # redistribute
 
 endif # other packages
-- 
1.9.1
