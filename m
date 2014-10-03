From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:41 +0200
Subject: [Buildroot] [PATCH 07/25 v7] docs/manual: manual-update-lists is
	not a generic GENDOC rule
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <3c55ce03e9ff33f61569f927ccf1b7e994fb397e.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move the manual-update-lists .PHONY declaration out of GENDOC, since not
all the documents may have an -update-lists rule.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 56dff56..3b79716 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,5 +1,6 @@
 # Packages included in BR2_EXTERNAL are not part of buildroot, so they
 # should not be included in the manual.
+.PHONY: manual-update-lists
 manual-update-lists: manual-check-dependencies-lists $(BUILD_DIR)/docs/$(pkgname)
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(BUILD_DIR)/docs/$(pkgname) \
@@ -140,7 +141,7 @@ $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
 $(pkgname)-clean:
 	$$(Q)$$(RM) -rf $$(BUILD_DIR)/docs/$(pkgname)
-.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
+.PHONY: $(pkgname) $(pkgname)-clean
 endef
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
-- 
1.9.1
