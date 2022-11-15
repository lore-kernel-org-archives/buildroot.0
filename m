Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A1DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 12:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF736404B1;
	Tue, 15 Nov 2022 12:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF736404B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reA2PTaZbhPD; Tue, 15 Nov 2022 12:54:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27939409C1;
	Tue, 15 Nov 2022 12:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27939409C1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9251BF94B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 495344021B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 495344021B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juQfIs4Aum_t for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F3AE4021F
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F3AE4021F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4738683C42; Tue, 15 Nov 2022 12:54:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:48:37 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 848643401cea201e22a4aa06a7e5a1e0a80e7abd
X-Git-Newrev: a2c54b1990767235ac85a98d4f518465608a4116
X-Patchwork-Hint: ignore
Message-Id: <20221115125402.4738683C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x]
 configs/kontron_bl_imx8mm: U-Boot needs util-linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=a2c54b1990767235ac85a98d4f518465608a4116
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes:

/usr/bin/ld: cannot find -lgnutls
/usr/bin/ld: cannot find -luuid
collect2: error: ld returned 1 exit status

when building U-Boot.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821264

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 223516b51e1a45fa86dc1ac959aed93c7434afa4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/kontron_bl_imx8mm_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
index ff376662e9..13ed1a2078 100644
--- a/configs/kontron_bl_imx8mm_defconfig
+++ b/configs/kontron_bl_imx8mm_defconfig
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
