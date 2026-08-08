Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45678C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 18:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3208C4054B;
	Sat,  8 Aug 2026 18:26:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUXUarpv5pmb; Sat,  8 Aug 2026 18:26:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 118C7404F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786213567;
	bh=hv+CZiPykg1pOBEaCS46savKfva088kV8HrPbylOs4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DwJM2vYi9JB6q59B8MJ9RY7FS53QT0JMBw2bNV2TZoKInqP6q9X/sM8XBV8AsOZL6
	 0ms4a/CcmVEeYnjVndnHBPLSR5w94FQ8gNEI6Nj7xC5/JRanjcWcD13zmIzySUteyz
	 CHawn+cNn/SES7UAp+yruFryThYtG+J5R5BxLMHGqkQ6780Vkh1HkYLp0046wN6HwO
	 G5CM4xgn4tbVvj7/C6kn+KPclbAzbx0nHQoWAVHYN0lVyQ1HCqBaEnvSCrGjrO/Hwf
	 WkZXDnlam6HvvsJsRWaRZPR3EGZfPOizXHRYQeMeo8wUtS3WmO8NJbH9qr1cTLDFXP
	 Zd6W9j/STlNmQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 118C7404F4;
	Sat,  8 Aug 2026 18:26:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC241AF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01DA680DD1
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fagZRTF0HTmu for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 18:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34B7680DCF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34B7680DCF
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 18:26:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 096288CAA6; Sat,  8 Aug 2026 18:25:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 8 Aug 2026 19:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7241fb2db05ec5e6f584a3965aed483ac2d673e0
X-Git-Newrev: cf95721d0049e994068ab971f4bd62a465dfe041
X-Patchwork-Hint: ignore
Message-Id: <20260808182518.096288CAA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libva-intel-driver: bump version
 to 2.4.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf95721d0049e994068ab971f4bd62a465dfe041
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/irql-notlessorequal/intel-vaapi-driver/blob/2.4.5/NEWS

This bump follows
https://github.com/LibreELEC/LibreELEC.tv/commit/39d2ff612fce9bb57c43ac767df15052a896e9ed

"Intel archived intel/intel-vaapi-driver at 2.4.1 and advises forking.
 irql-notlessorequal/intel-vaapi-driver is the active continuation (119
 commits ahead, tagged releases, Chromium fixes), so track it at 2.4.5.
 [...]
 The fork renamed the wayland meson option, so switch with_wayland to
 with_wayland_drm in all DISPLAYSERVER branches. Also drop the dead
 01.org PKG_SITE."

Updated license file and hash due to upstream commit:
https://github.com/irql-notlessorequal/intel-vaapi-driver/commit/7343767d87926d519f528db88ba1edfb153d8289

Also switch build system to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libva-intel-driver/Config.in               |  2 +-
 package/libva-intel-driver/libva-intel-driver.hash |  6 ++----
 package/libva-intel-driver/libva-intel-driver.mk   | 18 ++++++++----------
 3 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
index 53c5b366c3..a71a5a6b9a 100644
--- a/package/libva-intel-driver/Config.in
+++ b/package/libva-intel-driver/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 	help
 	  VA-API back-end driver for Intel graphics chips
 
-	  https://01.org/vaapi
+	  https://github.com/irql-notlessorequal/intel-vaapi-driver
 
 comment "libva intel driver needs a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/libva-intel-driver/libva-intel-driver.hash b/package/libva-intel-driver/libva-intel-driver.hash
index 4bf827748f..459a8b80e2 100644
--- a/package/libva-intel-driver/libva-intel-driver.hash
+++ b/package/libva-intel-driver/libva-intel-driver.hash
@@ -1,5 +1,3 @@
-# From https://github.com/intel/intel-vaapi-driver/releases
-sha1  c998e06f13238c6419bb38ede9a13e453312737b  intel-vaapi-driver-2.4.1.tar.bz2
 # Locally computed
-sha256  0081fce08eb3a83f7d99c3b853c8fdfa0af437b8f5b0fb7c66faeb83bcbe0c19  intel-vaapi-driver-2.4.1.tar.bz2
-sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
+sha256  f89f77bc46ec6f46392c1b90b9bf34d09f908bf33c9d16d385897b1fe282bacc  libva-intel-driver-2.4.5.tar.gz
+sha256  b3a55fe5734da7831d7b359e52f8f7026e05216d58479981407c184afb8b24f9  LICENSE
diff --git a/package/libva-intel-driver/libva-intel-driver.mk b/package/libva-intel-driver/libva-intel-driver.mk
index ad801dc957..1c23bf69f9 100644
--- a/package/libva-intel-driver/libva-intel-driver.mk
+++ b/package/libva-intel-driver/libva-intel-driver.mk
@@ -4,26 +4,24 @@
 #
 ################################################################################
 
-LIBVA_INTEL_DRIVER_VERSION = 2.4.1
-LIBVA_INTEL_DRIVER_SOURCE = intel-vaapi-driver-$(LIBVA_INTEL_DRIVER_VERSION).tar.bz2
-LIBVA_INTEL_DRIVER_SITE = \
-	https://github.com/intel/intel-vaapi-driver/releases/download/$(LIBVA_INTEL_DRIVER_VERSION)
+LIBVA_INTEL_DRIVER_VERSION = 2.4.5
+LIBVA_INTEL_DRIVER_SITE = $(call github,irql-notlessorequal,intel-vaapi-driver,$(LIBVA_INTEL_DRIVER_VERSION))
 LIBVA_INTEL_DRIVER_LICENSE = MIT
-LIBVA_INTEL_DRIVER_LICENSE_FILES = COPYING
+LIBVA_INTEL_DRIVER_LICENSE_FILES = LICENSE
 LIBVA_INTEL_DRIVER_DEPENDENCIES = host-pkgconf libdrm libva
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
-LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_x11=yes
 else
-LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-x11
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_x11=no
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
 LIBVA_INTEL_DRIVER_DEPENDENCIES += wayland
-LIBVA_INTEL_DRIVER_CONF_OPTS += --enable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_wayland_drm=yes
 else
-LIBVA_INTEL_DRIVER_CONF_OPTS += --disable-wayland
+LIBVA_INTEL_DRIVER_CONF_OPTS += -Dwith_wayland_drm=no
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
