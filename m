Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0C08C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:42:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3041661041
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 13:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3041661041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE7EA606F1;
	Sun, 26 Sep 2021 13:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dniYvgX2yaM; Sun, 26 Sep 2021 13:42:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DBA5605DE;
	Sun, 26 Sep 2021 13:42:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 591C61BF30A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4494F606BD
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 13:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 043sgyZ60HBe for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 13:42:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 37DAE605DE
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 13:42:10 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout03.t-online.de (Postfix) with SMTP id 30EE33346
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 15:41:26 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.205.79]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mUUNA-2ZmEt70; Sun, 26 Sep 2021 15:39:16 +0200
Received: from [192.168.1.109] (port=47028 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mUUNA-00019B-9e
 for buildroot@buildroot.org; Sun, 26 Sep 2021 15:39:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 15:39:16 +0200
Message-Id: <20210926133916.2689805-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1632663556-00001468-8E9AFE4B/0/0 CLEAN NORMAL
X-TOI-MSGID: 4daf7e00-57d4-4066-9736-26685b76e366
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-fishbmc: add
 dependency to glm
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

The glm dependency was added upstream in 2019:
https://github.com/xbmc/visualization.fishbmc/commit/31eda216bc9f2f3883217471cfd01afde153c3eb

and was not added when this package was bumped to version 6.3.0:
https://git.buildroot.net/buildroot/commit/?id=7ad1e18bfb93cce3d397b3a2afc3ad418b828e01

This bug was found while testing per-package directories.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-visualisation-fishbmc/Config.in                    | 1 +
 .../kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk    | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi-visualisation-fishbmc/Config.in b/package/kodi-visualisation-fishbmc/Config.in
index 66c1565bd7..4d86d8234b 100644
--- a/package/kodi-visualisation-fishbmc/Config.in
+++ b/package/kodi-visualisation-fishbmc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_VISUALISATION_FISHBMC
 	bool "kodi-visualisation-fishbmc"
+	select BR2_PACKAGE_GLM
 	help
 	  Fische visualiser for Kodi
 
diff --git a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
index 1008e6f6f1..8e0fcabff9 100644
--- a/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
+++ b/package/kodi-visualisation-fishbmc/kodi-visualisation-fishbmc.mk
@@ -8,6 +8,6 @@ KODI_VISUALISATION_FISHBMC_VERSION = 19.0.0-Matrix
 KODI_VISUALISATION_FISHBMC_SITE = $(call github,xbmc,visualization.fishbmc,$(KODI_VISUALISATION_FISHBMC_VERSION))
 KODI_VISUALISATION_FISHBMC_LICENSE = GPL-2.0+
 KODI_VISUALISATION_FISHBMC_LICENSE_FILES = LICENSE.md
-KODI_VISUALISATION_FISHBMC_DEPENDENCIES = kodi
+KODI_VISUALISATION_FISHBMC_DEPENDENCIES = glm kodi
 
 $(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
