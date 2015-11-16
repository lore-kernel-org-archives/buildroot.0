From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:11 +0100
Subject: [Buildroot] [PATCH 16/21 RFC] core/legal-info: use the macro to
	install source archives
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <b6d1b94e48a8140d330e261bb4c1be1970014135.1447713615.git.yann.morin.1998@free.fr>
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
index 82fbeb0..a04adcf 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -819,9 +819,10 @@ ifeq ($$($(2)_REDISTRIBUTE),YES)
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
