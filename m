Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18CAC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4696240A09;
	Fri, 10 Jul 2026 20:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DMELNAoTX7Jh; Fri, 10 Jul 2026 20:02:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD1A40A27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783713721;
	bh=tyxjnlVp5DzHcFAZFSiH+v1i/U78SiHa0hx4uDClpM0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MgGSL89TEJl3AQIQkuQAjHj6S1jxoCDSrR0bP9TcagLvEo4mU8XWE7gb992WTcqwH
	 jxGNtbkumEo4eRO8+hVzni2tAUuGdj/civEC1L5nLB5fJYH9RPGHlUnqCB8jm/ta27
	 jOMogqXYQVEuXd721ujaKyY15UtSSNO9eqJCTkQjtf56+xWMOplA3ylXfv8WOSP1Ml
	 fm2MLmp0Dv/4OzmXS1a7WqAkmw7XEg0uO8lbTreX0FdgvoiF3FeUMgu+6RU8kcBxDI
	 QuF6BUjdtDnWM6DRF01B0Gnraid73parmMZrfahPRsy/l4e5yCOrpBbGnua/qtgVBE
	 lnHDN/4YAnutA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD1A40A27;
	Fri, 10 Jul 2026 20:02:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BD0372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3F9F80F86
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohEQMN4nqQyK for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B468280F7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B468280F7B
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:01:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB7DB886C0; Fri, 10 Jul 2026 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 21:51:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b396091dbf55234ce9a9d7364dcce0bcb43e1d41
X-Git-Newrev: bb38f6f7208497cf5a4df922e833492001170111
X-Patchwork-Hint: ignore
Message-Id: <20260710200125.BB7DB886C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 3.2.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb38f6f7208497cf5a4df922e833492001170111
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.2.0/ChangeLog.md

Updated license hash due to upstream commits:
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/54bd58cc306301892f1cdc2a00da64576ad1e232
https://github.com/libjpeg-turbo/libjpeg-turbo/commit/42b75222d502faff3316ea82083b873add354f06

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 6 +++---
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index 382f780f23..40314214f9 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4.1
-sha256  ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022  libjpeg-turbo-3.1.4.1.tar.gz
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.2.0
+sha256  6f30092cef9fb839779646608f4ee14ae3cbac989c47fa05e841b0841f09878e  libjpeg-turbo-3.2.0.tar.gz
 # Locally computed
-sha256  e10114e6e40f3d0311c401ca25245ac5ef459a43c20f976fd63f03e816f5741f  LICENSE.md
+sha256  ba6bceebcba0fdd35488477c2cca8c4632ce82c74dbfbc87d886ce6fc4433579  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index b00a71a231..9a10110766 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.4.1
+JPEG_TURBO_VERSION = 3.2.0
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
