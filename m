Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A277C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 18:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292C0419DE;
	Thu,  6 Oct 2022 18:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292C0419DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxIURixwZZMm; Thu,  6 Oct 2022 18:01:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25452419DA;
	Thu,  6 Oct 2022 18:01:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25452419DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6832F1BF3FB
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2188D83F3E
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2188D83F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 75cYdq9FNpJW for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5372983FB9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5372983FB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 441A586937; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:54:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aafab85b07bb2361e826119b11cd021d409d01e0
X-Git-Newrev: b35597decbef4a26dcb662028357d2ac51b0978f
X-Patchwork-Hint: ignore
Message-Id: <20221006175949.441A586937@busybox.osuosl.org>
Subject: [Buildroot] [git commit] mender_x86_64_efi_defconfig: specify 5.18
 kernel headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=b35597decbef4a26dcb662028357d2ac51b0978f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The defconfig uses a 5.18.4 kernel, so specify 5.18 kernel headers now that
is available.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/mender_x86_64_efi_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/mender_x86_64_efi_defconfig b/configs/mender_x86_64_efi_defconfig
index 6919a60c90..2ec6f6f76c 100644
--- a/configs/mender_x86_64_efi_defconfig
+++ b/configs/mender_x86_64_efi_defconfig
@@ -2,7 +2,7 @@
 BR2_x86_64=y
 
 # Toolchain
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_17=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_18=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
