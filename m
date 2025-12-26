Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADF6E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF374092F;
	Fri, 26 Dec 2025 11:05:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OcJ5UkbunA9r; Fri, 26 Dec 2025 11:05:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CB2940920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766747130;
	bh=ejGbqviBe7npY5TdzT03v+S4opYGD7aVon2yIN+SBoI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YzAmGhh9SQCl8HCHvjdo+CMZSFPhmqS2xsKokICTAT7M7oVWttbmEf+TYITdTevAP
	 cpazVCffgkcLUYC9AjvDIb1SdDpIEBmvF+DzRdCJLOeocQ9IBEIWd1aAji4e+xLGGB
	 6FbEr67vIn6l1LxCxQzf43c3ZVndH+noQIk2X1fTe5MMhqUzQqhN8XGkleE8kt5xns
	 83CVpngyvS6tiL6qy7h+ALnSXY+SKCZSALpWGkWPiXp/aLknJSIBTV4ern7znEUo+U
	 JCMUKbTeu0dVjh1xoF1z+idzJ14F1XzWwWoQSR47JeTNTyS88sfewYbz3CSDxVQ7Ug
	 GN+5GaEIRnmPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CB2940920;
	Fri, 26 Dec 2025 11:05:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA654EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B31F740920
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG1cqpLOnviy for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BA4B4051D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BA4B4051D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:05:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECE9887672; Fri, 26 Dec 2025 11:05:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 11:45:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85a8faec193fd43bb7956b04ebbc77502cb4fe34
X-Git-Newrev: ef70ba7b243d5126c453b32245807d091c3bf734
X-Patchwork-Hint: ignore
Message-Id: <20251226110525.ECE9887672@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: bump package to version
 9.1.2017
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef70ba7b243d5126c453b32245807d091c3bf734
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/vim/vim/compare/v9.1.1989...v9.1.2017

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 95c44234fe..f7c883b929 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
+sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4fe8800bea..1e7e1d6a55 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.1989
+VIM_VERSION = 9.1.2017
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
