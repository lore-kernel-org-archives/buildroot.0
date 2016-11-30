From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Nov 2016 16:10:30 +0100
Subject: [Buildroot] [git commit] uboot: support -b option for mkenvimage
Message-ID: <20161130151601.8559580E31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf5487e21e539e474062ee3ace1ac8fb844e38a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When generating the environment image the target endianess should
be taken in account for CRC calculation purposes. For big endian
targets the -b flag should be passed to the mkenvimage tool.

Signed-off-by: Tiago Brusamarello <tiago.brusamarello@datacom.ind.br>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 3e347c1..6b9d544 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -223,6 +223,7 @@ define UBOOT_INSTALL_IMAGES_CMDS
 		cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) | \
 			$(HOST_DIR)/usr/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
 			$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
+			$(if $(filter BIG,$(BR2_ENDIAN)),-b) \
 			-o $(BINARIES_DIR)/uboot-env.bin -)
 endef
 
