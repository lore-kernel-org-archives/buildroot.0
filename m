Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7A5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 15:31:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C0B610C7
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 15:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53C0B610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0008281D4D;
	Thu, 28 Oct 2021 15:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ca5s9GoZWvZT; Thu, 28 Oct 2021 15:31:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6824D81CE3;
	Thu, 28 Oct 2021 15:31:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 738C01BF83E
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 15:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CC6A40122
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 15:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ABNdLTtHlVkm for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 15:31:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 166F3400FF
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 15:31:33 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout02.t-online.de (Postfix) with SMTP id 55C7AFB6
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 17:31:09 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.237]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mg7Mx-2rEqR70; Thu, 28 Oct 2021 17:31:07 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:40090)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mg7Mx-0004PW-8Q
 for buildroot@buildroot.org; Thu, 28 Oct 2021 17:31:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 28 Oct 2021 17:31:07 +0200
Message-Id: <20211028153107.334373-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1635435067-00001441-82DAE569/0/0 CLEAN NORMAL
X-TOI-MSGID: ca329a1f-91af-48b3-97b1-a3bcee4ae530
Subject: [Buildroot] [PATCH 1/1] package/kodi: use libgbm virtual package
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

Kodi needs gbm_bo_get_fd:
https://github.com/xbmc/xbmc/blob/Matrix/xbmc/utils/GBMBufferObject.cpp#L54

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 3 ++-
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 67cb33a6b5..21ef8dfd42 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -22,7 +22,8 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	bool
 	default y
 	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
-	depends on BR2_PACKAGE_MESA3D_GBM
+	depends on BR2_PACKAGE_HAS_LIBGBM
+	depends on BR2_PACKAGE_LIBGBM_HAS_FEATURE_DMA_BUF
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 3c314533f4..646c6e0ab4 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -92,7 +92,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM),y)
 KODI_CORE_PLATFORM_NAME += gbm
-KODI_DEPENDENCIES += libinput libxkbcommon mesa3d
+KODI_DEPENDENCIES += libgbm libinput libxkbcommon
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
