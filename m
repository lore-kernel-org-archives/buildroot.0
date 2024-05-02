Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107DAC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 11:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D00FA60EAF;
	Thu,  2 May 2024 11:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubf1FPs_9mrq; Thu,  2 May 2024 11:22:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C12960EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C12960EB7;
	Thu,  2 May 2024 11:22:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24C171BF2A9
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F1F860DE5
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:22:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qt-ta8ZWSHG7 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 11:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 922BC60E96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 922BC60E96
 for <buildroot@buildroot.org>; Thu,  2 May 2024 11:22:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87EE086619; Thu,  2 May 2024 11:22:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 13:18:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a22a40a1dc7a459e0f8a503aae182f2c50791f05
X-Git-Newrev: 762717fdcfc56664f5b4ff183d2faf90006f4337
X-Patchwork-Hint: ignore
Message-Id: <20240502112239.87EE086619@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/brcmfmac_sdio-firmware-rpi: bump version to 26ff205
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=762717fdcfc56664f5b4ff183d2faf90006f4337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The current version is more than 2 years old. Update to the latest.

This fixes runtime issues with the newer kernel used in our defconfigs
since commit 13ba668a2da3a0dcb386578ce15b00a444101dbe.

License file changed name from LICENCE to LICENSE but is otherwise
unchanged.

There is a new directory "synaptics", install this one as well.

A lot of the files are symlinks. "install" creates copies for these,
which consumes a lot of unnecessary space. Instead of individually
restoring the links, using `cp --remove-destination --no-dereference`
and `chmod` instead of `install`.

Fixes: 13ba668a2da3a0dcb386578ce15b00a444101dbe
Signed-off-by: Nisarg Jhaveri <nisargjhaveri@gmail.com>
[Arnout: correct license file name]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit ab2410053770b92ec1ee12d9da271b432053c38c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../brcmfmac_sdio-firmware-rpi.hash                |  4 ++--
 .../brcmfmac_sdio-firmware-rpi.mk                  | 27 ++++++++--------------
 2 files changed, 12 insertions(+), 19 deletions(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
index a12e92cbac..c20abfc26c 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e51b717c2a60ca29fcdd8e04e07c00996226cb48fa56a8ad1934b5f4ddee2e3d  brcmfmac_sdio-firmware-rpi-ea9963f3f77b4bb6cd280577eb115152bdd67e8d.tar.gz
-sha256  b16056fc91b82a0e3e8de8f86c2dac98201aa9dc3cbd33e8d38f1b087fcec30d  LICENCE.broadcom_bcm43xx
+sha256  2f0917b104739455dd488dd8f5af2ee4430801a7ac8fe8d9866e74bfbb185356  brcmfmac_sdio-firmware-rpi-26ff205b45dc109b498a70aaf182804ad9dbfea5.tar.gz
+sha256  ea8b7b7b6cfc6fd30587ed977100f6a542734ce53218b5b63de16180acddd599  LICENSE
diff --git a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
index 5332bf53d7..95707487a9 100644
--- a/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
+++ b/package/brcmfmac_sdio-firmware-rpi/brcmfmac_sdio-firmware-rpi.mk
@@ -4,33 +4,26 @@
 #
 ################################################################################
 
-BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = ea9963f3f77b4bb6cd280577eb115152bdd67e8d
+BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION = 26ff205b45dc109b498a70aaf182804ad9dbfea5
 BRCMFMAC_SDIO_FIRMWARE_RPI_SITE = $(call github,LibreELEC,brcmfmac_sdio-firmware-rpi,$(BRCMFMAC_SDIO_FIRMWARE_RPI_VERSION))
 BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE = PROPRIETARY
-BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENCE.broadcom_bcm43xx
+BRCMFMAC_SDIO_FIRMWARE_RPI_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_BT),y)
 define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_BT
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
-	$(INSTALL) -m 0644 $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $(TARGET_DIR)/lib/firmware/synaptics
+	cp --remove-destination --no-dereference $(@D)/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/brcm
+	cp --remove-destination --no-dereference $(@D)/firmware/synaptics/*.hcd $(TARGET_DIR)/lib/firmware/synaptics
+	chmod 644 $(TARGET_DIR)/lib/firmware/brcm/*.hcd $(TARGET_DIR)/lib/firmware/synaptics/*.hcd
 endef
 endif
 
 ifeq ($(BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI_WIFI),y)
 define BRCMFMAC_SDIO_FIRMWARE_RPI_INSTALL_TARGET_WIFI
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
-	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
-	ln -sf ../cypress/cyfmac43430-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.bin
-	ln -sf ../cypress/cyfmac43430-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.clm_blob
-	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt
-	ln -sf brcmfmac43430-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt
-	ln -sf ../cypress/cyfmac43455-sdio.bin $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.bin
-	ln -sf ../cypress/cyfmac43455-sdio.clm_blob $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.clm_blob
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
-	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
-	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/cypress
-	$(INSTALL) -m 0644 $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
+	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm $(TARGET_DIR)/lib/firmware/cypress
+	cp --remove-destination --no-dereference $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	cp --remove-destination --no-dereference $(@D)/firmware/cypress/cyfmac* $(TARGET_DIR)/lib/firmware/cypress
+	chmod 644 $(TARGET_DIR)/lib/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/cypress/cyfmac*
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
