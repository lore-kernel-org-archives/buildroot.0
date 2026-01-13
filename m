Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC1D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6371B83D44;
	Tue, 13 Jan 2026 20:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PAjLBf6Vq2JA; Tue, 13 Jan 2026 20:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 819B883D87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337949;
	bh=IkZckwxoTDagDxyqTQVtBKjqRt22tbx3f/iGr1rsZwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YFrtI5LMIjYx9bSEbXIyBsJfOMPuNUqyx9RgiBTgajRrJ17H1rSM6XnVfQLA78cJr
	 hBAdjhkHvXJNKNrFBeWdeCfJP1U27Um5NK0hwQ58o4yPxpoeWhp+hR495rpGNOgcxx
	 tt+ePe4+vEXTmRSZcPY5PPWttxYgk2rmxNZ7NXkD0WNzvufSvGYLzmKRrPtEv8ZaHc
	 SqewAoBfOe0njhR6OG9vb+jJzjmn8VAy3+rS1rTG929BXrCpUpi5Sn+OwIZPXNtkzj
	 mvnOd6UuniSqfvpwtDVTfc9l9A+CcThE1rbND2m6PBdxjyZZgCk2tCcwkGX8qIhRMo
	 BOFNwSjWq1itw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 819B883D87;
	Tue, 13 Jan 2026 20:59:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C2EB231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C14A581109
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QJWKS8p9i1kc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E6678101A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E6678101A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83C8881124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dec410c63633a40f74caa51e214761178b821a27
X-Git-Newrev: e828e6a9261d50b6729618c5e558ae95e9cbf8c1
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.83C8881124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_font-util: bump
 version to 1.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e828e6a9261d50b6729618c5e558ae95e9cbf8c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-September/003418.html

Updated license hash due to upstream commits:
https://gitlab.freedesktop.org/xorg/font/util/-/commit/c28d8ca618f24855e735313c2b8f6effa7b7f1e4
https://gitlab.freedesktop.org/xorg/font/util/-/commit/5a9e7c7d3c3da68e5b421e7d038bc0a7a5f66b22
https://gitlab.freedesktop.org/xorg/font/util/-/commit/ecbf1fa15e14a9ccf339b86198b03f31db838382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xfont_font-util/xfont_font-util.hash | 8 ++++----
 package/x11r7/xfont_font-util/xfont_font-util.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xfont_font-util/xfont_font-util.hash b/package/x11r7/xfont_font-util/xfont_font-util.hash
index cf52a2348f..13263ea5e1 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.hash
+++ b/package/x11r7/xfont_font-util/xfont_font-util.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003331.html
-sha256  9f724bf940128c7e39f7252bd961cd38cfac2359de2100a8bed696bf40d40f7d  font-util-1.4.0.tar.xz
-sha512  05fff613019718a4bd8537ff7eb270bd85345ffb006c16f81b739d6e8cdbfaa9d6503aef9bc48d6c7f70330bf90ff1a46bacdff3c99e8017191d935c85f73d60  font-util-1.4.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2023-September/003418.html
+sha256  5c9f64123c194b150fee89049991687386e6ff36ef2af7b80ba53efaf368cc95  font-util-1.4.1.tar.xz
+sha512  cec7fc38ba64ca9c81c59a8395da94d71c75e14f19faf6457da0a1a8c3c1cf51bcaab227834f6f5a6d274ba2557555e542dbe2bd88e527c45ea196318bbc38d0  font-util-1.4.1.tar.xz
 # Locally calculated
-sha256  ce16c3ee6f2a38db6870b66bdb54fce9dcf24acd1161840789e321f6faa1251c  COPYING
+sha256  5d959e54276964bd0056941fa6f2ecd818a1b081b27f5debcacb54c0be87ece8  COPYING
diff --git a/package/x11r7/xfont_font-util/xfont_font-util.mk b/package/x11r7/xfont_font-util/xfont_font-util.mk
index 8a97c85d68..fa4d983109 100644
--- a/package/x11r7/xfont_font-util/xfont_font-util.mk
+++ b/package/x11r7/xfont_font-util/xfont_font-util.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_FONT_UTIL_VERSION = 1.4.0
+XFONT_FONT_UTIL_VERSION = 1.4.1
 XFONT_FONT_UTIL_SOURCE = font-util-$(XFONT_FONT_UTIL_VERSION).tar.xz
 XFONT_FONT_UTIL_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_UTIL_LICENSE = MIT/BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
