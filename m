From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 May 2015 14:33:18 +0200
Subject: [Buildroot] [git commit] barebox: unbreak custom patch handling
	after 0eba4759 (packages: apply custom patches using *.patch
	instead of <pkg>-*.patch)
Message-ID: <20150504123645.31F177FED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8721c03a7f849af3c7f6577d6e77086332bdcc7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit accidently dropped the continuation character (\), breaking the logic.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/barebox/barebox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
index 764791d..294acbd 100644
--- a/boot/barebox/barebox.mk
+++ b/boot/barebox/barebox.mk
@@ -30,7 +30,7 @@ BAREBOX_LICENSE_FILES = COPYING
 
 ifneq ($(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR)),)
 define BAREBOX_APPLY_CUSTOM_PATCHES
-	$(APPLY_PATCHES) $(@D)
+	$(APPLY_PATCHES) $(@D) \
 		$(BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR) \*.patch
 endef
 
