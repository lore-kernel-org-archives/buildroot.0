Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDB7CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 08:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B164098F;
	Mon, 18 Sep 2023 08:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B164098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ToTFTinf6smY; Mon, 18 Sep 2023 08:16:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5E6D41511;
	Mon, 18 Sep 2023 08:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5E6D41511
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 96BA81BF5A8
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7027A81BC0
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 08:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7027A81BC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CVsWcA5jRDw2 for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 08:16:04 +0000 (UTC)
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5892F81BBD
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 08:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5892F81BBD
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba Outgoing Smtp  with ESMTPSA
 id i9QGqTYkmLFWgi9QGqDzUH; Mon, 18 Sep 2023 10:16:01 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 10:15:59 +0200
Message-Id: <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
References: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMT9T3FB4e60GD23E0Tm+twlBEk10j42FnqxdsbOwQCwRLNksLzcVcke3qXhs3rJ8qTDiPbBg0qfrEjN4vsauOYjAK9cKtucCapkT43E2RTsyFUCMPks
 YN1k3GA1o7HSAJClINfK/ghwsKSjVewTzAIfqRkLqqHKDgeenFBX5fkPSahS1qjZrh8Uq+lLlFxXSeZgiN15bBt8ZffLV6XsXol36hCE2S7dA0IxvwwjKpIM
 u7i3AUVmR3MYIV4GX7/jdUsB4lTzT2vk5JK+48BMpWKtNbpIbTKJId/mm0OG49WaLeOEW9/h7XOxSKZvnu/zPQzrZJcvXwqghD/UnryuPTD7/TpTDroqndnJ
 EnLHWw1S1bQjMNHqjAVbechXZC4oc2Vzw/LadTDWxys6E94wBg9GjA+v9eqX/51v3Wbvi03Fzk/o/aXlrqyyFz/I/sDVmPynFbPQyVIIO3S8SZxvjsEnZ26P
 /tyLN3HB6zs9iu3g
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695024961; bh=zdW6DqD200TXb1M8sMy3TVfS3lvwZ965BkyV2EfacIQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=lQC8Tf3HoXYO4TcoSZP4Uvs5pI2T+Lsh9JE+G0ySC7VUf7NUS3IemZLsrBKtGqs52
 Neci+ZI6Mhgq18ZL722J0+pfZSc9EnbHCSmd1QvGklvMjuV2EPA1qyWOU50QYbX/a/
 q5JJx4IQ/LJJgC0qvu2l3qEwZL/cuBwYNJLzLd/sENd9/1yF26+JCxN31gCWcAtfy+
 rslLTw2bl4qi4iJLJqN1Y9NyPrt7/fZbjF3j/MLenTgpZzJLx8YZjW7twzXggBQfB5
 STRsuYfU8TY8gAfl9DKspPX0oTmv4F6j8iZdWdYw6VoftZ01JTY6Xj3/zTWNBwuIre
 r/QN8B+jVxGIw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=lQC8Tf3H
Subject: [Buildroot] [PATCH v2] package/apache: add option
 BR2_PACKAGE_APACHE_UTILS_ONLY
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

With option BR2_PACKAGE_APACHE_UTILS_ONLY only htdigest and htpasswd are
built and installed. This is useful for Mongoose credential handling.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
V1->V2:
* Hide "External Apache modules" if BR2_PACKAGE_APACHE_UTILS_ONLY is enabled
---
 package/Config.in        |  2 +-
 package/apache/Config.in |  7 +++++++
 package/apache/apache.mk | 23 +++++++++++++++++++++--
 3 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index e8dbadadf3..6f4898e15a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2278,7 +2278,7 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
-if BR2_PACKAGE_APACHE
+if BR2_PACKAGE_APACHE && !BR2_PACKAGE_APACHE_UTILS_ONLY
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
 endmenu
diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..aad35fb5da 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,6 +17,12 @@ config BR2_PACKAGE_APACHE
 
 if BR2_PACKAGE_APACHE
 
+config BR2_PACKAGE_APACHE_UTILS_ONLY
+	bool "apache-utils-only"
+	help
+	  Provide only Apache utils like htdigest and htpasswd.
+
+if !BR2_PACKAGE_APACHE_UTILS_ONLY
 choice
 	prompt "Multi-Processing Module (MPM)"
 	default BR2_PACKAGE_APACHE_MPM_WORKER
@@ -40,6 +46,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 	  Implements a hybrid multi-threaded multi-process web server
 
 endchoice
+endif
 
 endif
 
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..49edab838a 100644
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
@@ -31,6 +29,26 @@ else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
 APACHE_MPM = worker
 endif
 
+ifeq ($(BR2_PACKAGE_APACHE_UTILS_ONLY),y)
+APACHE_CONF_OPTS = \
+	--with-apr=$(STAGING_DIR)/usr \
+	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+	--with-static-htdigest \
+	--with-static-htpasswd
+
+define APACHE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+else
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+
 APACHE_CONF_OPTS = \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
@@ -121,5 +139,6 @@ define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
 endef
+endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
