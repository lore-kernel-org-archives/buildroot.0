Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42A8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:00:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B7D561078
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 19:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B7D561078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A963980F3B;
	Tue, 26 Oct 2021 19:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxi_9zxXNses; Tue, 26 Oct 2021 19:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DB1D80EDC;
	Tue, 26 Oct 2021 19:00:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 65B041BF20F
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 553AA80EDC
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 19:00:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYmfGait-LjD for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 19:00:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18B2780EC8
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 19:00:53 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout11.t-online.de (Postfix) with SMTP id 8005710B7D
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 21:00:15 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.237]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mfRgD-0AbTw90; Tue, 26 Oct 2021 21:00:13 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:34882)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mfRgC-00065Z-KN
 for buildroot@buildroot.org; Tue, 26 Oct 2021 21:00:12 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 21:00:12 +0200
Message-Id: <20211026190012.131232-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1635274813-00001457-0BC49E11/0/0 CLEAN NORMAL
X-TOI-MSGID: a43bd70c-e556-4b62-a540-4249f1092a53
Subject: [Buildroot] [PATCH 1/1] package/kodi-audioencoder-lame: bump
 version to 19.1.0-Matrix
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/xbmc/audioencoder.lame/releases/tag/19.1.0-Matrix

Added libiconv as optional dependency when needed.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash | 2 +-
 package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
index 7863ff497c..080bef06d2 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e2bdf17e5739cc025627a92421b967e5dda3cb35d2e4bb948a64ac97bf0e734e  kodi-audioencoder-lame-19.0.0-Matrix.tar.gz
+sha256  054593ea6572cd1e6ea771758bd759c630f47abef1ad2eeb332d453fc6c03e0b  kodi-audioencoder-lame-19.1.0-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
index b774ac63e9..d2c2750022 100644
--- a/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
+++ b/package/kodi-audioencoder-lame/kodi-audioencoder-lame.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_AUDIOENCODER_LAME_VERSION = 19.0.0-Matrix
+KODI_AUDIOENCODER_LAME_VERSION = 19.1.0-Matrix
 KODI_AUDIOENCODER_LAME_SITE = $(call github,xbmc,audioencoder.lame,$(KODI_AUDIOENCODER_LAME_VERSION))
 KODI_AUDIOENCODER_LAME_LICENSE = GPL-2.0+
 KODI_AUDIOENCODER_LAME_LICENSE_FILES = LICENSE.md
@@ -12,4 +12,8 @@ KODI_AUDIOENCODER_LAME_DEPENDENCIES = kodi lame
 KODI_AUDIOENCODER_LAME_CONF_OPTS += \
 	-DLAME_INCLUDE_DIRS=$(STAGING_DIR)/usr/include
 
+ifeq ($(BR2_ENABLE_LOCALE),)
+KODI_AUDIOENCODER_LAME_DEPENDENCIES += libiconv
+endif
+
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
