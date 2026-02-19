Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD59BE9A057
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A36D611B9;
	Thu, 19 Feb 2026 17:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ognocjf5sHej; Thu, 19 Feb 2026 17:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8E52611AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521967;
	bh=f1ywm4LcmCvCEg1OdB4NUuv9fsoBhidb5DP673IYJfY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pxO2HdnJZr6tcDiyirVqjymFJqJP//utu6r3F/ymSGXje4Oorm+5Jl9p3qeETrNIH
	 d5CB1aQHq/1XKVGa726En6uGK2GRCA9xjvVz7JHV0RWIzfJb+HmhLRUIuoiGX2ioxV
	 qUKhRN4BqQfflBJwrx+QpDjEF8HQCdFp1qF9SyiwZYh672esb5/pd0RPfQ8pVUyZ8N
	 DPIiFUcpi0FSCgEWGeeDF5zwLdWi8UbYHOwIi5Xzdsb3FoHlfuhRQTReMRbPMR5Vhj
	 jii/5J+vK387yLwH8Qg2h3hod9XllOzpJhH35nsz4dHCgM8ysanvXkFQ3fpaK64t4l
	 C+EdwgeWYk3Ag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E52611AE;
	Thu, 19 Feb 2026 17:26:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A0E71CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 652F440CF7
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdIq5cSsCago for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E84140C73
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E84140C73
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B25382DF0; Thu, 19 Feb 2026 17:25:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 19 Feb 2026 10:17:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6be6a7b57bc09af1daee3d7c890bbe91960b4258
X-Git-Newrev: 2280debfc13a5e70177f667e51b4d495ff3b20df
X-Patchwork-Hint: ignore
Message-Id: <20260219172538.6B25382DF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/vim: bump package
 to version 9.1.1989
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2280debfc13a5e70177f667e51b4d495ff3b20df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog:
https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a7f1ab80cd65616f437ed12b700a4bc2a32e50c8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index 852d5ed959..41b290ab9f 100644
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
