Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B554ACA0FF6
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 07:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0B840A8A;
	Sat,  2 Sep 2023 07:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D0B840A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LpvGI4AgPkGt; Sat,  2 Sep 2023 07:42:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A737B405DC;
	Sat,  2 Sep 2023 07:42:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A737B405DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F0DB21BF3CB
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D704860DA0
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D704860DA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AVHxzjh5X_sB for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28C2160ADD
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28C2160ADD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11C608675D; Sat,  2 Sep 2023 07:40:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:40:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dd5233b5540a950bb25024d2d48de04f07995bc
X-Git-Newrev: 698562e7f59249b49e94d3243e3a592d1919fcf5
X-Patchwork-Hint: ignore
Message-Id: <20230902074043.11C608675D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed_defconfig: uboot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=698562e7f59249b49e94d3243e3a592d1919fcf5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4987456270

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/hifive_unleashed_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index c9d4a31ede..fbc273fffc 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -48,6 +48,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sifive_unleashed"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
