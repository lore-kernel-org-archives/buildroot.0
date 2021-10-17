Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD71C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:59:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0827610A3
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0827610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78E93401A1;
	Sun, 17 Oct 2021 16:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nATi3Sui8O40; Sun, 17 Oct 2021 16:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A98F400F6;
	Sun, 17 Oct 2021 16:59:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E9A8B1BF295
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E64C180F04
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ReXK9ZtoPOB6 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B1A80ED8
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 6E84295CB6; Sun, 17 Oct 2021 16:56:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:59:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b36c4e594c658d49d19bf388b7fd4a912b6fde42
X-Git-Newrev: 69147f0391efa5c2a62f6413a4f588383e774bfa
X-Patchwork-Hint: ignore
Message-Id: <20211017165650.6E84295CB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/Config.in: disable internal toolchain
 backend for csky
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

commit: https://git.buildroot.net/buildroot/commit/?id=69147f0391efa5c2a62f6413a4f588383e774bfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are going to remove the gcc fork for csky, first disable
the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Asked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in b/arch/Config.in
index 1853e26bb4..ab40294ddc 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -77,6 +77,7 @@ config BR2_aarch64_be
 
 config BR2_csky
 	bool "csky"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_ARCH_HAS_MMU_MANDATORY
 	# Most variants are supported by gcc-9+, except one that is
 	# handled as a special exception in package/gcc/Config.in.host
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
