Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD01C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 22:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 434AD80E92;
	Sat, 15 Aug 2026 22:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGCw35B2OccE; Sat, 15 Aug 2026 22:02:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9087780E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786831325;
	bh=FfiCkexZd6yEwNgJd875EXywnyDsKTpOxeCL/nYDPu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jzhL56o7frW3JaVjChuvLqeKV05TtvEVcU0D5aD+Fk+v/NColaEdczX9B9YRtGIMZ
	 PTq0LABN5LMMhTVjxUfyi9Y+H2OGgnZoz/wdxfZuytNeTl5p6RQNjyNsBQnjMydiLx
	 luIJY5/vpG+sZHVcfUlRMs1Sf72ranjH2VJcFzP3NVky+9psjn/kwylRk2jV4Nv7ej
	 xYeAskPKyIs1jiGvVCsggpQXjD8u9VYRHTbVGTTsme4UyTvCqDdhvT29HNoP6ld9Dc
	 QSzL+SPKeqjyhXkAH5pf0f675Fknd7gqQai8k3Ynq+gk9ztIoksz7udmHrbmPmoLAP
	 8bZgBpjGAXnDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9087780E4E;
	Sat, 15 Aug 2026 22:02:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A40A9336
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A1BBF407B0
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:02:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69ffoWbqV9iW for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 22:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DE4407AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11DE4407AF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 22:02:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F7EE8D9BE; Sat, 15 Aug 2026 22:01:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 23:38:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd9f9b47d7c00ae404d8d0eee47ddd6ce58143eb
X-Git-Newrev: 1d132d04fc0ecac014be003b7e1662c47672328b
X-Patchwork-Hint: ignore
Message-Id: <20260815220112.3F7EE8D9BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpiod2: bump to version 2.3.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d132d04fc0ecac014be003b7e1662c47672328b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- buildsystem changed from autotools to meson
- add option to install dbus-server and client

changelog:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/tree/NEWS?h=v2.3.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
[Julien:
 - propagate libgudev dependencies on dbus option
 - add Config.in comments for dbus option
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpiod2/Config.in      | 18 ++++++++++++++++++
 package/libgpiod2/libgpiod2.hash |  2 +-
 package/libgpiod2/libgpiod2.mk   | 29 ++++++++++++++++++-----------
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/package/libgpiod2/Config.in b/package/libgpiod2/Config.in
index 5a13bfc344..d65cd4a494 100644
--- a/package/libgpiod2/Config.in
+++ b/package/libgpiod2/Config.in
@@ -16,6 +16,24 @@ config BR2_PACKAGE_LIBGPIOD2
 
 if BR2_PACKAGE_LIBGPIOD2
 
+config BR2_PACKAGE_LIBGPIOD2_DBUS
+	bool "install dbus-server and client"
+	depends on BR2_PACKAGE_HAS_UDEV # libgudev
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev
+	depends on BR2_USE_MMU # libgudev
+	depends on BR2_USE_WCHAR # libgudev
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  Include dbus-server and client for managing GPIOs.
+
+comment "libgpiod2 dbus needs udev /dev management"
+	depends on BR2_USE_MMU
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+comment "libgpiod2 dbus needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
 config BR2_PACKAGE_LIBGPIOD2_TOOLS
 	bool "install tools"
 	help
diff --git a/package/libgpiod2/libgpiod2.hash b/package/libgpiod2/libgpiod2.hash
index a12752261a..48f7c77855 100644
--- a/package/libgpiod2/libgpiod2.hash
+++ b/package/libgpiod2/libgpiod2.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256  13207176b0eb9b3e0f02552d5f49f5a6a449343ce47416158bb484d9d3019592  libgpiod-2.2.4.tar.xz
+sha256  e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30  libgpiod-2.3.1.tar.xz
 # Hash for license file
 sha256  f646ad5159efb51c1130a4b43c31f0759750b1e254d2acf510f368ee2e2085c3  COPYING
diff --git a/package/libgpiod2/libgpiod2.mk b/package/libgpiod2/libgpiod2.mk
index d83fdbd94a..d74c98684c 100644
--- a/package/libgpiod2/libgpiod2.mk
+++ b/package/libgpiod2/libgpiod2.mk
@@ -6,7 +6,7 @@
 
 # Be careful when bumping versions.
 # Dependency on kernel header versions may change.
-LIBGPIOD2_VERSION = 2.2.4
+LIBGPIOD2_VERSION = 2.3.1
 LIBGPIOD2_SOURCE = libgpiod-$(LIBGPIOD2_VERSION).tar.xz
 LIBGPIOD2_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD2_LICENSE = LGPL-2.1+
@@ -14,27 +14,34 @@ LIBGPIOD2_LICENSE_FILES = COPYING
 LIBGPIOD2_INSTALL_STAGING = YES
 LIBGPIOD2_DEPENDENCIES = host-pkgconf
 LIBGPIOD2_CONF_OPTS = \
-	--disable-bindings-python \
-	--disable-examples \
-	--disable-tests
+	-Dbindings-python=disabled \
+	-Dexamples=disabled \
+	-Dtests=disabled
+
+ifeq ($(BR2_PACKAGE_LIBGPIOD2_DBUS),y)
+LIBGPIOD2_CONF_OPTS += -Ddbus=enabled
+LIBGPIOD2_DEPENDENCIES += libgudev
+else
+LIBGPIOD2_CONF_OPTS += -Ddbus=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD2_TOOLS),y)
-LIBGPIOD2_CONF_OPTS += --enable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-tools
+LIBGPIOD2_CONF_OPTS += -Dtools=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEDIT),y)
 LIBGPIOD2_DEPENDENCIES += libedit
-LIBGPIOD2_CONF_OPTS += --enable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-gpioset-interactive
+LIBGPIOD2_CONF_OPTS += -Dgpioset-interactive=disabled
 endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
-LIBGPIOD2_CONF_OPTS += --enable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=enabled
 else
-LIBGPIOD2_CONF_OPTS += --disable-bindings-cxx
+LIBGPIOD2_CONF_OPTS += -Dbindings-cxx=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
