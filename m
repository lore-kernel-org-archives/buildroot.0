Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC811E748EE
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 404108169B;
	Sun,  1 Oct 2023 16:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404108169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhzJZr17IEEo; Sun,  1 Oct 2023 16:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34DFB81362;
	Sun,  1 Oct 2023 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DFB81362
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95B021BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F69B40133
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F69B40133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEF7lK6zTUbz for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 16:36:34 +0000 (UTC)
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A151400CB
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 16:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A151400CB
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mzQjqqyhyx6WlmzQkqB2GX; Sun, 01 Oct 2023 18:36:30 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  1 Oct 2023 18:36:29 +0200
Message-Id: <20231001163629.2635480-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEg94pkC6PMW2Kh6AXf6NWJJ233zRkLAPI5cLAVr/ueAg8aFmPCeCrtusA8v2eAoW82OqPQ/Mk0/eGcA/SvUmzVdoxEvE95uom5+5UnEYgvLNoOuy7yV
 qEyiRiQ2NdUq+b/SJjPqGpCqwosZwXMa1ax2jU8D63cNukv+iULk5ll3RCXt5SAUidBR/r8dboMwyivNwJ6DKdmfZQ4h7J/JSbivMofN/0QqF5uhjkWjZMLL
 cKK8ghNdzVGnvQ7YSjlZsSR1N5FVrMXxwi/3VWik37S2eBODwsOyASU/JZOz3empXepC5Xyo1R5/PpGiXHZZQuTruAIyF+yZMne6IwBu98BA6pNEUcllSgjo
 lOA8VL8TKNfS28u3J2m24JeJ4T3JTOL9KH+ym4Se4rNFVxwtzqDyaCMd72PMC8wWS5cEQGRPVTUxV5apA6UlNGl8kIip4jRQUPAzTFJltCfVL7VVyy76QK2l
 EL44H3SNLwUvCccR8Qs5aX+rYq96x0bvfNw/ulnY+uOU4IBuFTUZ1igaflYG9hwRk1SJKFiXVUoFoS0gI/UB5gYbVaVg4VnbzHHXiFRJlWgBr3ghycMFn4E3
 ig4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696178190; bh=TPYicNdvyVWU3d948pBC8nWnJdJcbxBXSQbtKSL1nDU=;
 h=From:To:Subject:Date:MIME-Version;
 b=UwaVXz/GAg6UIjATZQAbT8cFpQuaX82szsIYgEoSzOWMuGMiDgCjxBiisHPN9c9JE
 QD+Unuo6yGiyQiJtL1whsRXlQGmtb4pC/b6gOX2sscmxk2/M+gC1NNqvx0k6JfATvO
 W9Lm37nx4c1Fv1tbJJuV3IIdg0yZbSuawI/DYVs4CP3b0+hPkSyjDBT2nZdcLFA/9j
 5XkThI/qFey+I8IpgvvbYAJuf/1lof3+LcJVRT4l8+YJPqNs8tyIVdKXXPDd80PM/0
 t5VIQlF5nyfR7wkKviez0mPeOC2Q4cadLOod0qMJtBiZuoROZZzzpMkmpx77SaC/yv
 O1kMI80xg4pmQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UwaVXz/G
Subject: [Buildroot] [PATCH v6] package/apache: add option to disable server
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, James Autry <jautry@tekvox.com>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Matthew Maron <matthewm@tekvox.com>, Romain Naour <romain.naour@smile.fr>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

Other packages (e.g. mongoose) can use htdigest and htpasswd, but those
are only available with apache.

We don't want to build the whole apache server just for those tools, so
we add an option to disable the server; it is enabled by default for
legacy purposes (so that existing (def)configs still work).

However, there is no way to tell the apache buildsystem to only build
those two tools, so we have to provide custom build and install
commands.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
V1->V2:
* Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
V2->V3:
as suggested by Arnout:
* change negative option BR2_PACKAGE_APACHE_UTILS_ONLY to BR2_PACKAGE_APACHE_DAEMON
* set a common APACHE_CONF_OPTS and only add specific options for
  BR2_PACKAGE_APACHE_DAEMON enabled or not
V3->V4:
* drop --with-static-* options as suggested by Arnout
V4->V5:
as suggested by Yann:
* drop BR2_PACKAGE_APACHE check in package/Config.in for
  package/modsecurity2/Config.in
* make BR2_PACKAGE_PHP_SAPI_APACHE depends on BR2_PACKAGE_APACHE_DAEMON
* improve commit log
V5->V6:
as suggested by Romain:
* update apparmor BR2_PACKAGE_APACHE to BR2_PACKAGE_APACHE_DAEMON
---
 package/Config.in              |  2 --
 package/apache/Config.in       |  9 +++++++++
 package/apache/apache.mk       | 20 +++++++++++++++++---
 package/apparmor/apparmor.mk   |  2 +-
 package/modsecurity2/Config.in |  2 +-
 package/php/Config.in          |  2 +-
 6 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 90cfe25d05..a037fd50de 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2289,11 +2289,9 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
-if BR2_PACKAGE_APACHE
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
 endmenu
-endif
 	source "package/argus/Config.in"
 	source "package/arp-scan/Config.in"
 	source "package/arptables/Config.in"
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..5e9e4c5f9d 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,6 +17,14 @@ config BR2_PACKAGE_APACHE
 
 if BR2_PACKAGE_APACHE
 
+config BR2_PACKAGE_APACHE_DAEMON
+	bool "apache-daemon"
+	default y
+	help
+	  Provide entire Apache daemon, otherwise only htdigest and htpasswd
+	  will be built and installed.
+
+if BR2_PACKAGE_APACHE_DAEMON
 choice
 	prompt "Multi-Processing Module (MPM)"
 	default BR2_PACKAGE_APACHE_MPM_WORKER
@@ -40,6 +48,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 	  Implements a hybrid multi-threaded multi-process web server
 
 endchoice
+endif
 
 endif
 
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..994842b455 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
 APACHE_SELINUX_MODULES = apache
-# Needed for mod_php
-APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
@@ -32,10 +30,16 @@ APACHE_MPM = worker
 endif
 
 APACHE_CONF_OPTS = \
-	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
 	--with-apr-util=$(STAGING_DIR)/usr \
 	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+
+ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+
+APACHE_CONF_OPTS += \
+	--sysconfdir=/etc/apache2 \
 	--enable-http \
 	--enable-dbd \
 	--enable-proxy \
@@ -121,5 +125,15 @@ define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
 endef
+else
+define APACHE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+endif
 
 $(eval $(autotools-package))
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index eeedd805e6..f3ac27c5ed 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -50,7 +50,7 @@ APPARMOR_DEPENDENCIES += linux-pam
 APPARMOR_TOOLS += changehat/pam_apparmor
 endif
 
-ifeq ($(BR2_PACKAGE_APACHE),y)
+ifeq ($(BR2_PACKAGE_APACHE_DAEMON),y)
 APPARMOR_DEPENDENCIES += apache
 APPARMOR_TOOLS += changehat/mod_apparmor
 APPARMOR_MAKE_OPTS += APXS=$(STAGING_DIR)/usr/bin/apxs
diff --git a/package/modsecurity2/Config.in b/package/modsecurity2/Config.in
index fb1bfc960e..40c5fc55bc 100644
--- a/package/modsecurity2/Config.in
+++ b/package/modsecurity2/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MODSECURITY2
 	bool "modsecurity2"
-	depends on BR2_PACKAGE_APACHE
+	depends on BR2_PACKAGE_APACHE_DAEMON
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PCRE2
 	help
diff --git a/package/php/Config.in b/package/php/Config.in
index 69b4268c1d..3a9e37dab6 100644
--- a/package/php/Config.in
+++ b/package/php/Config.in
@@ -36,7 +36,7 @@ if BR2_PACKAGE_PHP
 
 config BR2_PACKAGE_PHP_SAPI_APACHE
 	bool "Apache interface"
-	depends on BR2_PACKAGE_APACHE
+	depends on BR2_PACKAGE_APACHE_DAEMON
 	help
 	  Apache module
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
