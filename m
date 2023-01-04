Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC785C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 16:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A20E81FD5;
	Wed,  4 Jan 2023 16:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A20E81FD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gRqxFD-i5-5a; Wed,  4 Jan 2023 16:55:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB47481FB1;
	Wed,  4 Jan 2023 16:55:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB47481FB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABF381BF5DF
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8622941894
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 16:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8622941894
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qLlBIULfTePN for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 992594188E
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 992594188E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8631E87567; Wed,  4 Jan 2023 16:54:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 17:46:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa581bb3e6b45da2b7a0cfb9e5d6f869a7cd9b05
X-Git-Newrev: ee73336da98a7de04301a90c9b5a881761274a47
X-Patchwork-Hint: ignore
Message-Id: <20230104165453.8631E87567@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ima-evm-utils: really install to
 staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee73336da98a7de04301a90c9b5a881761274a47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit "8229196d41 package/ima-evm-utils: new package" added
IMA_EVM_UTILS_INSTALL_STAGING_CMDS without enabling
IMA_EVM_UTILS_INSTALL_STAGING, so currently the package is not installed
to staging.

Enable installing to staging.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ima-evm-utils/ima-evm-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index 7ee34d5e1a..01984402ce 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -8,6 +8,7 @@ IMA_EVM_UTILS_VERSION = 1.4
 IMA_EVM_UTILS_SITE = http://downloads.sourceforge.net/project/linux-ima/ima-evm-utils
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
+IMA_EVM_UTILS_INSTALL_STAGING = YES
 IMA_EVM_UTILS_DEPENDENCIES = host-pkgconf keyutils openssl tpm2-tss
 
 # Tarball doesn't contain configure
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
