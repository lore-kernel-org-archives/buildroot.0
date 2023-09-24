Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3E5CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 11:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9BF417EA;
	Sun, 24 Sep 2023 11:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD9BF417EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 75wIf5-0q4vJ; Sun, 24 Sep 2023 11:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A20417E7;
	Sun, 24 Sep 2023 11:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A20417E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F9BB1BF33E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A1941527
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 11:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66A1941527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9ozk6CZekK5 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 11:26:42 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6229B400EC
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 11:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6229B400EC
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 76783A4C09E7;
 Sun, 24 Sep 2023 13:26:40 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34130)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qkNG4-0000gv-0r;
 Sun, 24 Sep 2023 13:26:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 13:26:40 +0200
Message-Id: <20230924112640.1115819-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230924112640.1115819-1-bernd@kuhls.net>
References: <20230924112640.1115819-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695554800;
 bh=Gbs2h1Fq8ozIN1hb9rD0GI9l1DEu+XIpv1veu7LkC0s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kk2Npgz2jlIkbU4/CGY0DdO5+8gkntb/gR/PgvVBdadvVXo79qqHE8QkIBlWuriog
 /kmUglTBKNx5QpwQL+xIDomtez4Q0/MucSEhsHbrE0ijzmVFBZU7c1bm+WOVljJM7M
 qYSFQvMHvDzyW/v7ORR3nmpx+PFOdZlgGfwgOs8e/4QZUDkLwZx99K9ElStz/3PR/V
 xE7L1PttpDooS9v523K5SEknmGmQLSkz0har4uUeCoFg4p3k25eI+JY3uavc6/AfMO
 liXwRVIVWlsRC8oITwbDK1pc+jLa/YZlRikGloDKmHBUk7CRkocqW6xz+gln/df+Su
 h7y6Rlcs9888Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=kk2Npgz2
Subject: [Buildroot] [PATCH v2 2/2] package/kodi: needs kissfft
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
v2: no changes

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
