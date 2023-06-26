Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A03EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66E1B41697;
	Mon, 26 Jun 2023 17:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66E1B41697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URsn9JGU97IM; Mon, 26 Jun 2023 17:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADFA7415B0;
	Mon, 26 Jun 2023 17:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ADFA7415B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 143051BF966
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAE21415BA
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CAE21415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5_rTvWH7IXZU for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4D154159A
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4D154159A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EEF084AC1; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 19:01:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb496970c0c7117f9f00d8495e234871f2bae4c1
X-Git-Newrev: 02f6d77fbda975d01e16da0b4a031776bc1a94d2
X-Patchwork-Hint: ignore
Message-Id: <20230626170444.8EEF084AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/hifive_unleashed: Update to use
 OpenSBI 1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=02f6d77fbda975d01e16da0b4a031776bc1a94d2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the rest of RISC-V boards have been switched to use OpenSBI
1.2, let's update hifive_unleashed to use OpenSBI 1.2 too.

Resolves: https://bugs.busybox.net/show_bug.cgi?id=15658
Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/hifive_unleashed_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/hifive_unleashed_defconfig b/configs/hifive_unleashed_defconfig
index 2b6ee6c08e..0440b14ba5 100644
--- a/configs/hifive_unleashed_defconfig
+++ b/configs/hifive_unleashed_defconfig
@@ -38,7 +38,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # Bootloader
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_CUSTOM_VERSION=y
-BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="0.9"
+BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE="1.2"
 BR2_TARGET_OPENSBI_PLAT="generic"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
