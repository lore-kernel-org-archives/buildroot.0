Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824D3CD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EE1607C1;
	Tue,  3 Sep 2024 19:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZdHROMfc69S; Tue,  3 Sep 2024 19:51:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65BB8607C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65BB8607C3;
	Tue,  3 Sep 2024 19:51:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EDD51BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C97B607C3
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRpXtk3NcTyr for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B438607C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B438607C1
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85A1686BE1; Tue,  3 Sep 2024 19:51:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:51:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f0d9f976e5a9bce04d737f981c902615eb2083d3
X-Git-Newrev: c7c2aa477fe9b70bfa9ddcd52c0d27a96b7fdec6
X-Patchwork-Hint: ignore
Message-Id: <20240903195155.85A1686BE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/pine64: bump TF-A
 version to 2.10.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7c2aa477fe9b70bfa9ddcd52c0d27a96b7fdec6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pine64_defconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/pine64_defconfig b/configs/pine64_defconfig
index a6ddf6e57b..fb3a468f2d 100644
--- a/configs/pine64_defconfig
+++ b/configs/pine64_defconfig
@@ -8,9 +8,8 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_0=y
 # Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.7"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="lts-v2.10.5"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
 # Bootloader
 BR2_TARGET_UBOOT=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
