Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDCBC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 13:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3325C60F6D;
	Tue,  4 Oct 2022 13:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3325C60F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3MB0h5hkKAc; Tue,  4 Oct 2022 13:32:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD7060B70;
	Tue,  4 Oct 2022 13:32:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD7060B70
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BDE9C1BF841
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9985683096
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 13:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9985683096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JA-TRibDr4oj for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 13:31:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABFF483046
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABFF483046
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 13:31:22 +0000 (UTC)
Received: from 91-153-34-120.elisa-laajakaista.fi ([91.153.34.120] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ofi10-007mYY-Dh; Tue, 04 Oct 2022 15:31:18 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 359357fc;
 Tue, 4 Oct 2022 13:30:57 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Tue,  4 Oct 2022 16:30:57 +0300
Message-Id: <20221004133057.2003750-6-aperez@igalia.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004133057.2003750-1-aperez@igalia.com>
References: <20220920230029.1680134-1-aperez@igalia.com>
 <20221004133057.2003750-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nZmkucNKxUlTNcQEx+coGC/u8/1TFbIWpEOCABfX9B4=; b=Nqgq4LoILw3Quiesz0k7Rv6bid
 nN5SbCGdeeE6MxEeLveEeGI1kR2HTrAsMY0daWDRZp9Q1UcctZfzMm2c+0XQ5d1tIBUJiYXrj7AIg
 PZVr5E3kDqlP+TP0xpYP2VesbCn1LEgKJoq3GnxWzlpV/e7mO2qbgswr0fjOtFUTcDLLkONzSozqB
 ozAAoHozlOQM+i6kLMpCGrZNcViWXejMv9X/OLdzxO7LFq+QRhcOKqs1fmK99ehlBewuZZ3GwLMCa
 S1JFMLOkDNJKIyE2ZHz8mdNb/Sk2oiX/vXxJURUYD4pk6gCW4HQVx4HVuhny2LZLhofC65AMU8XKa
 bO6oJ/vg==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=Nqgq4LoI
Subject: [Buildroot] [PATCH 5/5] package/cog: bump to version 0.16.0
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This new version includes support for setting proxy options and gamepad
support. Release notes:

  https://wpewebkit.org/release/cog-0.16.0.html

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash |  8 ++++----
 package/cog/cog.mk   | 37 ++++++++++++++++++++-----------------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index aa128d73d8..a2c55c4b94 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
-md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
-sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
-sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
+# From https://wpewebkit.org/releases/cog-0.16.0.tar.xz.sums
+md5  2705472ea4f333290973722c0862b21d  cog-0.16.0.tar.xz
+sha1  ef16e5e3d91d0da056fe5e4f596c211af7453b4e  cog-0.16.0.tar.xz
+sha256  2956f719d36c9a6368f63901a0d1ceaf4d27f529f7df441b3748c36d72906fc6  cog-0.16.0.tar.xz
 
 # Hashes for license files:
 sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 1f24bebee4..ac2ec2a30e 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COG_VERSION = 0.14.1
+COG_VERSION = 0.16.0
 COG_SITE = https://wpewebkit.org/releases
 COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
@@ -12,37 +12,40 @@ COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo wayland
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
 COG_CONF_OPTS = \
-	-DCOG_BUILD_PROGRAMS=ON \
-	-DCOG_PLATFORM_HEADLESS=ON \
-	-DINSTALL_MAN_PAGES=OFF \
-	-DCOG_HOME_URI='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
-	-DUSE_SOUP2=ON
+	-Ddocumentation=false \
+	-Dmanpages=false \
+	-Dprograms=true \
+	-Dsoup2=true \
+	-Dcog_home_uri='$(call qstrip,$(BR2_PACKAGE_COG_PROGRAMS_HOME_URI))' \
+	-Dplatforms='$(subst $(space),$(comma),$(strip $(COG_PLATFORMS_LIST)))'
+
+COG_PLATFORMS_LIST = headless
 
 ifeq ($(BR2_PACKAGE_WESTON),y)
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=ON
+COG_CONF_OPTS += -Dwayland_weston_direct_display=true
 COG_DEPENDENCIES += weston
 else
-COG_CONF_OPTS += -DCOG_WESTON_DIRECT_DISPLAY=OFF
+COG_CONF_OPTS += -Dwayland_weston_direct_display=false
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_FDO),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=ON
+COG_PLATFORMS_LIST += wayland
 COG_DEPENDENCIES += libxkbcommon wayland-protocols
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_WL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_PLATFORM_DRM),y)
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=ON
+COG_PLATFORMS_LIST += drm
 COG_DEPENDENCIES += libdrm libinput libgbm libegl udev
-else
-COG_CONF_OPTS += -DCOG_PLATFORM_DRM=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_COG_USE_SYSTEM_DBUS),y)
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=ON
+COG_CONF_OPTS += -Dcog_dbus_control=system
 else
-COG_CONF_OPTS += -DCOG_DBUS_SYSTEM_BUS=OFF
+COG_CONF_OPTS += -Dcog_dbus_control=user
 endif
 
-$(eval $(cmake-package))
+ifeq ($(BR2_PACKAGE_LIBMANETTE),y)
+COG_DEPENDENCIES += libmanette
+endif
+
+$(eval $(meson-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
