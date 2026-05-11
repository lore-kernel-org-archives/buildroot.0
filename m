Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D5ACD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80FE384439;
	Mon, 11 May 2026 10:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_CFxRQIEinW; Mon, 11 May 2026 10:02:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A0FA843FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778493741;
	bh=TGesr6TsZ+UjlEN/E7TvsAOlbF7w6lO29xY7phOIAMM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=svK/1/rqEXx95fDZLek8d/cKHwUSbBo56uE0/OtiA9K/ZjApVbR5MzjVrhCGYTv7d
	 zXVRvWeQKSS2DtNLGO1D8//Oia66gljaNYRplbW00eent6NRprDZ6UtWQmtYFCf4Ej
	 0jJzHmKxV0Ekt0tki/IKWEmnYJiU+QlYF5KXfWnxQApnVrnahP9qTJNU56QqOVZVYM
	 YXwoYEDTPjfy8oqz8T9wf5TeYpCtg0vjBYbaGxY71Ffczu83dxsdBCu+BTuLQ8Sar8
	 p74lpvoX65piaBq1R//a5xSxwG0BfSN6aODIFQjBtqoYR3IojB9/2r477wyAunUR2C
	 KiY1ZHIlxuZqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A0FA843FC;
	Mon, 11 May 2026 10:02:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B4739272
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A63D441455
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBQjzFTA10wi for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E87D841331
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87D841331
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6375E85DA8; Mon, 11 May 2026 10:02:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 11:58:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98a3912165d0a65138295897e956254a15f02e9b
X-Git-Newrev: a96ad6205b968c0b691fe4c64560cf7dd46192b4
X-Patchwork-Hint: ignore
Message-Id: <20260511100214.6375E85DA8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump to version
 2.8.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a96ad6205b968c0b691fe4c64560cf7dd46192b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

fixes CVE-2026-45186

see https://github.com/libexpat/libexpat/blob/R_2_8_1/expat/Changes

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index a0f8b514a8..5d34adfc8d 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_0
-sha256  a37bfae0aa9775bd8521ebd85dc456d486f0ff31138f6c91fd902ea732624542  expat-2.8.0.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_1
+sha256  10b195ee78160a908388180a8fe3603d4e9a12f4755fbf5f3816b23a9d750da0  expat-2.8.1.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 07c209543e..3b529c3390 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.0
+EXPAT_VERSION = 2.8.1
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
