Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B5DCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00DBB40FA9;
	Fri,  3 Oct 2025 20:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4RL3X2Au_Z-l; Fri,  3 Oct 2025 20:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A73F41197
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A73F41197;
	Fri,  3 Oct 2025 20:12:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09A4F118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3679834C7
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pdOGGZwP0Cbw for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:12:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E08F98348C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E08F98348C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E08F98348C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:12:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96193A4C5BCF;
 Fri,  3 Oct 2025 22:12:42 +0200 (CEST)
Received: from [192.168.1.144] (port=42792 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4m8w-000000007Lw-0OtU;
 Fri, 03 Oct 2025 20:12:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri,  3 Oct 2025 22:12:41 +0200
Message-ID: <20251003201241.2430247-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003201241.2430247-1-bernd@kuhls.net>
References: <20251003201241.2430247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759522362;
 bh=0HRus1cD4nzlItFykTHZ/ExQWGkoK0f4hQtii90O2cY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=caRQAUetXoiX9DvVrNQbRApQlceJDkdjA2X89Xtr46GuktAhTzR5yg5US4Fy3RJuP
 XQdilUpWUlpTUiBVvaRl4N8BpxoqsUVVyjPKE3w9UzClYQvlf5pcw2rHk9pAqNZROU
 NJ9ITwpSiC6Thoqne/UEbO1fKlRhUVKDH/E1Vk4/M9RjAs3V3Qx+lhY0TWUdsGfHyg
 gI3UDRp/9lg/YnkBvo8aAt/ecdYPm71SIrxFvqlULjocuAQCqEqeXQbLvmmc7t9ro9
 2YEvKABBsTb8ZdBA45NHIkuffKPXVx0LG2o4fgvUSfTxsaD+u2yvpQ5ytz+9kJ4or5
 o7dM5x+06b7Pw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=caRQAUet
Subject: [Buildroot] [PATCH 2/2] package/libbluray: bump version to 1.4.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Changelog:
https://code.videolan.org/videolan/libbluray/-/blob/1.4.0/ChangeLog

Switched _SITE to https.
Follow upstream switch to meson and xz tarball.

Depends on libudfread bump to 1.2.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbluray/libbluray.hash |  4 ++--
 package/libbluray/libbluray.mk   | 25 +++++++++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/package/libbluray/libbluray.hash b/package/libbluray/libbluray.hash
index a631722bb0..cc5bb2f753 100644
--- a/package/libbluray/libbluray.hash
+++ b/package/libbluray/libbluray.hash
@@ -1,4 +1,4 @@
-# From http://download.videolan.org/pub/videolan/libbluray/1.3.4/libbluray-1.3.4.tar.bz2.sha512
-sha512  94dbf3b68d1c23fe4648c153cc2f0c251886fac0a6b6bbe3a77caabaa5322682f712afe4a7b6b16ca3f06744fbc0e1ca872209a32898dcf0ae182055d335aec1  libbluray-1.3.4.tar.bz2
+# From https://download.videolan.org/pub/videolan/libbluray/1.4.0/libbluray-1.4.0.tar.xz.sha512
+sha512  7284169b32624e5ca4fd71b260a4cc2921efafb1f63143a562568be45e373bfcbfeac63895d5659ccdcb11d7dbd0236cc46ccb15c12eff855703010e46991f27  libbluray-1.4.0.tar.xz
 # Locally computed
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  COPYING
diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 54f4caa368..4b20dd404a 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -4,46 +4,47 @@
 #
 ################################################################################
 
-LIBBLURAY_VERSION = 1.3.4
-LIBBLURAY_SITE = http://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
-LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.bz2
+LIBBLURAY_VERSION = 1.4.0
+LIBBLURAY_SOURCE = libbluray-$(LIBBLURAY_VERSION).tar.xz
+LIBBLURAY_SITE = https://download.videolan.org/pub/videolan/libbluray/$(LIBBLURAY_VERSION)
 LIBBLURAY_INSTALL_STAGING = YES
 LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_CPE_ID_VENDOR = videolan
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
-LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
+LIBBLURAY_CONF_OPTS = -Dbdj_jar=disabled
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+LIBBLURAY_CONF_OPTS += -Dembed_udfread=false
 LIBBLURAY_DEPENDENCIES += libudfread
 else
-LIBBLURAY_CONF_OPTS += --without-external-libudfread
+LIBBLURAY_CONF_OPTS += -Dembed_udfread=true
 endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
+LIBBLURAY_CONF_OPTS += -Dfreetype=enabled
 LIBBLURAY_DEPENDENCIES += freetype
-LIBBLURAY_CONF_OPTS += --with-freetype
 else
-LIBBLURAY_CONF_OPTS += --without-freetype
+LIBBLURAY_CONF_OPTS += -Dfreetype=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBBLURAY_CONF_OPTS += -Dfontconfig=enabled
 LIBBLURAY_DEPENDENCIES += fontconfig
-LIBBLURAY_CONF_OPTS += --with-fontconfig
 else
-LIBBLURAY_CONF_OPTS += --without-fontconfig
+LIBBLURAY_CONF_OPTS += -Dfontconfig=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBBLURAY_CONF_OPTS += -Dlibxml2=enabled
 LIBBLURAY_DEPENDENCIES += libxml2
-LIBBLURAY_CONF_OPTS += --with-libxml2
 else
-LIBBLURAY_CONF_OPTS += --without-libxml2
+LIBBLURAY_CONF_OPTS += -Dlibxml2=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
