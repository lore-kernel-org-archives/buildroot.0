Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30F7C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:16:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C38660F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C38660F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36ADD40518;
	Tue,  3 Aug 2021 23:16:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VBShpi5I0AJt; Tue,  3 Aug 2021 23:16:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BA34025C;
	Tue,  3 Aug 2021 23:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6EE1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1ADEF4063F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCZwGnLqGQIY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3E2D40665
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 136FE843E3; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Jun 2021 09:13:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d56fa94092c0ba2014febd9da34547a2ffcf3de1
X-Git-Newrev: 6dd9e246a7b497819fd34595835d61c635d993f6
X-Patchwork-Hint: ignore
Message-Id: <20210803210955.136FE843E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/stm32f469_disco: add
 host {dosfs, m}tools
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dd9e246a7b497819fd34595835d61c635d993f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 04a0094f0ef077 (configs/stm32f469_disco: fix kernel bootup) changed
the defconfig to build a vfat image, but forgot to add dosfstools/mtools
host utilities needed for this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index c537197ff6..e538a664e2 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -19,5 +19,7 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32f469-discovery"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
 BR2_PACKAGE_HOST_OPENOCD=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
