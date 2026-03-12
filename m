Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F5F106ACE7
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9BB2407E7;
	Thu, 12 Mar 2026 20:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG-7li9ezPRj; Thu, 12 Mar 2026 20:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C702C407CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773345972;
	bh=opV8l1ubuc4Ol/qgfOOqWLRNUyZB6dr5gc1CtIctd7g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RC1cv+SCBNPqyJVIW4ZEp2pKUMuwKXR7LyaeFjg1A/ONTV7m8QFtKhTZkTCAzomAh
	 De3rEwJ8CcIoqhyxIjqzwtOexqRxOsXUqmtEqvtoYd6hB+WWj2IFi1NvKx13YAbMXT
	 u2hCquyv6Q3GU1YlgQf4HZ8RIMrc9VYSYMtCJ+1fHz9Oi1GWSKLg05PbEoTsS3w+Ys
	 iGxStN5oXR9kiUe4MAUopFub+IaRHXxaui84a+wSc+bi9oQ5vaSANuvakl6E+z5t4C
	 V3ewyGtkg0HRSGS0PeF+p1rVqK0F9z46onfkB5s3iYXnRCVCnxGkUEZfzZCB5Q6xOU
	 ms/NLo6887spA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C702C407CC;
	Thu, 12 Mar 2026 20:06:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D9A786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D204840180
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Am6YTMLCr0p for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11BBF40071
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11BBF40071
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 20:06:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 013AD875C5; Thu, 12 Mar 2026 20:06:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 20:47:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43d132319652258666a9896b23c32fb5c419a6e0
X-Git-Newrev: bcabcf7f9c7d5f8c9aca6368f363cfb636c4e8b3
X-Patchwork-Hint: ignore
Message-Id: <20260312200611.013AD875C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: bump version to 0.24.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcabcf7f9c7d5f8c9aca6368f363cfb636c4e8b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.musicpd.org/news/2026/03/mpd-0-24-9-released/

https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.9/NEWS
"  - curl: fix build failure after CURL 8.19 API change"

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 91995c5b4d..9cbe7fcf0b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  1868aded6aabe6a02a6427ef1d3856b11370612afc53d28184533db53991d2f7  mpd-0.24.8.tar.xz
+sha256  f3d28b29bbe675970ef205b3d9b835e5691423fed6a89d713dbcbf7839ea92f3  mpd-0.24.9.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 94decd8460..3df6276a11 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).8
+MPD_VERSION = $(MPD_VERSION_MAJOR).9
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
