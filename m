Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E55C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC02460C23;
	Wed, 28 Dec 2022 20:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC02460C23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVYyeru4GWbs; Wed, 28 Dec 2022 20:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4289E60BFE;
	Wed, 28 Dec 2022 20:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4289E60BFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 808331BF2F2
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A9174020C
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9174020C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCFbd7n5M2A7 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:08:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 218B040206
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 218B040206
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 20:08:34 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout10.t-online.de (Postfix) with SMTP id 0276E1C4C9
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 21:08:32 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pAcj1-29ALRZ0; Wed, 28 Dec 2022 21:08:31 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37960)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pAcj1-0004CV-1t
 for buildroot@buildroot.org; Wed, 28 Dec 2022 21:08:31 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 21:08:31 +0100
Message-Id: <20221228200831.1185831-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672258111-EE7EE7E2-FEF98BDA/0/0 CLEAN NORMAL
X-TOI-MSGID: 6c539441-cc5c-49ff-b0ad-518a73e26c3c
Subject: [Buildroot] [PATCH 1/1] package/kodi: enable optional usage of
 ccache
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

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 812c4be6e8..0878296599 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -68,7 +68,6 @@ KODI_EXTRA_DOWNLOADS += \
 KODI_CONF_OPTS += \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(KODI_C_FLAGS)" \
 	-DENABLE_APP_AUTONAME=OFF \
-	-DENABLE_CCACHE=OFF \
 	-DENABLE_DVDCSS=ON \
 	-DENABLE_INTERNAL_CROSSGUID=OFF \
 	-DWITH_FFMPEG=$(STAGING_DIR)/usr \
@@ -89,6 +88,12 @@ KODI_CONF_OPTS += \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
 
+ifeq ($(BR2_CCACHE),y)
+KODI_CONF_OPTS += -DENABLE_CCACHE=ON
+else
+KODI_CONF_OPTS += -DENABLE_CCACHE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_KODI_RENDER_SYSTEM_GL),y)
 KODI_CONF_OPTS += -DAPP_RENDER_SYSTEM=gl
 KODI_DEPENDENCIES += libgl libglu
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
