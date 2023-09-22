Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96504CE7A86
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 21:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B99041995;
	Fri, 22 Sep 2023 21:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B99041995
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTjoSAuRpF32; Fri, 22 Sep 2023 21:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A47D405B5;
	Fri, 22 Sep 2023 21:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A47D405B5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF741BF476
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27BEC616BA
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 21:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27BEC616BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id alAHT_yeOSHq for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 21:18:21 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 783876169A
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 21:18:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 783876169A
Received: from localhost.localdomain ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jnXVq1sXZLVMJjnXVqeSEZ; Fri, 22 Sep 2023 23:18:18 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 22 Sep 2023 23:18:16 +0200
Message-Id: <20230922211816.13469-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLcbDAOBYhu67V7Tg1wo0w+0DhRtx4+A+z1YBf/4hQWnZgbK19T80NtqbDT3x+503C4wxUEaxAQm5g3xjPVM47UPCzURCMAesxxigC2nWSAj8gk/SWcK
 A3DwBI7Q8FeSARzgH/znCr9EZkejVV/vO/TtUyrWL7lENqYUYL+COD5bL+53dQ3I7bZ5qBO0jN0S9wPmZyBtOU87/L/Rd8yw1GZm7l8xOf6Opsz8097Xu5XC
 S7gk1YKpGBBw+1FrzYYLMik3DVQl0eEB3u+0FDn5MZz4ZssedVTUQP8u71mXw4Bsuq7zf1KcLe46E/21woT3wcraVpF8EMcNg9J7CwcBHDlAGR/JG6qzv2Xc
 d3k2HW4GJnKt9XvQVRYw0jKghOdGBxytKpv5pnEG63woASiY3i6efjgrrbdgJuvBUCM1dSoY0NdPuHEuf9eBlakOxaMyx6rt50CjG3FOVprLJa1l7rJaS5x5
 bQoaZKk/QtROPuYvEv1NHGpTY2xkDuRDyUhXFA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695417498; bh=7+/fzHd+m+5gDT75mXhIgVnMFVtq5BVi/4vYHp4VCcA=;
 h=From:To:Subject:Date:MIME-Version;
 b=QDE1VeUnG9cNEI82lL2FHtokVTLdKMbtLNoEFZk6tc9VUCJpHuF8dSV8GZhBmSyNh
 ujB9RHAcMo2bxmnoA9AmcZfqwvRldt+ld++fvO0RpYMQyZbDjyp2xp+xKAdNLTtZr6
 eWeKCFPzJgTSP0moYy6HOIT/chYffZMrLSc3Gn1+BHqIxX2QwIXbNE0nWRsYVxP8Wu
 0D/N/EiYMkSqTR3ziBWoL26Q28fSFTM8eOJscHvdL6cbqVkJMsbHvpRqjBKTdFD5aR
 nPFwBqCROxAodIVvJluQjYZoZ2Uqc47Jfxkrh4oiIedqmGPmFZK0+PtIqV4x6FwTXc
 pQ464ENN5cOMw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QDE1VeUn
Subject: [Buildroot] [PATCH v5] package/apache: add option to disable server
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
 Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
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
---
 package/Config.in              |  2 --
 package/apache/Config.in       |  9 +++++++++
 package/apache/apache.mk       | 20 +++++++++++++++++---
 package/modsecurity2/Config.in |  2 +-
 package/php/Config.in          |  2 +-
 5 files changed, 28 insertions(+), 7 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cc99be39fb..db6cf432e3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2279,11 +2279,9 @@ menu "Networking applications"
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
