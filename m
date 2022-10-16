Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90473C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF79E60E7E;
	Sun, 16 Oct 2022 15:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF79E60E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tg7STjPpL6qB; Sun, 16 Oct 2022 15:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DF6760E55;
	Sun, 16 Oct 2022 15:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DF6760E55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E4C91BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D7641600
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:41:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D7641600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7EN8dwRJ_dxi for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:41:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CE2C41583
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1CE2C41583
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:41:52 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout10.t-online.de (Postfix) with SMTP id 840E616535
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 17:41:49 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.190.223]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ok5ls-4WAdTl0; Sun, 16 Oct 2022 17:41:48 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:37882)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ok5ls-0002IA-0V
 for buildroot@buildroot.org; Sun, 16 Oct 2022 17:41:48 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:41:47 +0200
Message-Id: <20221016154148.1254457-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665934908-3FFEEB8C-2E82698F/0/0 CLEAN NORMAL
X-TOI-MSGID: e23f7680-6d95-44d2-ac30-2b9d6a0a40cc
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.16.0
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

Release notes: https://github.com/intel/libva/blob/v2.16-branch/NEWS

Removed ac_cv_path_WAYLAND_SCANNER hack due to upstream commit
https://github.com/intel/libva/commit/a60756887e59bef0c7e8b7b20814c64666be497d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.hash | 6 +++---
 package/libva/libva.mk   | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index ecca9271cc..2916898c31 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,5 +1,5 @@
-# From https://github.com/intel/libva/releases/download/2.15.0/libva-2.15.0.tar.bz2.sha1sum
-sha1  b4fca8600961336b246e80552f9b0278c187051b  libva-2.15.0.tar.bz2
+# From https://github.com/intel/libva/releases/download/2.16.0/libva-2.16.0.tar.bz2.sha1sum
+sha1  ba1c0e196d69a26e54b065dc0f645bdf3be147a7  libva-2.16.0.tar.bz2
 # Locally computed
-sha256  258ed409458d3e7a000e1908bc852619615ee6a933359c745fcd93eb3e461eca  libva-2.15.0.tar.bz2
+sha256  115faca0db2c417a37da49830870e260450fa13066f5e24e252a20c36d920a1c  libva-2.16.0.tar.bz2
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 4138daf8b4..3b6e9580d3 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.15.0
+LIBVA_VERSION = 2.16.0
 LIBVA_SOURCE = libva-$(LIBVA_VERSION).tar.bz2
 LIBVA_SITE = https://github.com/intel/libva/releases/download/$(LIBVA_VERSION)
 LIBVA_LICENSE = MIT
@@ -30,7 +30,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_DEPENDENCIES += wayland
-LIBVA_CONF_ENV += ac_cv_path_WAYLAND_SCANNER=$(HOST_DIR)/bin/wayland-scanner
 LIBVA_CONF_OPTS += --enable-wayland
 else
 LIBVA_CONF_OPTS += --disable-wayland
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
