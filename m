Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B585E937F6
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0369616D7;
	Sun, 12 Apr 2026 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egyxeZihvEVu; Sun, 12 Apr 2026 17:57:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B6A616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016652;
	bh=VApstm50EvarpjRqW20w5/f5l511ZGotEGhrr3ilcms=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bvAoBiY3jsPMIfPxwT3KyztoQmv4YT7dpyyhyroJ4GEsO2rNsmuX5EScsOx9VogaU
	 XkWsUsr4cUB6ryr3BXfsEb691kNo7CQdsb3HhC2yLfHC6Yl3x50Ct5V+Gl2rsamQcJ
	 Z3mgCXFOsl17hnVpvG1IHm0X7in2Nz0mdsjOV2MkeuMZ4GUu09yxFT4lQkRcrZ8ey+
	 hB4XO4gCEkNa94zHLiOABQjHUe4wNBjIxOjJf8cn8EMjGyHIbxUv7dJmlMj/HWOR0t
	 Q5QgWy/lPvuVwar11HdPi6XaWtVH1DFlIgKWmgo5xpWO6XA9tVp8CQqNz64uIfxZmy
	 9KEu+kqFsv7yQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B6A616D4;
	Sun, 12 Apr 2026 17:57:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A710283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C37B842A9
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hohDEL7A-UT3 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97DD28427F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97DD28427F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2158C811FC; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 19:05:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b965c2665aec8ac82d1d32c554d70cd8ffb45b0
X-Git-Newrev: a3e19c61d5c0aa1857f319795947f69476620237
X-Patchwork-Hint: ignore
Message-Id: <20260412175730.2158C811FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjpeg: bump to version 10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a3e19c61d5c0aa1857f319795947f69476620237
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://jpegclub.org/reference/reference-sources/

Update hash of README (changes not related to license):
https://github.com/libsdl-org/jpeg/commit/5eaedb78e0e78dbff07f71143eb21f9081e2cef7#diff-2b7814d3fca2e99e56c51b6ff2aa313ea6e9da6424804240aa8ad891fdfe0900

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libjpeg/libjpeg.hash | 4 ++--
 package/libjpeg/libjpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libjpeg/libjpeg.hash b/package/libjpeg/libjpeg.hash
index 5c223b4e3c..4af81309e7 100644
--- a/package/libjpeg/libjpeg.hash
+++ b/package/libjpeg/libjpeg.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  04705c110cb2469caa79fb71fba3d7bf834914706e9641a4589485c1f832565b  jpegsrc.v9f.tar.gz
-sha256  7c25493a9f64fed34d01445467341bda77bc1cdbeccbe33558659ef173fb9ff2  README
+sha256  8b9eaa13242690ebd03e1728ab1edf97a81a78ed6e83624d493655f31ac95ab5  jpegsrc.v10.tar.gz
+sha256  913af09f785683accdf660b85dcf27fdd567d4ad649daa95cb8771b040db79d1  README
diff --git a/package/libjpeg/libjpeg.mk b/package/libjpeg/libjpeg.mk
index 2eb64e83e7..1b23bccc65 100644
--- a/package/libjpeg/libjpeg.mk
+++ b/package/libjpeg/libjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJPEG_VERSION = 9f
+LIBJPEG_VERSION = 10
 LIBJPEG_SITE = http://www.ijg.org/files
 LIBJPEG_SOURCE = jpegsrc.v$(LIBJPEG_VERSION).tar.gz
 LIBJPEG_LICENSE = IJG
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
