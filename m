Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42ADBC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E57E760E78;
	Tue, 13 Sep 2022 12:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E57E760E78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsV5VAbBCSWk; Tue, 13 Sep 2022 12:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1516C60E6B;
	Tue, 13 Sep 2022 12:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1516C60E6B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 529A41BF9B5
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EB1B60E6F
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB1B60E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LE8Tk_BqHjp9 for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D31660E64
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D31660E64
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A9C88376E; Tue, 13 Sep 2022 12:38:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Sep 2022 13:51:37 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 4ac550227fff4c88336cd48e5447575eef1a17a1
X-Git-Newrev: 43c434f69125e212aa386f59fca46ce34d1cecba
X-Patchwork-Hint: ignore
Message-Id: <20220913123800.4A9C88376E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x]
 configs/licheepi_zero_defconfig: add missing BR2_TARGET_UBOOT_NEEDS_OPENSSL
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

commit: https://git.buildroot.net/buildroot/commit/?id=43c434f69125e212aa386f59fca46ce34d1cecba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800773

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1eb5b9bb61deedc44095efd83dff6d2575f5f2b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
