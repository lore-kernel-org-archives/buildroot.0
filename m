Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F28CCD18A
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAC4661375;
	Thu,  9 Oct 2025 09:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eq5tyFDm19bA; Thu,  9 Oct 2025 09:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65B6611D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C65B6611D8;
	Thu,  9 Oct 2025 09:56:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4889F119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8C0440D63
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id euEUjoC5xKF7 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C003C40DAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C003C40DAF
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD7E986C36; Thu,  9 Oct 2025 09:55:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:28:25 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 2aa666522c159d2d7052ae15aede06b2ede18497
X-Git-Newrev: bc6d119ba22ca36e24bdb9fd990bf4197b07c56e
X-Patchwork-Hint: ignore
Message-Id: <20251009095539.AD7E986C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/linux-firmware:
 fix license file for ath10k firmware
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bc6d119ba22ca36e24bdb9fd990bf4197b07c56e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

The WHENCE file [1] indicates ath10k's license file is
LICENSE.QualcommAtheros_ath10k license and not LICENCE.atheros_firmware.

[1] https://gitlab.com/kernel-firmware/linux-firmware/-/blob/20250627/WHENCE#L3700

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
[Julien: add link to WHENCE file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 752fc349a05910a08b08467e2f28fd80f1c239a1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 5b03aeb595..cfb02b02d7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -262,14 +262,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
 			ath10k/QCA9377/hw1.0/firmware-5.bin \
 			ath10k/QCA9377/hw1.0/firmware-6.bin \
 			ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA998X),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA988X/hw2.0/board.bin \
 			ath10k/QCA988X/hw2.0/firmware-4.bin \
 			ath10k/QCA988X/hw2.0/firmware-5.bin
-LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
 endif
 
 # sd8686 v8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
