Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF6C48BC4
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 09:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221654171C;
	Wed, 14 Feb 2024 09:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5-sRFj3zl-CF; Wed, 14 Feb 2024 09:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D58041753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D58041753;
	Wed, 14 Feb 2024 09:11:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5951BF86C
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B6688235B
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 09:11:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exejOt5p9LvQ for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A257382359
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A257382359
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8228A878EC; Wed, 14 Feb 2024 09:11:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 10:03:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bcce65f634dfce8e6ee1961ed68df3e778cd945
X-Git-Newrev: cf9c8fa2c844748145d83ffc279a9548cf3792ce
X-Patchwork-Hint: ignore
Message-Id: <20240214091150.8228A878EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale: Fix check-package warning
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf9c8fa2c844748145d83ffc279a9548cf3792ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

$ utils/docker-run make check-package
board/freescale/imx93evk/patches/linux-headers/linux-headers.hash:3: empty line at end of file
board/freescale/imx93evk/patches/linux/linux.hash:3: empty line at end of file
402624 lines processed
2 warnings generated
make: *** [Makefile:1248: check-package] Error 1

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/freescale/imx93evk/patches/linux/linux.hash | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board/freescale/imx93evk/patches/linux/linux.hash b/board/freescale/imx93evk/patches/linux/linux.hash
index 5687ec7343..715a590825 100644
--- a/board/freescale/imx93evk/patches/linux/linux.hash
+++ b/board/freescale/imx93evk/patches/linux/linux.hash
@@ -1,3 +1,2 @@
 # Locally calculated
 sha256  eb94414f952444289c0af8ad82afa0dc2d07e08f9000ccd2cc39f11da5b494ea  linux-imx-lf-6.1.55-2.2.0.tar.gz
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
