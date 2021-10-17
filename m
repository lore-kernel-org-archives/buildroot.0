Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6476AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2785F60FD9
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2785F60FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFCE1606F1;
	Sun, 17 Oct 2021 20:15:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEEWwYTra2_E; Sun, 17 Oct 2021 20:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7181E606DA;
	Sun, 17 Oct 2021 20:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5BA1BF593
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7405040160
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CfMIlSPTny92 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0DF4017C
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9A4A782571; Sun, 17 Oct 2021 20:12:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 22:14:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0350a6c023ccbe4450d68d28c3797b1320087ba
X-Git-Newrev: d92f86849a75813e88f2a98a5294738d6806be9f
X-Patchwork-Hint: ignore
Message-Id: <20211017201216.9A4A782571@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-wifi-firmware: provide
 convenience symlinks
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

commit: https://git.buildroot.net/buildroot/commit/?id=d92f86849a75813e88f2a98a5294738d6806be9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provide convenience links for BCM43455/CYW43455 based RPi3A+, RPi3B+
and RPi4B WIFI firmware configuration files to avoid runtime firmware
loading warning in the kernel logs, e.g. (RPi3B+):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

or (RP4B):

  brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt failed with error -2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[me: slight rewording/rewrapping in commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
index 28926ff4f0..582e0aa8f5 100644
--- a/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
+++ b/package/rpi-wifi-firmware/rpi-wifi-firmware.mk
@@ -12,6 +12,9 @@ RPI_WIFI_FIRMWARE_LICENSE_FILES = LICENCE.broadcom_bcm43xx
 define RPI_WIFI_FIRMWARE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d $(TARGET_DIR)/lib/firmware/brcm
 	$(INSTALL) -m 0644 $(@D)/firmware/brcm/brcmfmac* $(TARGET_DIR)/lib/firmware/brcm
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+	ln -sf brcmfmac43455-sdio.txt $(TARGET_DIR)/lib/firmware/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
