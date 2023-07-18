Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E046EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA81F6103F;
	Tue, 18 Jul 2023 20:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA81F6103F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Sqt8zEr-QJA; Tue, 18 Jul 2023 20:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1B3C61026;
	Tue, 18 Jul 2023 20:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1B3C61026
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E4EF1BF20B
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36F8F40589
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F8F40589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Agcz44HDW7F2 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:59:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE99840280
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE99840280
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:59:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F359CA4C0FEA;
 Tue, 18 Jul 2023 22:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50096)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLrmo-0004Rb-27;
 Tue, 18 Jul 2023 22:59:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:59:10 +0200
Message-Id: <20230718205910.2667726-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230718205910.2667726-1-bernd@kuhls.net>
References: <20230718205910.2667726-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689713950;
 bh=zVCgk+jRAYwSjx3iJ+048MepuFS2vjKMTmmYYiu0HL8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xIz49BZq8zgmTRzf8MhLDa+DAV31bfpBPdzmevyQZqC+DtBmur529/1Vr5MwTwYla
 C/ob78fMvjeQFgwpbRUQ8/oxB7Fus/6ZrmBIvUXZygeOhu3nU9+YkRdWpxttSBGI/j
 iyqcrTNA7rmc/xO5w+AJ1vb/CdfZquZ8oY/oCcYUpuRetRifhsfM401KPvTpa5Fh0u
 5dvcU35sNF3RGGhvO0Lg+p0AoIAzWzfyjK66Yd+NN+RrPJ5HXvbSMqhIhfpOGRAFUR
 c+has8DDCQnekkgQlJPlSxjHIKyxIKQTNBvLt5P/hJZ/q4uWJ25SlVQw8qX5fckYu4
 HKglvowXX1AHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=xIz49BZq
Subject: [Buildroot] [PATCH 3/3] package/kodi: fix filenames of kodi host
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
 package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
 package/kodi/kodi.mk                                     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

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
index 7cbc1df40a..561f0d2e3a 100644
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
