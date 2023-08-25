Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272A0C88CB2
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C97F061451;
	Fri, 25 Aug 2023 13:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C97F061451
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZ2tbJm4s3fT; Fri, 25 Aug 2023 13:13:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 152DE605A9;
	Fri, 25 Aug 2023 13:13:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 152DE605A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D79FE1BF99A
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD53F41E96
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:12:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD53F41E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdY44erjqDZJ for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B60CA41E95
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B60CA41E95
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1913862FC; Fri, 25 Aug 2023 13:12:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:05:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 52f4fd74ac9dece211d8dedf56ce08960db7a47b
X-Git-Newrev: c2d1555301dd2ae4479fba8f183dcf7d98283d61
X-Patchwork-Hint: ignore
Message-Id: <20230825131243.A1913862FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] configs/beaglebone: uboot
 needs OpenSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2d1555301dd2ae4479fba8f183dcf7d98283d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Regression builds failed to build uboot due to missing OpenSSL
  library.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dd5c058a992dc5475daa69774caae06f62863135)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index 3e7ad8d402..7e006e7a85 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -37,6 +37,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="am335x_evm"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
