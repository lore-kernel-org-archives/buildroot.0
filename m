Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E707E7D0AA
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE80417A5;
	Thu, 21 Sep 2023 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE80417A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iz_M3psTn7pC; Thu, 21 Sep 2023 20:32:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C30734211F;
	Thu, 21 Sep 2023 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C30734211F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37D481BF2B8
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:32:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 116634211F
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 20:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 116634211F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TtStUjRNB6Ja for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 20:32:43 +0000 (UTC)
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1D2417A5
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 20:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1D2417A5
Received: from localhost.localdomain ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jQLnqaBBahgyOjQLnqnHhF; Thu, 21 Sep 2023 22:32:39 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 22:32:37 +0200
Message-Id: <20230921203237.1249291-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDhOwxtyLAfWjroXtWf2hVFiwZSkKWTW7oWzFn3zUVzRUreH6A0BiGXhW+FZqCApW3JhD8jJQdSHb3LeudgBBJOPrzJnT2LK/wCdSRmwYvGqz9UaYuQS
 G086OfMjf8KJUb+Q/0DJZCJEIxYkzBlEnW4TgfEM4sKzkYyAl/b1s+9fcgiMRcsFbPkzd8+sEYHPZjZlgNDsp5zQt4ISBCVCRcYp71edWxKKjdqCRUDDzNHz
 YKvEIIIwTpEpDTBqQDeDZmzXo/jLbUwMzCaJWYWHzIGV+ZxJhpo8OSN/f61jApaX3UWuLAMkPKoyfBE9e2KLhAEo5BBbb1kfa8cAVsWaKu2SC0ali2c5Izcw
 S14olblLw4ZiwMUzwZWRzB2f/yUMnt+bwswRQbHx3wRj+W8Q7MqjvPhvLO1+IqZJBxxdfwTK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695328359; bh=LYz1VH9J3QDUYPLmXosRC7K0JO0XKT4JMpUKCdTuhlU=;
 h=From:To:Subject:Date:MIME-Version;
 b=GbPyQs/hAOqJ0hMJ33pSucQqysVLkwWcSnb64BkEoAzdchJ3MEP3K26daEv0TCzyc
 q/qJKIt57FgyFcLTaM061akl4m7FxlV4XKx3dGTFXoPAzpep1sDsen1I1aUQafJdy0
 KC3cVlb40LZfMlxry8m05d6ppVvb+Q7GM4XU5iR0ZHtpCrKsgjY4mUrJZdKMfUxWWm
 Fj6R+GRVvE2n6ir8OOkvw1fJ/OfPiO5jgOwvCsEy1Tgksdr6zk8vHEPgdxSzMF94jm
 e7W5Mt+TZSJpbc/LuP7yLPUEOA9WCk6P8Zpxu+Jg6HWTepLfwJjCXJ5z0nMBZADnAI
 E04ihAlBB5dmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=GbPyQs/h
Subject: [Buildroot] [PATCH v4] package/apache: add option
 BR2_PACKAGE_APACHE_DAEMON
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
 Jim Reinhart <jimr@tekvox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

With option BR2_PACKAGE_APACHE_DAEMON disabled only htdigest and htpasswd
are built and installed. By default BR2_PACKAGE_APACHE_DAEMON is enabled
and entire apache daemon is built. This is useful for Mongoose credentials
handling.

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
---
 package/Config.in        |  2 +-
 package/apache/Config.in |  9 +++++++++
 package/apache/apache.mk | 20 +++++++++++++++++---
 3 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index cc99be39fb..cd7fe056b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2279,7 +2279,7 @@ menu "Networking applications"
 	source "package/alfred/Config.in"
 	source "package/aoetools/Config.in"
 	source "package/apache/Config.in"
-if BR2_PACKAGE_APACHE
+if BR2_PACKAGE_APACHE_DAEMON
 menu "External Apache modules"
 	source "package/modsecurity2/Config.in"
 endmenu
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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
