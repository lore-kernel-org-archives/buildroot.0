From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 27 Sep 2010 17:55:18 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: pass ARCH/CROSS_COMPILE
	when running make <board>_config
Message-ID: <20100927160104.1654E8B6EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a0b6710b88e7423a8f76a4b35a4a34fc55f3dead
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gets rid of a bunch of (ignored) errors about missing cross compiler.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 boot/u-boot/u-boot.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 7b6b2ce..f97674a 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -88,7 +88,8 @@ ifeq ($(U_BOOT_BOARD_NAME),)
 endif
 	$(TARGET_CONFIGURE_OPTS)		\
 		$(U_BOOT_CONFIGURE_OPTS) \
-		$(MAKE) -C $(U_BOOT_DIR)	\
+		$(MAKE) -C $(U_BOOT_DIR) \
+		CROSS_COMPILE="$(TARGET_CROSS)" ARCH=$(U_BOOT_ARCH) \
 		$(U_BOOT_BOARD_NAME)_config
 	touch $@
 
-- 
1.7.1
