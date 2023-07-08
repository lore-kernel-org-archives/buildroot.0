Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF8EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 20:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF96F60AB9;
	Sat,  8 Jul 2023 20:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF96F60AB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Af16N6Y9yDMO; Sat,  8 Jul 2023 20:05:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168D160C25;
	Sat,  8 Jul 2023 20:05:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168D160C25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDF801BF3DF
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6864403EA
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 20:05:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6864403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mnbIVq51ynL for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 20:05:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FAB8400CB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1FAB8400CB
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 20:05:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E8621A4C0F14;
 Sat,  8 Jul 2023 22:04:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qIEAh-0000uD-1s;
 Sat, 08 Jul 2023 22:04:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 22:04:44 +0200
Message-Id: <20230708200447.3919009-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708200447.3919009-1-bernd@kuhls.net>
References: <20230708200447.3919009-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688846688;
 bh=6Wp2w+6NhomKSNBCvpE7BfQFfcNRXr80uACw5pkbm4U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hSgFJupyuRIr/eVyMYZuejVkp7w+5/NAIenvNh4rspvDndRw3bPCTvRhCZCt9uB3j
 Y1crqsBtNbhJA3vpp4rYiRGE2c19JUk5WA83vwQilkAyMaDOGKcooszFH8MsKabZ4e
 v/UjkOLICjmEykN6ekNM9hu5BaSvE5skU1pVahsy9w4x/J9h0avs8gVNpCV7Kndshd
 F3+pHXy97HyrTdloJfMOEDYD1e6YN+dYgPCobmZPfF0+bY1fnCLILPHLAYbm90fK/c
 5YUFzFzlhJjFziAptlRKHWuLLF4udOvkIIVLUPoP6NxnalOj545gkO3Wd9oAddfBJd
 JFhPHdGuCHogg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=hSgFJupy
Subject: [Buildroot] [PATCH 4/7] package/imagemagick: add optional support
 for libheif
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Pieter De Gendt <pieter.degendt@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/imagemagick/imagemagick.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 8a2ec460d5..91dd208b0d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -32,7 +32,6 @@ IMAGEMAGICK_CONF_OPTS = \
 	--without-fpx \
 	--without-gslib \
 	--without-gvc \
-	--without-heic \
 	--without-jbig \
 	--without-jxl \
 	--without-lqr \
@@ -84,6 +83,13 @@ else
 IMAGEMAGICK_CONF_OPTS += --without-lcms
 endif
 
+ifeq ($(BR2_PACKAGE_LIBHEIF),y)
+IMAGEMAGICK_CONF_OPTS += --with-heic
+IMAGEMAGICK_DEPENDENCIES += libheif
+else
+IMAGEMAGICK_CONF_OPTS += --without-heic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 IMAGEMAGICK_CONF_OPTS += --with-png
 IMAGEMAGICK_DEPENDENCIES += libpng
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
