Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEE7C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 14:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 989BC60A9C;
	Sun,  7 May 2023 14:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 989BC60A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TY4P5Cq3CVDW; Sun,  7 May 2023 14:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D996060586;
	Sun,  7 May 2023 14:23:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D996060586
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12C801BF2F8
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF4054156C
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 14:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF4054156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9ClX7MniBNU for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 14:23:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB7540882
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB7540882
 for <buildroot@buildroot.org>; Sun,  7 May 2023 14:23:22 +0000 (UTC)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
 by mailout08.t-online.de (Postfix) with SMTP id BF10823474;
 Sun,  7 May 2023 16:23:19 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd72.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvfIF-05R7xZ0; Sun, 7 May 2023 16:23:19 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:49366)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvfIF-0006RF-0p;
 Sun, 07 May 2023 16:23:19 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 16:23:18 +0200
Message-Id: <20230507142319.1001150-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683469399-3D0AAC0E-6FC1FF0C/0/0 CLEAN NORMAL
X-TOI-MSGID: ce29ba97-0d0e-4b6c-87e0-8a6c7a452de2
Subject: [Buildroot] [PATCH 1/2] package/hwdata: install to staging
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build-time dependency for the new libdisplay-info package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/hwdata/hwdata.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 755a9c93f1..cbac3a22d4 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -8,6 +8,7 @@ HWDATA_VERSION = 0.369
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
+HWDATA_INSTALL_STAGING = YES
 
 HWDATA_FILES = \
 	$(if $(BR2_PACKAGE_HWDATA_IAB_OUI_TXT),iab.txt oui.txt) \
@@ -15,7 +16,22 @@ HWDATA_FILES = \
 	$(if $(BR2_PACKAGE_HWDATA_PNP_IDS),pnp.ids) \
 	$(if $(BR2_PACKAGE_HWDATA_USB_IDS),usb.ids)
 
+define HWDATA_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
+endef
+
+define HWDATA_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) hwdata.pc
+endef
+
 ifneq ($(strip $(HWDATA_FILES)),)
+define HWDATA_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/hwdata.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/hwdata.pc
+	$(INSTALL) -d -m 755 $(STAGING_DIR)/usr/share/hwdata
+	$(INSTALL) -m 644 -t $(STAGING_DIR)/usr/share/hwdata \
+		$(addprefix $(@D)/,$(HWDATA_FILES))
+endef
 define HWDATA_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/hwdata
 	$(INSTALL) -m 644 -t $(TARGET_DIR)/usr/share/hwdata \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
