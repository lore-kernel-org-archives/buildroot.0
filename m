Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC11C5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D9D98128A;
	Fri, 21 Aug 2026 15:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNlAupyx99hY; Fri, 21 Aug 2026 15:11:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325089;
	bh=vtO9tNHE87w/EBJHc29fSbviQBDPEqhsfl4eN9yDkRw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=meG5VoOP+FSqRILOfLh2izEx2UnLz4xfy1ZR5M00Qxue5ApiJA5DPoIxj+3oFu6iz
	 tREgFKAN2pOEzFJaCSd4wToj+rDb81jMAmxMpKucS3473Ed0zb6wRdQbOX0jRKtmEb
	 ypK4gzVKgCuTOEXeSCtw7CqpFj9as4z6rzxcxa/FIlapsiXjycFvMxsSVu0AU9mLa/
	 rgIMCeIVMVU1CBGeAqWdcYC5NmDQQugpazczbxseX3iJe8n8PPKFm2vYSSd6L63tlB
	 Xz+tBv/Yb9nHtLXqHppGJVtVJviLOnUFBW6FozgGV7vsbGyByt40U/A/huj1DYIUfr
	 O4aONFaOQ9xog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CBDE8148C;
	Fri, 21 Aug 2026 15:11:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 909571CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76F56400AB
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mi6Ztd92F-6a for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD75400C1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FB618E198; Fri, 21 Aug 2026 15:10:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 11:40:56 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 0b2d6e4b0da441093a686bc2215040a49fbd868e
X-Git-Newrev: f185ca044ff0a0e35671d5277e1e94f2e5c8ff1a
X-Patchwork-Hint: ignore
Message-Id: <20260821151016.3FB618E198@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/vim: security
 bump to v9.2.0943
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f185ca044ff0a0e35671d5277e1e94f2e5c8ff1a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

See the release announcement:

- https://www.vim.org/vim-9.2-released.php

It fixes the following vulnerabilities:

- CVE-2026-28417
- CVE-2026-28418
- CVE-2026-28419
- CVE-2026-28420
- CVE-2026-28421
- CVE-2026-28422
- CVE-2026-32249
- CVE-2026-33412
- CVE-2026-34714
- CVE-2026-34982
- CVE-2026-35177
- CVE-2026-39881
- CVE-2026-41411
- CVE-2026-42307
- CVE-2026-44656
- CVE-2026-45130
- CVE-2026-46483
- CVE-2026-47162
- CVE-2026-47167
- CVE-2026-52858
- CVE-2026-52859
- CVE-2026-52860
- CVE-2026-55693
- CVE-2026-55892
- CVE-2026-55895
- CVE-2026-57451
- CVE-2026-57452
- CVE-2026-57453
- CVE-2026-57455
- CVE-2026-57456
- CVE-2026-59856
- CVE-2026-59857
- CVE-2026-59858

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 297f6f1921960c1735bca34b5a80138e2a8261f4)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/vim/vim.hash | 3 ++-
 package/vim/vim.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ecc41be702..57aa3dd49d 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,5 @@
 # Locally computed
-sha256  f9ec31df8f1a78e130dd06c395e6626c2a8a8ec2705d8e7b7667bd3ecd499c6b  vim-9.1.2148.tar.gz
+
+sha256  9b90b23241007b20ba89b7b00e6202008f4ff5b5278974d42aa199867c2eada5  vim-9.2.0943.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 9201587a8a..3b58ad47a5 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.2148
+VIM_VERSION = 9.2.0943
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
