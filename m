Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27261EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 22:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF24E60C2E;
	Tue, 18 Jul 2023 22:17:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF24E60C2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foMvHdqvFG0l; Tue, 18 Jul 2023 22:17:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4656C60D59;
	Tue, 18 Jul 2023 22:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4656C60D59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEF871BF2CA
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C45C7417A5
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C45C7417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJ7M3kE7GeVA for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 22:17:48 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E03F74179B
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 22:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E03F74179B
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 63FF1A4C032D
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 00:11:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51446)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLsue-0000Ha-0X
 for buildroot@buildroot.org; Wed, 19 Jul 2023 00:11:20 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Jul 2023 00:11:20 +0200
Message-Id: <20230718221120.1433795-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689718280;
 bh=bjJEXRds+0sJRXis0J+MO+VpcKktkyQvcu9wOrqnBoc=;
 h=From:To:Subject:Date:From;
 b=XngommwXywMs0d3J3DQAnEyBqUZdMeLxEU8ofHqzrmM56lyub4DhEa9pDcyJF+M3r
 EqwHP0GnlkVzYl4LH8BigDpDg2zYdO0T+5JBZogQLPu0pUq7dH5ts9IBP9CfyDnNvR
 FplcGhCH5oW4SGNkigCbwsWVe48p0rGVcrkiO4Nme5TyllnD1xvcbFLplqclENR/sY
 Q0ai+fWt64sG5QEkwfiQ+5LZTY8+eIr5CKVETqMhq0a2lvm75l6iWWy8TNGOzdb4cI
 Z6nDJfFabwGQB0RPhEksMuqwFqHjEfOzuXF/gKqlvhDtf+oPQOgd6hDUUJxmoKe35z
 yB2LTNuQC1BxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XngommwX
Subject: [Buildroot] [PATCH v2 1/1] package/kodi: fix filenames of kodi host
 utils
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

The variables WITH_JSONSCHEMABUILDER & WITH_TEXTUREPACKER are defined as
directories:
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindJsonSchemaBuilder.cmake
https://github.com/xbmc/xbmc/blob/master/cmake/modules/buildtools/FindTexturePacker.cmake

and during configure kodi searches these directories for usable binaries
with the name scheme.

${APP_NAME_LC}-JsonSchemaBuilder
${APP_NAME_LC}-TexturePacker

which translates to kodi-JsonSchemaBuilder and kodi-TexturePacker.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: also updated kodi-skin-confluence.mk

 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-skin-confluence/kodi-skin-confluence.mk     | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/kodi.mk                                     | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
index 569bde8cd2..e017aa8d9c 100644
--- a/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
+++ b/package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk
@@ -20,7 +20,7 @@ HOST_KODI_JSONSCHEMABUILDER_CONF_OPTS = \
 define HOST_KODI_JSONSCHEMABUILDER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
 		$(@D)/tools/depends/native/JsonSchemaBuilder/JsonSchemaBuilder \
-		$(HOST_DIR)/bin/JsonSchemaBuilder
+		$(HOST_DIR)/bin/kodi-JsonSchemaBuilder
 endef
 
 $(eval $(host-cmake-package))
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 43d0c4bff6..58e51ffc8a 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -11,7 +11,7 @@ KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
 KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
 
 define KODI_SKIN_CONFLUENCE_BUILD_CMDS
-	$(HOST_DIR)/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
+	$(HOST_DIR)/bin/kodi-TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
 endef
 
 define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
diff --git a/package/kodi-texturepacker/kodi-texturepacker.mk b/package/kodi-texturepacker/kodi-texturepacker.mk
index 44eba85d75..c0bc767dd4 100644
--- a/package/kodi-texturepacker/kodi-texturepacker.mk
+++ b/package/kodi-texturepacker/kodi-texturepacker.mk
@@ -35,7 +35,7 @@ HOST_KODI_TEXTUREPACKER_CONF_OPTS += \
 define HOST_KODI_TEXTUREPACKER_INSTALL_CMDS
 	$(INSTALL) -m 755 -D \
 		$(@D)/tools/depends/native/TexturePacker/TexturePacker \
-		$(HOST_DIR)/bin/TexturePacker
+		$(HOST_DIR)/bin/kodi-TexturePacker
 endef
 
 $(eval $(host-cmake-package))
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 54b7673150..c8555788b7 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -87,8 +87,8 @@ KODI_CONF_OPTS += \
 	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_PATH=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR) \
 	-DPYTHON_VER=$(PYTHON3_VERSION_MAJOR) \
-	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/JsonSchemaBuilder \
-	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/TexturePacker \
+	-DWITH_JSONSCHEMABUILDER=$(HOST_DIR)/bin/ \
+	-DWITH_TEXTUREPACKER=$(HOST_DIR)/bin/ \
 	-DLIBDVDCSS_URL=$(KODI_DL_DIR)/kodi-libdvdcss-$(KODI_LIBDVDCSS_VERSION).tar.gz \
 	-DLIBDVDNAV_URL=$(KODI_DL_DIR)/kodi-libdvdnav-$(KODI_LIBDVDNAV_VERSION).tar.gz \
 	-DLIBDVDREAD_URL=$(KODI_DL_DIR)/kodi-libdvdread-$(KODI_LIBDVDREAD_VERSION).tar.gz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
