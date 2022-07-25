Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A1DC43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C243884889;
	Mon, 25 Jul 2022 10:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C243884889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6reLgHCFSdJ; Mon, 25 Jul 2022 10:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEEB183F27;
	Mon, 25 Jul 2022 10:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEEB183F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA07B1BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3EBE60C23
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3EBE60C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z2ash_uM-r0g for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:46:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3FC660B36
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3FC660B36
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6460B85D40; Mon, 25 Jul 2022 10:32:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 12:45:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5399a7a55bbc596bf4d41b106beda5eea369328b
X-Git-Newrev: 286d8cc8510c5879392801f6c49ec3278908766f
X-Patchwork-Hint: ignore
Message-Id: <20220725103247.6460B85D40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brcmfmac_sdio-firmware-rpi:
 support riscv architecture
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

commit: https://git.buildroot.net/buildroot/commit/?id=286d8cc8510c5879392801f6c49ec3278908766f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These firmware files are also applicable to some Riscv hosts.

Simply remove the architecture dependency. The intention was to only
show it for RaspberryPi, but that's half-baked anyway.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/brcmfmac_sdio-firmware-rpi/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/brcmfmac_sdio-firmware-rpi/Config.in b/package/brcmfmac_sdio-firmware-rpi/Config.in
index 73f400a2b7..cf41564972 100644
--- a/package/brcmfmac_sdio-firmware-rpi/Config.in
+++ b/package/brcmfmac_sdio-firmware-rpi/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_BRCMFMAC_SDIO_FIRMWARE_RPI
 	bool "brcmfmac-sdio-firmware-rpi"
-	depends on BR2_arm || BR2_aarch64
 	help
 	  Raspberry Broadcom Bluetooth and Wifi firmware.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
