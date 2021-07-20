Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74986C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:13:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8EB6103C
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B8EB6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1589142396;
	Wed,  4 Aug 2021 00:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3u83oJwLOnNb; Wed,  4 Aug 2021 00:13:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5482E42370;
	Wed,  4 Aug 2021 00:13:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24F471BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 403AB40F85
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n-fZql8yMYXz for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30E2D4015B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8833985583; Tue,  3 Aug 2021 21:10:11 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 22:10:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1ba6a3090547cbf1942078471d0d57c169f0022a
X-Git-Newrev: e57e59233cfb8e689855651c23b78dc4aea40484
X-Patchwork-Hint: ignore
Message-Id: <20210803211011.8833985583@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/linux-firmware: bump
 version to 20210511
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=e57e59233cfb8e689855651c23b78dc4aea40484
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- update hash of WHENCE file

- update BRCM_BCM43XX and BRCM_BCM43XXX entries (omitting the new ones with
  spaces in the path name 'brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt' and
  'brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt') and convert to one
  entry per line format (easier to parse and update)

- fix WHENCE evaluation for new link entries with spaces (otherwise
  reports the following warning '/bin/sh: line 1: test: too many arguments'
  and does not create the link), e.g.:

	Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
	Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash |  4 +--
 package/linux-firmware/linux-firmware.mk   | 55 ++++++++++++++++++++----------
 2 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index 12af68f2d3..22d6ddf88f 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  f97d6d884026c5e3641909946713dcfea580c307d47830d37d42bfcc9a93870a  linux-firmware-20201022-br1.tar.gz
+sha256  4341b33c64afd8e471de06f1459f63a76445b1ea83055fe3d4103dfb2e1b25ec  linux-firmware-20210511-br1.tar.gz
 sha256  8116433f4004fc0c24d72b3d9e497808b724aa0e5e1cd63fc1bf66b715b1e2e9  LICENCE.Abilis
 sha256  8d5847d2971241d4d6a51c16e206379de53a6d4e203fa6f8e1c1e9279c7c4ad0  LICENSE.amdgpu
 sha256  2d6062d63b91eb750bf741498691604f75184b9fee97608ec537cd09bd6a42b4  LICENCE.Marvell
@@ -30,6 +30,6 @@ sha256  8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e  LICENS
 sha256  be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc  LICENSE.qcom
 sha256  fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f  LICENSE.radeon
 sha256  2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9  LICENSE.sdma_firmware
-sha256  18313654864adbb76514e21566528ce57eff42a2a7a66d5823f1f91e895816ea  WHENCE
+sha256  dcc87a24f18d46a73985e68c378ec6d7e7fd4083eb4d4f3130a34fe3f75aff6f  WHENCE
 sha256  fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a  qcom/NOTICE.txt
 sha256  bef9c828e84f21e7835b4de7daf954a327e1ff777871b58e116039b684c0d604  LICENCE.e100
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9f3f4e8635..69b1226cca 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_FIRMWARE_VERSION = 20201022
+LINUX_FIRMWARE_VERSION = 20210511
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 LINUX_FIRMWARE_INSTALL_IMAGES = YES
@@ -590,26 +590,45 @@ endif
 # brcm43xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
 LINUX_FIRMWARE_FILES += \
-	brcm/bcm43xx-0.fw brcm/bcm43xx_hdr-0.fw \
-	brcm/bcm4329-fullmac-4.bin brcm/brcmfmac4329-sdio.bin \
-	brcm/brcmfmac4330-sdio.bin brcm/brcmfmac4334-sdio.bin \
-	brcm/brcmfmac4335-sdio.bin brcm/brcmfmac4339-sdio.bin \
-	brcm/brcmfmac4350-pcie.bin brcm/brcmfmac4354-sdio.bin \
-	brcm/brcmfmac4356-pcie.bin brcm/brcmfmac4371-pcie.bin
+	brcm/bcm4329-fullmac-4.bin \
+	brcm/brcmfmac4329-sdio.bin \
+	brcm/brcmfmac4330-sdio.bin \
+	brcm/brcmfmac4334-sdio.bin \
+	brcm/brcmfmac4335-sdio.bin \
+	brcm/brcmfmac4350c2-pcie.bin \
+	brcm/brcmfmac4350-pcie.bin \
+	brcm/brcmfmac4358-pcie.bin \
+	brcm/brcmfmac4371-pcie.bin \
+	brcm/brcmfmac4373.bin \
+	brcm/brcmfmac4330-sdio.Prowise-PT301.txt \
+	brcm/brcmfmac4356-pcie.gpd-win-pocket.txt \
+	brcm/brcmfmac4356-sdio.vamrs,rock960.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm43xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX),y)
 LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac43143.bin brcm/brcmfmac43143-sdio.bin \
-	brcm/brcmfmac43236b.bin brcm/brcmfmac43241b0-sdio.bin \
-	brcm/brcmfmac43241b4-sdio.bin brcm/brcmfmac43241b5-sdio.bin \
-	brcm/brcmfmac43242a.bin brcm/brcmfmac43340-sdio.bin \
-	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
-	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
-	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43143.bin \
+	brcm/brcmfmac43143-sdio.bin \
+	brcm/brcmfmac43236b.bin \
+	brcm/brcmfmac43241b0-sdio.bin \
+	brcm/brcmfmac43241b4-sdio.bin \
+	brcm/brcmfmac43241b5-sdio.bin \
+	brcm/brcmfmac43242a.bin \
+	brcm/brcmfmac43430a0-sdio.bin \
+	brcm/brcmfmac43569.bin \
+	brcm/brcmfmac43602-pcie.ap.bin \
+	brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43340-sdio.meegopad-t08.txt \
+	brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt \
+	brcm/brcmfmac43340-sdio.predia-basic.txt \
+	brcm/brcmfmac43362-sdio.cubietech,cubietruck.txt \
+	brcm/brcmfmac43430a0-sdio.ilife-S806.txt \
+	brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt \
+	brcm/brcmfmac43430-sdio.AP6212.txt \
+	brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt \
+	brcm/brcmfmac43430-sdio.MUR1DX.txt \
 	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt \
 	brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
@@ -714,9 +733,9 @@ define LINUX_FIRMWARE_INSTALL_FW
 	cd $(1) ; \
 	sed -r -e '/^Link: (.+) -> (.+)$$/!d; s//\1 \2/' $(@D)/WHENCE | \
 	while read f d; do \
-		if test -f $$(readlink -m $$(dirname $$f)/$$d); then \
-			mkdir -p $$(dirname $$f) || exit 1; \
-			ln -sf $$d $$f || exit 1; \
+		if test -f $$(readlink -m $$(dirname "$$f")/$$d); then \
+			mkdir -p $$(dirname "$$f") || exit 1; \
+			ln -sf $$d "$$f" || exit 1; \
 		fi ; \
 	done
 endef
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
