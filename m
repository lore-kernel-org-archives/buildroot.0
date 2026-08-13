Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E1CC5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C08066060D;
	Thu, 13 Aug 2026 19:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zoAw9SYEmX8X; Thu, 13 Aug 2026 19:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC3CB60DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786649385;
	bh=fvDhjSCsvAN3OMnzUSZemKY6SewapuD8YCxTNtAY/0M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z0VurGjrmeDTNTYbl+0HKhHpsytWAG6t+TEgmGfdBqTUOKQIcAYYzvHnPrr/0K1cc
	 nkTPgbMLvdK4Qh+u0Zt5XSVK2xCd1mvveghg9qSdt7Qo2WiwFcvq8a4t+UzSSotSbI
	 P2lGK8yKY2Zvucf/7qbcmZLghuL8quYR/Do8jELGa3g4TAMmAsfIUp+SDc1jhSfNf5
	 d6utxaQ+ONg1B1nVAEUrReum7UgVFXpagsd8vh3+V+Oo0Qn/6hgdOGMFb/BR5i52hg
	 k+6BmojSgw1J8z8vdeP7oAMpJbIWch+VhlYVrzhPG3gY73MYcrR6BwmNKVC6Ci8gIe
	 yJ+Z9KBfRzPQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC3CB60DCD;
	Thu, 13 Aug 2026 19:29:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2B92B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F3840CB6
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSb6lWKz99Nq for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFB740CA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BFB740CA6
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:29:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 790A68D32C; Thu, 13 Aug 2026 19:28:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:29:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ccc514cdc9c5e698be2493d6583226a5e19a819
X-Git-Newrev: 297f6f1921960c1735bca34b5a80138e2a8261f4
X-Patchwork-Hint: ignore
Message-Id: <20260813192853.790A68D32C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: security bump to v9.2.0943
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/297f6f1921960c1735bca34b5a80138e2a8261f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
