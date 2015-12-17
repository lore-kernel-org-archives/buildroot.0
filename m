From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:53:16 +0100
Subject: [Buildroot] [git commit] pkg-generic: remove unused NAMEVER
Message-ID: <20151217105348.0310182531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f464fdfa93560e33a46192e59500d222fb7004a3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 5538e476 (from 2013!) removed the use of the NAMEVER variable in
.stamp_patched, but it was still defined. So remove the definition now.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
