Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0C1C4708E
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 19:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E2CE401C8;
	Thu,  5 Jan 2023 19:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2CE401C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2ZtCEB2j7rM; Thu,  5 Jan 2023 19:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8DC401B3;
	Thu,  5 Jan 2023 19:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8DC401B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113631BF2C5
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 19:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0C7B403A9
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 19:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0C7B403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ahw5XJEEJtgB for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 19:18:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36EC40131
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C36EC40131
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 19:18:17 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout08.t-online.de (Postfix) with SMTP id 7226E232FB;
 Thu,  5 Jan 2023 20:18:14 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pDVkk-4IH7Fh0; Thu, 5 Jan 2023 20:18:14 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:39468)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pDVkj-0000id-2Y;
 Thu, 05 Jan 2023 20:18:13 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu,  5 Jan 2023 20:18:13 +0100
Message-Id: <20230105191813.3533745-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105191813.3533745-1-bernd.kuhls@t-online.de>
References: <20230105191813.3533745-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672946294-C13271D1-4E69D8EB/0/0 CLEAN NORMAL
X-TOI-MSGID: b6c80506-e195-459f-8ab9-6ce315f97f72
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: remove dependency to
 libavresample
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch to remove check for libavresample, this library is not
used by tvheadend.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ove-libavresample-from-build-scripts.patch | 38 +++++++++++++++++++
 package/tvheadend/Config.in                   |  1 -
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/tvheadend/0002-remove-libavresample-from-build-scripts.patch

diff --git a/package/tvheadend/0002-remove-libavresample-from-build-scripts.patch b/package/tvheadend/0002-remove-libavresample-from-build-scripts.patch
new file mode 100644
index 0000000000..63dfbb38d1
--- /dev/null
+++ b/package/tvheadend/0002-remove-libavresample-from-build-scripts.patch
@@ -0,0 +1,38 @@
+From 3a9e511b614bbbcea395e3ee8c16dc15692a17d4 Mon Sep 17 00:00:00 2001
+From: Pim Zandbergen <pim@zandbergen.org>
+Date: Fri, 30 Dec 2022 01:46:43 +0100
+Subject: [PATCH] remove libavresample from build scripts
+
+Downloaded from upstream PR:
+https://github.com/tvheadend/tvheadend/pull/1487
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Makefile  | 1 -
+ configure | 1 -
+ 2 files changed, 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0ae3a19cab..a56a2fbdf9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -93,7 +93,6 @@ ifeq ($(CONFIG_LIBAV),yes)
+ FFMPEG_LIBS := \
+     libavfilter \
+     libswresample \
+-    libavresample \
+     libswscale \
+     libavformat \
+     libavcodec \
+diff --git a/configure b/configure
+index c087502bf3..8ce559fa7b 100755
+--- a/configure
++++ b/configure
+@@ -642,7 +642,6 @@ else
+ 
+     check_pkg libavfilter   ">=6.47.100"  || has_libav=false
+     check_pkg libswresample ">=2.1.100"   && has_resample=true
+-    check_pkg libavresample ">=3.0.0"     && has_resample=true
+     check_pkg libswscale    ">=4.1.100"   || has_libav=false
+     check_pkg libavformat   ">=57.41.100" || has_libav=false
+     check_pkg libavcodec    ">=57.48.101" || has_libav=false
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 99a24ec011..3d21897c6d 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -63,7 +63,6 @@ config BR2_PACKAGE_TVHEADEND_TRANSCODING
 	bool "transcoding support"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
 	select BR2_PACKAGE_FFMPEG_GPL # needed for x264 support
 	select BR2_PACKAGE_FFMPEG_SWSCALE
 	# vp8 encoder needs c++
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
