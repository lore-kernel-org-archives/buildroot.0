Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FBCC77B73
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 20:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C201C60FFA;
	Sun, 21 May 2023 20:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C201C60FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUPEIrrhPd15; Sun, 21 May 2023 20:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F404D60FE9;
	Sun, 21 May 2023 20:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F404D60FE9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD5E81BF3CB
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D8C882165
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 20:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D8C882165
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFhXqE7Zgv5f for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 20:09:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAD608215B
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAD608215B
 for <buildroot@buildroot.org>; Sun, 21 May 2023 20:09:54 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout04.t-online.de (Postfix) with SMTP id 00D4B1D19D
 for <buildroot@buildroot.org>; Sun, 21 May 2023 22:09:52 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.6.127]) by fwd80.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1q0pNH-0WEZST0; Sun, 21 May 2023 22:09:51 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:42652)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1q0pNH-0004RM-1o
 for buildroot@buildroot.org; Sun, 21 May 2023 22:09:51 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 21 May 2023 22:09:51 +0200
Message-Id: <20230521200951.3956187-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684699791-0A6CC4D3-B789EF21/0/0 CLEAN NORMAL
X-TOI-MSGID: 34331b94-bbbb-47c9-a6fa-99cd3c55c740
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-vbox: depends on tinyxml2
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

Upstream added the tinyxml2 dependency in the Nexus bump:
https://github.com/kodi-pvr/pvr.vbox/commit/99ae08a5fd10771773b9d35c180674c8c8cb3e9d

Buildroot commit 7f3762ae15793c3a123453434fa8299436db818a forgot to add
this dependency causing a configure error.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-vbox/Config.in        | 1 +
 package/kodi-pvr-vbox/kodi-pvr-vbox.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-pvr-vbox/Config.in b/package/kodi-pvr-vbox/Config.in
index 202e3c66e8..590877e1d7 100644
--- a/package/kodi-pvr-vbox/Config.in
+++ b/package/kodi-pvr-vbox/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_PVR_VBOX
 	bool "kodi-pvr-vbox"
+	select BR2_PACKAGE_TINYXML2
 	help
 	  Kodi PVR addon for interfacing with VBox Communications XTi TV
 	  Gateway
diff --git a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
index 60a8a819b0..e5e86274fc 100644
--- a/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
+++ b/package/kodi-pvr-vbox/kodi-pvr-vbox.mk
@@ -8,6 +8,6 @@ KODI_PVR_VBOX_VERSION = 20.4.2-Nexus
 KODI_PVR_VBOX_SITE = $(call github,kodi-pvr,pvr.vbox,$(KODI_PVR_VBOX_VERSION))
 KODI_PVR_VBOX_LICENSE = GPL-2.0+
 KODI_PVR_VBOX_LICENSE_FILES = LICENSE.md
-KODI_PVR_VBOX_DEPENDENCIES = kodi
+KODI_PVR_VBOX_DEPENDENCIES = kodi tinyxml2
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
