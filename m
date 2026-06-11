Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA20CD98C7
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0A6D822DA;
	Thu, 11 Jun 2026 20:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQi0q26xGgj9; Thu, 11 Jun 2026 20:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2123D822C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781211430;
	bh=5dTRW+SlMU0c4rWpISJpzyiDgoqijh+cZIAMdZ0JKJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=D8g6mZfRSeHduYUoOe3k85bKSYjL6H9YYuVt2YP+6LwEVbJpCXbbIbN04aPLkkUqj
	 J787po1dCfwEYCnOWmZZRQZDTUVBuT6rmxiuYoLBVEqmZ0MiUHeSXiOU3MhqmoLPuU
	 En6ZhAX+qf+3rQGAdC3+X+sTIjjLbE3aqnyuKBxnmjDsjeqJSa2FGoGnxrIgdQe33M
	 a3s+wbk00347d0sIjr3ezgzqsKMPdXT18rs7o2ld2gQEUGRTf1srQaszf1a+QuKXzu
	 kFWXXInf5vRCZIDKhQZaVjLW/K0xOhhgV5RPdjJ2Kws07ApRPOW869BnIqFSDkcGHo
	 pruY1U/irVlBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2123D822C8;
	Thu, 11 Jun 2026 20:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ED7C6F4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD2D540E40
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUrUs-zAVmPA for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2239B40E3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2239B40E3E
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:57:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B79088041; Thu, 11 Jun 2026 20:56:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 22:52:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df53284720d4529652cef174d554498b912413b1
X-Git-Newrev: 96105fef9e8d26ef0bf44627738c46aca3763e5a
X-Patchwork-Hint: ignore
Message-Id: <20260611205649.3B79088041@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.2.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/96105fef9e8d26ef0bf44627738c46aca3763e5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index b0bc621113..e78cf1f188 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  97cb8ef708541f632e861d005a462dd0367240f81ff96f8e63ebbdd75c8ce55f  armadillo-15.2.6.tar.xz
+sha256  029230b29c3745924ea850c7046efd1db74b863fdfead8b1aaba3bdd5b0cf895  armadillo-15.2.7.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 194af02e00..756a3fa8ab 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.6
+ARMADILLO_VERSION = 15.2.7
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
