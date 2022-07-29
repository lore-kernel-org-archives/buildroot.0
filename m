Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A49CC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 08:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FAB83FC2;
	Fri, 29 Jul 2022 08:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FAB83FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DJcUIoz4T-Ve; Fri, 29 Jul 2022 08:34:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34D1083F03;
	Fri, 29 Jul 2022 08:34:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34D1083F03
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 305CB1BF308
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 081854016A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 08:34:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 081854016A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMxlVB0QFu42 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 08:34:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30DB740B44
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30DB740B44
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E1AFE86796; Fri, 29 Jul 2022 08:20:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 10:34:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c074e73b00b082a69261101485e269823a539ea
X-Git-Newrev: b1eb5b9bb61deedc44095efd83dff6d2575f5f2b
X-Patchwork-Hint: ignore
Message-Id: <20220729082056.E1AFE86796@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/licheepi_zero_defconfig: add
 missing BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1eb5b9bb61deedc44095efd83dff6d2575f5f2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800773

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/licheepi_zero_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/licheepi_zero_defconfig b/configs/licheepi_zero_defconfig
index d7a281a0a0..0d3115a996 100644
--- a/configs/licheepi_zero_defconfig
+++ b/configs/licheepi_zero_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="LicheePi_Zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
