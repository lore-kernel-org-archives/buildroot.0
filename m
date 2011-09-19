From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 19 Sep 2011 10:13:37 +0200
Subject: [Buildroot] [git commit] barebox: patch-kernel.sh is no more
Message-ID: <20110919081416.23C6C8D701@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dcb43a0eb0c09ffb84c6c7b4c169a2874cb24cc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thanks to Sven Neumann for noticing.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 8826ef9..c3510fd 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -22,7 +22,7 @@ endif
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	toolchain/patch-kernel.sh $(@D) $(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
+	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \
 		barebox-$(BAREBOX_VERSION)-\*.patch
 endef
 
