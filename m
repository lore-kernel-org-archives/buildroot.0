From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 17 Dec 2015 00:57:47 +0100
Subject: [Buildroot] [PATCH] pkg-generic: remove unused NAMEVER
Message-ID: <1450310267-14329-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5538e476 (from 2013!) removed the use of the NAMEVER variable in
.stamp_patched, but it was still defined. So remove the definition now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 357a5c7..1e024d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -153,7 +153,6 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 # prefix of the patches
 #
 # For BR2_GLOBAL_PATCH_DIR, only generate if it is defined
-$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS =  $(PKGDIR)
 $(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS += $(addsuffix /$(RAWNAME),$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)))
 $(BUILD_DIR)/%/.stamp_patched:
-- 
2.6.4
