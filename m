Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE317CD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3AD613D8;
	Fri, 29 May 2026 08:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDuaD9qjgR0E; Fri, 29 May 2026 08:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65EF2613DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043807;
	bh=7JaXuBM4rr0pFuy3g09lZp0hS4xJE4Tz00xDwahEEtA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g47lkg3YoDE5JtzjRNP4fsml/9lZ332i9idf7SL+HX/uZ+Lq7jEiCGNgK8LEjescj
	 RrZA4HfeJghh5bi5Gnb9oXw588Ya6OJ13sK4CcjbOVrQ79VZLlyshqhlmPsjffNJKy
	 B/yjwuGAeYV2MKNOB6mp0A21Gkmes49NBDxFHf1lFmSPo4PFNfoOWJHM1Yiz/CoOu+
	 Kt3tJk/6IF4IVOLW0wyHuS0NpJZKUEP2zXUAW4DnYszsTZilK/a0PXzJWzQjAcP8r7
	 SmeMLw+kmh96sHogkvL/0moTg6YlZCkGMoZuvuqW1QwfRiDgZrESoNNQC52Uidv+Gh
	 tSKLuMEx/mzXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65EF2613DF;
	Fri, 29 May 2026 08:36:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85F1228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DE2A41FF6
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nNhvEebgRZEp for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D45BB42048
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D45BB42048
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:36:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 728F1868A0; Fri, 29 May 2026 08:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:35:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ce7034cdd858f87f95dcd4f5c092f551dfe949c
X-Git-Newrev: 4cd487fe9d185267def6c1a3109574ea10e54551
X-Patchwork-Hint: ignore
Message-Id: <20260529083629.728F1868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pigpio: remove package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cd487fe9d185267def6c1a3109574ea10e54551
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Build is broken with gcc 15.x.

Debian removed the package in 2025:
https://tracker.debian.org/news/1668850/pigpio-removed-from-testing/

Last upstream commit: March 2021
Open PR: 21
Open issues: 87

One of the open issues mentions incompatibility with Pi 5+:
https://github.com/joan2937/pigpio/issues/589

Fixes:
https://autobuild.buildroot.net/results/09e/09e2213727205674284204ce0604d34b10a5a543/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .checkpackageignore           |  1 -
 Config.in.legacy              |  7 ++++++
 DEVELOPERS                    |  1 -
 package/Config.in             |  1 -
 package/pigpio/Config.in      | 14 ------------
 package/pigpio/S50pigpio      | 50 ------------------------------------------
 package/pigpio/pigpio.hash    |  3 ---
 package/pigpio/pigpio.mk      | 51 -------------------------------------------
 package/pigpio/pigpio.service | 10 ---------
 9 files changed, 7 insertions(+), 131 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 34f4d5bdcd..5d4cccd76e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -744,7 +744,6 @@ package/php/0004-Call-apxs-with-correct-prefix.patch lib_patch.Upstream
 package/pifmrds/0001-Makefile-cross-compile-friendly.patch lib_patch.Upstream
 package/pifmrds/0002-Makefile-use-LDFLAGS.patch lib_patch.Upstream
 package/pifmrds/0003-Makefile-fix-static-link.patch lib_patch.Upstream
-package/pigpio/S50pigpio Shellcheck lib_sysv.Variables
 package/pkgconf/0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch lib_patch.Upstream
 package/pkgconf/pkg-config.in Shellcheck
 package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 7296a11a17..11ace58153 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_PIGPIO
+	bool "pigpio removed"
+	select BR2_LEGACY
+	help
+	  pigpio was no longer maintained upstream, so it has been
+	  dropped.
+
 config BR2_PACKAGE_XML_SECURITY_C
 	bool "xml-security-c removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f5fa8b89c1..94d612bbde 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1357,7 +1357,6 @@ F:	fs/f2fs/
 F:	package/bluez5_utils-headers/
 F:	package/f2fs-tools/
 F:	package/graphicsmagick/
-F:	package/pigpio/
 F:	package/python-aioblescan/
 F:	package/python-bluezero/
 F:	package/python-crontab/
diff --git a/package/Config.in b/package/Config.in
index 23a76bd9b0..f32fcd8723 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -573,7 +573,6 @@ endmenu
 	source "package/picocom/Config.in"
 	source "package/picotool/Config.in"
 	source "package/pifmrds/Config.in"
-	source "package/pigpio/Config.in"
 	source "package/powertop/Config.in"
 	source "package/pps-tools/Config.in"
 	source "package/pru-software-support/Config.in"
diff --git a/package/pigpio/Config.in b/package/pigpio/Config.in
deleted file mode 100644
index 2180ab0de6..0000000000
--- a/package/pigpio/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_PIGPIO
-	bool "pigpio"
-	depends on BR2_aarch64 || BR2_arm
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	help
-	  Pigpio is a library for the Raspberry Pi which allows
-	  control of the General Purpose Input Outputs (GPIO).
-
-	  http://abyz.me.uk/rpi/pigpio/
-
-comment "pigpio needs a toolchain w/ threads, dynamic library"
-	depends on BR2_aarch64 || BR2_arm
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/pigpio/S50pigpio b/package/pigpio/S50pigpio
deleted file mode 100644
index 8b7b6815c8..0000000000
--- a/package/pigpio/S50pigpio
+++ /dev/null
@@ -1,50 +0,0 @@
-#!/bin/sh
-
-DAEMON="pigpiod"
-PIDFILE="/var/run/pigpio.pid"
-
-PIGPIOD_ARGS=""
-
-[ -r "/etc/default/pigpio" ] && . "/etc/default/pigpio"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" -- $PIGPIOD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/pigpio/pigpio.hash b/package/pigpio/pigpio.hash
deleted file mode 100644
index fecb7ccbeb..0000000000
--- a/package/pigpio/pigpio.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  c5337c0b7ae888caf0262a6f476af0e2ab67065f7650148a0b21900b8d1eaed7  pigpio-79.tar.gz
-sha256  6a90b88421a0d9b090e121daa11b3c6d55eed5eeb3281a2fcc454d6a28b5547c  UNLICENCE
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
deleted file mode 100644
index e34974972a..0000000000
--- a/package/pigpio/pigpio.mk
+++ /dev/null
@@ -1,51 +0,0 @@
-################################################################################
-#
-# pigpio
-#
-################################################################################
-
-PIGPIO_VERSION = 79
-PIGPIO_SITE = $(call github,joan2937,pigpio,v$(PIGPIO_VERSION))
-PIGPIO_LICENSE = Unlicense
-PIGPIO_LICENSE_FILES = UNLICENCE
-PIGPIO_INSTALL_STAGING = YES
-
-define PIGPIO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define PIGPIO_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/pig2vcd $(TARGET_DIR)/usr/bin/pig2vcd
-	$(INSTALL) -D -m 0755 $(@D)/pigpiod $(TARGET_DIR)/usr/bin/pigpiod
-	$(INSTALL) -D -m 0755 $(@D)/pigs $(TARGET_DIR)/usr/bin/pigs
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so.1
-	ln -sf libpigpio.so.1 $(TARGET_DIR)/usr/lib/libpigpio.so
-	ln -sf libpigpiod_if.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if.so
-	ln -sf libpigpiod_if2.so.1 $(TARGET_DIR)/usr/lib/libpigpiod_if2.so
-endef
-
-define PIGPIO_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so.1
-	$(INSTALL) -D -m 0755 $(@D)/libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so.1
-	$(INSTALL) -D -m 0644 $(@D)/pigpio.h $(STAGING_DIR)/usr/include/pigpio.h
-	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if.h $(STAGING_DIR)/usr/include/pigpiod_if.h
-	$(INSTALL) -D -m 0644 $(@D)/pigpiod_if2.h $(STAGING_DIR)/usr/include/pigpiod_if2.h
-	ln -sf libpigpio.so.1 $(STAGING_DIR)/usr/lib/libpigpio.so
-	ln -sf libpigpiod_if.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if.so
-	ln -sf libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
-endef
-
-define PIGPIO_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 755 package/pigpio/S50pigpio \
-		$(TARGET_DIR)/etc/init.d/S50pigpio
-endef
-
-define PIGPIO_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 644 package/pigpio/pigpio.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/pigpio.service
-endef
-
-$(eval $(generic-package))
diff --git a/package/pigpio/pigpio.service b/package/pigpio/pigpio.service
deleted file mode 100644
index 135624cc43..0000000000
--- a/package/pigpio/pigpio.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Pigpio daemon
-After=network.target
-
-[Service]
-EnvironmentFile=-/etc/default/pigpio
-ExecStart=/usr/bin/pigpiod -g $PIGPIOD_ARGS
-
-[Install]
-WantedBy=multi-user.target
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
