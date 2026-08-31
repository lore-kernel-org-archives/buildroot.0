Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C1BC624A4
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 14:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382D740549;
	Mon, 31 Aug 2026 14:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hFJWOzhP7Yr; Mon, 31 Aug 2026 14:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788186829;
	bh=e52GDxMXdskBRkVjmzR5mKsoBFjgc+3lNnF6mIWTFS8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I1T83smK7RSj96h7WSkvPSt4rdaT0lOQh22tyXRGkzlYUlHp7Cc0j3J6q2ZfuKGp/
	 ggbjSIXP+sAEnHXgK/wKdmp4Icd5RF1KaDVgxx3HvYxIyhksO4+LpzMP6zx3FpQXm2
	 Dr7tuDaafQYrOtcnBxbhXVtKpyWZsMZnPjk+mFj7CI59dhp08eY1JrZ/oCG1T3rly1
	 4xgRRi05jtqTfuzWy0lT6Lq4AXqTEqn/cC+Vs0DxmtE/+LHw6IURbunKVpjGjQxTp/
	 Zbo03HOHAMfty5zMphqNDAX70bKynNiAd4cVIVRtp+QRXI2ECv1CF3QVnhNZFPqFeH
	 Tih4gKek/Ijjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 810834054A;
	Mon, 31 Aug 2026 14:33:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 989882FC
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:33:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E7F04054A
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:33:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U4b_tPmmMPX for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 14:33:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0E7040549
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 14:33:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A9093414; Mon, 31 Aug 2026 14:32:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 16:31:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2eefcb245fa5da3c9f469bc7478a524b7bc1e6db
X-Git-Newrev: cb18f3a74a49a62119857ce1ab712ff4528a1d3d
X-Patchwork-Hint: ignore
Message-Id: <20260831143248.36A9093414@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: fix hash for README.txt
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cb18f3a74a49a62119857ce1ab712ff4528a1d3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 297f6f1921960c1735bca34b5a80138e2a8261f4 updated vim.
However README.txt (used as part of the license hash check) has been updated
upstream in [1], without any corresponding hash change in Buildroot, leading
to build failure.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/189

NB: This also affects 2025.02.x & 2026.05.x, so this patch
    should be applied there too.

[1] https://github.com/vim/vim/commit/e7e21018fc0b60c153c8e668f696d95e574cc5a4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/vim/vim.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 57aa3dd49d..ec3e92aaa0 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -2,4 +2,4 @@
 
 sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
-sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
+sha256  1e9afcb6b83c11af081b6ff7873861895819c7bacfc8d2ea53972a532c622868  README.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
