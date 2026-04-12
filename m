Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17BAE937F6
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86461616DA;
	Sun, 12 Apr 2026 17:57:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgGdNofxMbhr; Sun, 12 Apr 2026 17:57:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4220E616EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016656;
	bh=z+bO8/cwyJzBHtcACLrYwHkn2JKGT2dkeVnBrFpc0IA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Js4VY+st88wA80vg0FHgghrYbJJTQEwB5VKUD0P9pyESpJRHoTkmzosHH7+NI5al8
	 BSQfI5m1XsXBg/kHu4xVucM/uC1VkRScy8TjIU6hYZ4hh0nR6kcdH6nrN4tTvZAQm8
	 b8+hjcEHj/rsS46xPGIq2LXVrdpT/hzaMl32QT0BjwrDS2VqLivCTvnoSIlu1YEKle
	 M0JtiWocoGwELbPH8LCkNIx6zQe68/0O2Eyby1S4HADipGQvW1FbORYCDTAiVx2p0w
	 gKCKI4puss8ACiM0zpFJnN7gEcYZjTVN1zmXVNxIKyRzGDlOOQyg99j61Dl/5Sb70n
	 GR4tYfCjb2aRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4220E616EB;
	Sun, 12 Apr 2026 17:57:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BB03283
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CBFB8429D
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QsrG_a1_8dib for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E02F84296
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E02F84296
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C0A3811FD; Sun, 12 Apr 2026 17:57:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 19:06:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3e19c61d5c0aa1857f319795947f69476620237
X-Git-Newrev: 544d73e1542c98ef8944363966feab16f1b8067f
X-Patchwork-Hint: ignore
Message-Id: <20260412175730.2C0A3811FD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jpeg-turbo: bump version to 3.1.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/544d73e1542c98ef8944363966feab16f1b8067f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libjpeg-turbo/libjpeg-turbo/blob/3.1.4.1/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jpeg-turbo/jpeg-turbo.hash | 4 ++--
 package/jpeg-turbo/jpeg-turbo.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/jpeg-turbo/jpeg-turbo.hash b/package/jpeg-turbo/jpeg-turbo.hash
index f2795bebc1..382f780f23 100644
--- a/package/jpeg-turbo/jpeg-turbo.hash
+++ b/package/jpeg-turbo/jpeg-turbo.hash
@@ -1,5 +1,5 @@
-# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4
-sha256  e23d3ebb2c6ee4d0e2a5823dbb55b614845df5ea3435c956fed5cf04041a87ad  libjpeg-turbo-3.1.4.tar.gz
+# From https://github.com/libjpeg-turbo/libjpeg-turbo/releases/tag/3.1.4.1
+sha256  ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022  libjpeg-turbo-3.1.4.1.tar.gz
 # Locally computed
 sha256  e10114e6e40f3d0311c401ca25245ac5ef459a43c20f976fd63f03e816f5741f  LICENSE.md
 sha256  75815e3bf6484201a3c3d17a1bbf10f2e8e3237f84df10a2357ea896db2a81d6  README.ijg
diff --git a/package/jpeg-turbo/jpeg-turbo.mk b/package/jpeg-turbo/jpeg-turbo.mk
index 56eebdc765..b00a71a231 100644
--- a/package/jpeg-turbo/jpeg-turbo.mk
+++ b/package/jpeg-turbo/jpeg-turbo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JPEG_TURBO_VERSION = 3.1.4
+JPEG_TURBO_VERSION = 3.1.4.1
 JPEG_TURBO_SOURCE = libjpeg-turbo-$(JPEG_TURBO_VERSION).tar.gz
 JPEG_TURBO_SITE = https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/$(JPEG_TURBO_VERSION)
 JPEG_TURBO_LICENSE = IJG (libjpeg), BSD-3-Clause (TurboJPEG), Zlib (SIMD)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
