Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE7AC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:59:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68AD860FA0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68AD860FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC6141601;
	Tue,  3 Aug 2021 23:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0fVpsss5aAjp; Tue,  3 Aug 2021 23:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FA7B40611;
	Tue,  3 Aug 2021 23:59:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70591BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC5B406B2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctWDntYIq0jW for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFFF04063D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3E4F188523; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:22:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28983ccc0368006c8c749eb8a60bd4812be8461e
X-Git-Newrev: a7ca24784a8d5248eee24462b7148f121405845e
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.3E4F188523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/kontron_smarc_sal28:
 use kernel 5.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7ca24784a8d5248eee24462b7148f121405845e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Walle <michael@walle.cc>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/kontron_smarc_sal28_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index 853c7c308a..ba18cc51cb 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -1,6 +1,6 @@
 BR2_aarch64=y
 BR2_cortex_a72=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13=y
 BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
