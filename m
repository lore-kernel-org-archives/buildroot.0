Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0109C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15B3B409E3;
	Tue,  2 Jan 2024 21:16:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15B3B409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JfstMwMlrgAy; Tue,  2 Jan 2024 21:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0489740A69;
	Tue,  2 Jan 2024 21:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0489740A69
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61E191BF966
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39A0240A5D
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 21:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39A0240A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NMUZGCjMCLEx for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23DBB409E3
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 21:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23DBB409E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0063683D17; Tue,  2 Jan 2024 21:16:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:14:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7077476c8c85f23897ce14a203cc91596a63b202
X-Git-Newrev: 46fcdf07be310a49d9731031e2c3676c12e2d7f6
X-Patchwork-Hint: ignore
Message-Id: <20240102211610.0063683D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/broadcom_northstar_defconfig:
 adjust DTS paths
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
Content-Type: multipart/mixed; boundary="===============4679012437907318321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4679012437907318321==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=46fcdf07be310a49d9731031e2c3676c12e2d7f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting with kernel release v6.5 ARM DTS files are placed in vendor
subdirectories (Linux commit 724ba6751532 ("ARM: dts: Move .dts files to
vendor sub-directories")).

This fixes:
make[3]: *** No rule to make target 'arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dtb'.  Stop.
make[2]: *** [Makefile:1384: bcm4708-smartrg-sr400ac.dtb] Error 2
make[3]: *** No rule to make target 'arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dtb'.  Stop.
make[2]: *** [Makefile:1384: bcm47094-luxul-xwr-3150-v1.dtb] Error 2

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/broadcom_northstar_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/broadcom_northstar_defconfig b/configs/broadcom_northstar_defconfig
index 1008de168f..9ae716726d 100644
--- a/configs/broadcom_northstar_defconfig
+++ b/configs/broadcom_northstar_defconfig
@@ -5,7 +5,7 @@ BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/broadcom/northstar/linux.config"
 BR2_LINUX_KERNEL_APPENDED_ZIMAGE=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm4708-smartrg-sr400ac bcm47094-luxul-xwr-3150-v1"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm4708-smartrg-sr400ac broadcom/bcm47094-luxul-xwr-3150-v1"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048

--===============4679012437907318321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4679012437907318321==--
