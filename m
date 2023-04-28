Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC15C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 12:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B83427BC;
	Fri, 28 Apr 2023 12:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67B83427BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BYbYXV7EiKba; Fri, 28 Apr 2023 12:52:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 484D7427A6;
	Fri, 28 Apr 2023 12:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484D7427A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8831BF584
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E83BB40B8A
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E83BB40B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lkk3w7Opnxc5 for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 12:52:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01DE140471
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01DE140471
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:52:12 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout03.t-online.de (Postfix) with SMTP id D2C7A3B026;
 Fri, 28 Apr 2023 14:51:40 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.195]) by fwd81.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1psNZc-1iVhVh0; Fri, 28 Apr 2023 14:51:40 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43050)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1psNZc-0006NF-1G;
 Fri, 28 Apr 2023 14:51:40 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 14:51:40 +0200
Message-Id: <20230428125140.222035-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1682686300-EB7FDC73-F8FFB3D6/0/0 CLEAN NORMAL
X-TOI-MSGID: a190a255-b91e-4b3a-af79-e2f9add9565d
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
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

Rebased patch.

Upstream removed the dependency to libavresample:
https://github.com/tvheadend/tvheadend/commit/17a357fee8bccacd931476411200b05f2b06f47c

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tvheadend/0001-no-check_config.patch | 2 +-
 package/tvheadend/Config.in                  | 1 -
 package/tvheadend/tvheadend.hash             | 2 +-
 package/tvheadend/tvheadend.mk               | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/tvheadend/0001-no-check_config.patch b/package/tvheadend/0001-no-check_config.patch
index 9261e5fff6..45c862d300 100644
--- a/package/tvheadend/0001-no-check_config.patch
+++ b/package/tvheadend/0001-no-check_config.patch
@@ -12,7 +12,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 diff -durN tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile
 --- tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3.orig/Makefile	2014-03-09 14:47:43.780025330 +0100
 +++ tvheadend-c84bc2b72b462ef2dbed305f3fd0bb3fa5046fc3/Makefile	2014-03-09 14:48:40.836539093 +0100
-@@ -708,7 +708,7 @@
+@@ -710,7 +710,7 @@
  	$(ROOTDIR)/configure $(CONFIGURE_ARGS)
  
  # Binary
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
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 45c8bd62b0..004619f4f4 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06c6d33a8e9d1d645cea9c63a06f6bddb309e5546177966d7b9285f68313bf5b  tvheadend-c9a156a25a07f1f84c2f48a1b03b481430c8257d.tar.gz
+sha256  a4ce9ef9299901ebbb5849aba9bb9de3e8f0ab4d1166f1f06ea25997d10d06f6  tvheadend-18effa8ad93e901f3cdaa534123d910f14453d1f.tar.gz
 sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 0ca8f46dc5..c0fa83be8a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = c9a156a25a07f1f84c2f48a1b03b481430c8257d
+TVHEADEND_VERSION = 18effa8ad93e901f3cdaa534123d910f14453d1f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
