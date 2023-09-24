Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDEDCE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087F9417E5;
	Sun, 24 Sep 2023 11:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 087F9417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1_kaXFceQVP; Sun, 24 Sep 2023 11:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03EA9417D2;
	Sun, 24 Sep 2023 11:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03EA9417D2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22E6F1BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE9D681AF5
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9D681AF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJisRrBQGLx5 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:20:05 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39B2481AD7
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B2481AD7
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F5B5A4C0860;
 Sun, 24 Sep 2023 13:20:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkN9d-000803-0z;
 Sun, 24 Sep 2023 13:20:01 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:20:01 +0200
Message-Id: <20230924112001.1070048-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230924112001.1070048-1-bernd@kuhls.net>
References: <20230924112001.1070048-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695554401;
 bh=ONpEmfJ66UJ1+LdHRDDAkFvOz+6uZ7K7yJyfRVXJuSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xUCWOHjP5lCSGv7B5MV3wiisRtrdwnJ4ZvWDCaatKBHfRhlb1xga8JTVkkfOd9y8r
 iS65Yptpptt8094p0V9Ceirn7Kgo5gobFgoxO8BcUTExz0wS3KCZZeJlxNLLHWMK43
 bmOWPKzbJ1OUqxSbrm0DKc1UpxOzSg/t2R9b+724vufeN+XRiaOZxIkQoxbMcYvwbT
 rSi9cw/amY74sncx570tPfXHGWJ99mzPPw4dLivz+ExLlnFc30vkrwh1FiIehZG4go
 6HyCh/iQiIMnRZSfJS3UKvUz+LdsY5hFpDZqOkF1kphmPZN+9E/cTT0mT9OdNWN3YO
 PkHDzHMMF485Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xUCWOHjP
Subject: [Buildroot] [PATCH 2/2] package/kodi: needs kissfft
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream added support for linking for system-provided kissfft:
https://github.com/xbmc/xbmc/commit/a9f8d3f4b1d5141410916b904a7d1f5230306bb3

Use the kissfft package instead of the kissfft source bundled with Kodi.
Please note that Kodi will remove the bundled kissfft source in version
21.x: https://github.com/xbmc/xbmc/pull/23808

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/Config.in | 1 +
 package/kodi/kodi.mk   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 07a2665581..fbe6f66875 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -78,6 +78,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FSTRCMP
 	select BR2_PACKAGE_GIFLIB
 	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_KISSFFT
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e6101e7b57..a72fa908bb 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -36,6 +36,7 @@ KODI_DEPENDENCIES = \
 	host-swig \
 	host-xmlstarlet \
 	jpeg \
+	kissfft \
 	libass \
 	libcdio \
 	libcrossguid \
@@ -74,6 +75,7 @@ KODI_CONF_OPTS += \
 	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
 	-DENABLE_INTERNAL_FLATBUFFERS=OFF \
 	-DFLATBUFFERS_FLATC_EXECUTABLE=$(HOST_DIR)/bin/flatc \
+	-DENABLE_INTERNAL_KISSFFT=OFF \
 	-DENABLE_INTERNAL_RapidJSON=OFF \
 	-DENABLE_INTERNAL_SPDLOG=OFF \
 	-DKODI_DEPENDSBUILD=OFF \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
