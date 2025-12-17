Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E46AD66BA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF83183BC7;
	Wed, 17 Dec 2025 20:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJ5XVEUMtXZT; Wed, 17 Dec 2025 20:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08BB781CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766002625;
	bh=eG+JD35GILyogO3t0y0fIHWDjOUwtOyGofVrEWGsk8w=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UF5EnMIfRp/1/gbVBHJDXJL3rx2ynxjRPuYoJyagJBDveJ7u3r/kEzsZZajNYEv6P
	 GvO/sHofb0CCjPryk7uasyTX6bJ4kY8d6w1hvmJRkU5fEWaX7nH000ZJyls+l3IIEN
	 UgIBT7F4apnFGM4fw6cWmjJoe2dZeit8DcnxRASIUxgrcriGnDFIMSvzWj/azAFFl1
	 j1HP02CjUDvOXVdyGoFeLTbqTCOLi7Soc6o+CiJ+lRkR4VF7iQPvaQkRy3WPOGqrms
	 +EpqarvsUziWA9PCvCu2buCe8xbEIkaS/KA/WV1lXaaPFP86O8pp62SiQ4TImCLkjs
	 2VnNYR4CMHotw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08BB781CA0;
	Wed, 17 Dec 2025 20:17:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA39375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A21DD81CA0
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QBqhKBwmXfO5 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:17:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0783681A3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0783681A3E
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:17:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB581870C5; Wed, 17 Dec 2025 20:17:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 21:08:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c512c8be0249e1d0e7a83186dff6482701d779f
X-Git-Newrev: a7f1ab80cd65616f437ed12b700a4bc2a32e50c8
X-Patchwork-Hint: ignore
Message-Id: <20251217201702.EB581870C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: bump package to version
 9.1.1989
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

commit: https://git.buildroot.net/buildroot/commit/?id=a7f1ab80cd65616f437ed12b700a4bc2a32e50c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ae909aaeac..95c44234fe 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
+sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4297bdd198..2ecab0652f 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.1684
+VIM_VERSION = 9.1.1989
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
