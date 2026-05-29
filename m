Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6027BCD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A05683CB9;
	Fri, 29 May 2026 08:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DLC7qHmiSgyO; Fri, 29 May 2026 08:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4931F83CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043806;
	bh=FJGXKZhFI5z5XvXjME2t2vH4CQ+zaE7DcRz7nWLemuU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kc1SddKJLXhRHN8qwPSmi3HctvcYP0t7L4wJCTCEvYam3bgJ66CpPoDYKCOq674Lu
	 TWwrmLEuUefG/RNASMwghfxK29LSNsGaeJ4Zibtpdx8o35q352ILVFCCFL7bsM2Dvb
	 w8Ci/eY4D+hig9JHRRJEx80IhgBPJYXBzmNFUui7ysVyw7PoZalu3r4x+mgp3MIeQ6
	 8mC+47fWOexjXLh5iUbhEbJGZhHrwHs0wvRph14BNt7KR/pHMguW3qeH29epRWdz8M
	 9zuojVP8PrycREyGWLyMZh8vyS+r1cTzsrI/vHQPfSCqAuBGqe+xRxuzLkSi9KS2IS
	 Y0oXva621HS2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4931F83CBE;
	Fri, 29 May 2026 08:36:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C9D7288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C7D441FEB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WwLwC_KtRH8 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07DD41FF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B07DD41FF6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E7E7868A0; Fri, 29 May 2026 08:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:33:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd4b24b8d9a825d4415e0d564b4597a0b718d642
X-Git-Newrev: afbc19284b627e040cc8eeebe28b82b0b4dbfcbd
X-Patchwork-Hint: ignore
Message-Id: <20260529083629.3E7E7868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libphidget: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/afbc19284b627e040cc8eeebe28b82b0b4dbfcbd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

As discussed on the mailinglist:
https://lists.buildroot.org/pipermail/buildroot/2026-April/799929.html

Fixes:
https://autobuild.buildroot.net/results/977/977964a64279e3d29cfa6a1083af613b99ac8039/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy                   |  8 ++++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/libphidget/Config.in       | 29 -----------------------------
 package/libphidget/libphidget.hash |  3 ---
 package/libphidget/libphidget.mk   | 16 ----------------
 6 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index f3b4c57a7d..e380258737 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_LIBPHIDGET
+	bool "libphidget"
+	select BR2_LEGACY
+	help
+	  libphidget was removed from Buildroot as it was
+	  insufficiently maintained. It can be re-added if someone
+	  volunteers to maintain it.
+
 config BR2_PACKAGE_PHIDGETWEBSERVICE
 	bool "phidgetwebservice"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 321b9dfe80..f5fa8b89c1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1726,7 +1726,6 @@ N:	Jonathan Ben Avraham <yba@tkos.co.il>
 F:	arch/Config.in.xtensa
 F:	package/autofs/
 F:	package/dawgdic/
-F:	package/libphidget/
 F:	package/rapidxml/
 
 N:	Joris Offouga <offougajoris@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index daab795124..f5e93688a5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1847,7 +1847,6 @@ menu "Hardware handling"
 	source "package/libnfc/Config.in"
 	source "package/libnvme/Config.in"
 	source "package/libpciaccess/Config.in"
-	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
 	source "package/libqmi/Config.in"
 	source "package/libqrtr-glib/Config.in"
diff --git a/package/libphidget/Config.in b/package/libphidget/Config.in
deleted file mode 100644
index ab1e3e31b1..0000000000
--- a/package/libphidget/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_PACKAGE_LIBPHIDGET
-	bool "libphidget"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBUSB
-	help
-	  The libphidget library provides an API for controlling
-	  Phidgets USB devices. The library translates API function
-	  calls to libusb function calls to control attached Phidgets
-	  devices that provide GPIO's, DAC's, accelerometers, servo
-	  motors, and other capabilities either singly or on combo
-	  devices.
-
-	  To use libphidget for controlling locally attached devices you
-	  need to set up the userspace USB device tree /dev/bus/usb. See
-	  file udev/99-phidgets.rules.
-
-	  The libphidget library also contains an API for sending
-	  commands to a local or remote phidgetwebservice using HTTP.
-	  The phidgetwebservice then translates HTTP requests to
-	  libphidget API function calls to control locally attached
-	  Phidgets devices.
-
-	  http://phidgets.com/
-
-comment "libphidget needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libphidget/libphidget.hash b/package/libphidget/libphidget.hash
deleted file mode 100644
index 7c2f67af7f..0000000000
--- a/package/libphidget/libphidget.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  b1682ffb4a9a7d4589ec24256cbd30af1342880914117d3e3f4814e70049238c  libphidget22-1.24.20260127.tar.gz
-sha256  7c1c42a1485cd44f9b8275931e645962b7af86c524c0b683ab9fba62e7e3ece5  COPYING
diff --git a/package/libphidget/libphidget.mk b/package/libphidget/libphidget.mk
deleted file mode 100644
index f81080e1da..0000000000
--- a/package/libphidget/libphidget.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# libphidget
-#
-################################################################################
-
-LIBPHIDGET_VERSION = 1.24.20260127
-LIBPHIDGET_SOURCE = libphidget22-$(LIBPHIDGET_VERSION).tar.gz
-LIBPHIDGET_SITE = https://www.phidgets.com/downloads/phidget22/libraries/linux/libphidget22
-LIBPHIDGET_DEPENDENCIES = libusb
-LIBPHIDGET_CONF_OPTS = --disable-ldconfig
-LIBPHIDGET_INSTALL_STAGING = YES
-LIBPHIDGET_LICENSE = BSD-3-Clause
-LIBPHIDGET_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
