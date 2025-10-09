Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2822CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 572E061269;
	Thu,  9 Oct 2025 10:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iaky3cjsNZYw; Thu,  9 Oct 2025 10:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A0F961258
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A0F961258;
	Thu,  9 Oct 2025 10:16:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3469721B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AE6540DE6
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7Q9_KnsXqGc for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0096240F7A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0096240F7A
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:15:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC0CE86E17; Thu,  9 Oct 2025 10:15:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:28:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 54b64f242f40ca283e4dd19f14df6a4a39a06afa
X-Git-Newrev: a5ebfd4b7e46ad53926b6380199b1b5484820b47
X-Patchwork-Hint: ignore
Message-Id: <20251009101559.DC0CE86E17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-firmware:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5ebfd4b7e46ad53926b6380199b1b5484820b47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index 6b3a4bee24..f890349be5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -247,14 +247,14 @@ LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
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
