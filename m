Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE674C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Nov 2022 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 624F560FC1;
	Fri, 11 Nov 2022 20:19:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624F560FC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifAkpcoc49Eh; Fri, 11 Nov 2022 20:19:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4FC860BE5;
	Fri, 11 Nov 2022 20:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FC860BE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6A51B1BF42C
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 446554185E
 for <buildroot@lists.busybox.net>; Fri, 11 Nov 2022 20:19:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446554185E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENKuLWpaz16n for <buildroot@lists.busybox.net>;
 Fri, 11 Nov 2022 20:19:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AB641845
 for <buildroot@buildroot.org>; Fri, 11 Nov 2022 20:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AB641845
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DB4282D5B; Fri, 11 Nov 2022 20:19:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 11 Nov 2022 21:19:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 66653be5b85f6cbfceac51d95180f785f921b681
X-Git-Newrev: 223516b51e1a45fa86dc1ac959aed93c7434afa4
X-Patchwork-Hint: ignore
Message-Id: <20221111201945.2DB4282D5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_bl_imx8mm: U-Boot needs
 util-linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=223516b51e1a45fa86dc1ac959aed93c7434afa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

/usr/bin/ld: cannot find -lgnutls
/usr/bin/ld: cannot find -luuid
collect2: error: ld returned 1 exit status

when building U-Boot.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/3301821264

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
