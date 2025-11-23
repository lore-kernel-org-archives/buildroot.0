Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A8D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1A481B9A;
	Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG2xzsbdiOX6; Fri, 12 Dec 2025 07:55:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CAC5981B52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526142;
	bh=n3A6o2M5Y1A7r01CSFJMZhKI55iWhE7VgfHEm+9m9Y0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DKwShqAjP8XmmW2UkPD03QVEWjndi7Ubjy5DAHDuYjLG899ZXT6+2hekNnFZRuocS
	 AEZOC+3nWJlpTbFqypk22NCbPCZf8qg6ideT9laDV0kLUdOfkepvmIj9CFwjt95A9w
	 5muBtcBTMOP+7ABPoxwO6PB7QCzuuVdg936aNM3uhCSA5QQDvdX43QTr05R6WHHzFD
	 cjXFrCc49EEO2MSwdFGccX79k6KcztMmkscWLSeX4eSH3zc7jOUX8gjrCOs8uUpkHb
	 RAJ2y2hd0nbuy3YSYHJcGiV+iHXnidrwEr8nnmYtBLVY3AZ6YJ7dLOvdNRrlDzDzko
	 hAB+KZH0uWp6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAC5981B52;
	Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 016FB2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2342741146
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcFe7S9zO4mr for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A3C341111
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A3C341111
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9947B86C94; Fri, 12 Dec 2025 07:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 23 Nov 2025 11:17:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d996b98ea0e0b83e8c4a77a07494d5689753001
X-Git-Newrev: 6a73f7173657e332e97249a3c6df1a9ea2845c60
X-Patchwork-Hint: ignore
Message-Id: <20251212075534.9947B86C94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proj: bump to 9.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6a73f7173657e332e97249a3c6df1a9ea2845c60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We jumped from 9.5.1 straight to 9.7.0, for release notes, see:
https://proj.org/en/stable/news.html

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proj/proj.hash | 2 +-
 package/proj/proj.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 5249f52c10..4ac7b444f4 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
 # Fetched from https://download.osgeo.org/proj/proj-9.5.1.tar.gz.md5
 md5  07c44ca4a65a0664ce823c8448707c78  proj-9.5.1.tar.gz
 # Locally calculated
-sha256  a8395f9696338ffd46b0feb603edbb730fad6746fba77753c77f7f997345e3d3  proj-9.5.1.tar.gz
+sha256  65705ecd987b50bf63e15820ce6bd17c042feaabda981249831bd230f6689709  proj-9.7.0.tar.gz
 sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 361c1e50b1..4840824f69 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 9.5.1
+PROJ_VERSION = 9.7.0
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
