Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786A3107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295A140D54;
	Fri, 13 Mar 2026 20:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgAHHPukgBDK; Fri, 13 Mar 2026 20:36:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D862040DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434194;
	bh=IQ2IWQ+iBQWWAaV6WI5PT3u+Cxqc+/u3Rvz4UxuNvcc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R40QVgpWKku9zNJouA/4BSpqouyVS3ScHl/B5mYbHK10b7iuFwV19lUNm6flhO+u8
	 Hd0DAvaRvIXTKSN571+6vttm4fT3wfKMQO721iqLwSaIQFuTSrgmHvnQyTg3/jBVMt
	 nRu7l0wMbvKP5XkwJhsqUAAT+R7zlhcVYIg0oHql5Y98lVwEOANWVej5pu/pKsBN0z
	 /OhoJ7NAl260OijM/cHS0ZYjdTtFs0HCB+PCmjkjYuGXjcXwQT33Yp5l32EDW3RKzs
	 oikeYtnoxjiFnFo6kRvWnkGkqtQHhy9pAxCSGiIHOEF2Sw4K7YXusTApBKvTLww4I2
	 lmD6kr4BLRtlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D862040DEB;
	Fri, 13 Mar 2026 20:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C605201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1EA7E405D7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ycSO-z0e-_Hx for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D9F6405D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D9F6405D8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 727F486F38; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:25:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 989214ae3dddb85721e6fbaf255fab71b9d5c12b
X-Git-Newrev: ccc048c78f96c431de11846f7c2224e27871fb68
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.727F486F38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add options for
 password and ACL plugin
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ccc048c78f96c431de11846f7c2224e27871fb68
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Until version 2.0.x, support for using static password or ACL files, was
builtin to the broker. With version 2.1.x, two new plugins have been
introduced to replace the builtin support, which is now deprecated and
will get removed in the next version.

Add two new configuration options for those plugins.

We decided to do a single commit, rather than one per option, because
they are relatively tied together (ACL needs passwords, at least).

We also choose to make those options enabled by default, because the
traditional way to configure mosquitto is to use static files for
authentication and authorization, and the builtin support if now
deprecated in favour for the plugins.

The usual ifeq-else-endif conditional block is a bit verbose when just
setting an option ON or OFF, when no additional dependency is needed.
Instead, use the not-unusual $(if)-inline one-liner. For consistency,
switch the existing dynamic-security plugin to use that one-liner too.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 14 ++++++++++++++
 package/mosquitto/mosquitto.mk | 13 ++++---------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 87ecdc1076..0c99b771d7 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -88,6 +88,20 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
 	  Add support for simple webserver as a listener to serve
 	  some of the HTTP API.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
+	bool "static password file plugin"
+	default y
+	help
+	  Add support for authentication based on static files. using
+	  a plugin rather than the legacy builtin support.
+
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL
+	bool "static ACL file plugin"
+	default y
+	help
+	  Add support for authorization (ACL) based on static files,
+	  using a plugin rather than the legacy builtin support.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	bool "dynamic security plugin"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 160945d6d9..d95583d768 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -88,11 +88,12 @@ MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
-	-DWITH_PLUGIN_ACL_FILE=ON \
-	-DWITH_PLUGIN_PASSWORD_FILE=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
 	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
-	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
+	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
+	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
+	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
+	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
@@ -101,12 +102,6 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
-MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=ON
-else
-MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=OFF
-endif
-
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MOSQUITTO_DEPENDENCIES += systemd
 MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
