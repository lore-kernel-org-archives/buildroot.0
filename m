Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F31C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:32:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DDA60F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9DDA60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D1B1404A8;
	Tue,  3 Aug 2021 21:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30Tcb6l42wpz; Tue,  3 Aug 2021 21:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97CBC40135;
	Tue,  3 Aug 2021 21:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1442F1BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AD7040481
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCTWQTJ_Ek3j for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F0740477
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 44DAF87BB7; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 14:12:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 98a74d81a8c26ce0d0692bbb5235579f81afba36
X-Git-Newrev: 4cf819f80e23b97f737bc5ad6f0f78586383a843
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.44DAF87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/beaglev: enable host
 jh71xx-tools
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=4cf819f80e23b97f737bc5ad6f0f78586383a843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This host utility is useful to recover the bootloader.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/beaglev/readme.txt  | 4 +++-
 configs/beaglev_defconfig | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/board/beaglev/readme.txt b/board/beaglev/readme.txt
index bbdb9b12ef..60678059e1 100644
--- a/board/beaglev/readme.txt
+++ b/board/beaglev/readme.txt
@@ -119,4 +119,6 @@ bootloaders, so if you flash non-working versions, you'll have to go
 through a recovery process. This requires wiring up to a separate
 debug UART, which pins are located near the HDMI connector. See
 https://wiki.seeedstudio.com/BeagleV-Update-bootloader-ddr-init-boot-uboot-Recover-bootloader/
-section "Recover the bootloader" for more details.
+section "Recover the bootloader" for more details. The instructions
+make use of a jh7100-recover tool, which Buildroot has built as part
+of this defconfig: it is available as output/host/bin/jh7100-recover.
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 8943ce9c34..bbb69ca268 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -35,3 +35,4 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,3f3ac01a29ad1cd5fa519d86f81daead2447f1d4)/uboot-3f3ac01a29ad1cd5fa519d86f81daead2447f1d4.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_JH71XX_TOOLS=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
