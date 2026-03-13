Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EA8107BCE7
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA08640D87;
	Fri, 13 Mar 2026 20:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYSJ6xnu2B_S; Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C332F40D9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434198;
	bh=WPIZfWqzeAPqhvnkkChGHBIF2JWn8XKp8wZzt/pTR3I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PQo4WL4P9FYOlwKRMNQs/adv4mkWfPGy8YZk7RnVw2sic11lWXIhzIikd5LFaPu9W
	 Tt8gj7vE2vLxeBWGjLRR1GZlJhYlNT5+HK6h+1FH0IN+WpbYp2UMsS2Q1sobcCDJSa
	 u9Uz98NQGRji3wxfSs8VfzwyfwOY4dZia/Y0SjpHIxKPEKJuJuZDYv5tt4KNw7Az+i
	 cW5Sd0LKJ95b4r7jXFJpCQkfIK1pu79Tip2iRT/EmA/cy2NHY0IMCBMQ5Vv2wJe+sS
	 hSojDdWJVpKQM0NnwhdjgvMUTMQ5miaWEHEURfgJqXHYbKUyCKj7X/cgkJSu1DhgTz
	 LyH7zvbLcT0zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C332F40D9E;
	Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3D7C201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 017E460DE5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OFKtUpCxNxLD for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4872060DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4872060DE6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D67D86EF1; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:26:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccc048c78f96c431de11846f7c2224e27871fb68
X-Git-Newrev: 344db9a16c691324eb5114c9143e777b21ca4a6b
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.7D67D86EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to enable
 the persist-sqlite plugin
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/344db9a16c691324eb5114c9143e777b21ca4a6b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

That plugin can be used instead of the builtin support to persist the
mosquitto state across restarts.

Note that this plugin has a dependency, so we don't use the $(if)
one-liner.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 7 +++++++
 package/mosquitto/mosquitto.mk | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 0c99b771d7..c221a2a648 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -109,6 +109,13 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE
+	bool "persist-sqlite plugin"
+	select BR2_PACKAGE_SQLITE
+	help
+	  Add the persist-sqlite plugin, to persist the broker
+	  state across restarts.
+
 endif
 endif
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index d95583d768..a0ec136238 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -89,7 +89,6 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_EXAMPLES=OFF \
-	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
@@ -102,6 +101,13 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_PERSIST_SQLITE),y)
+MOSQUITTO_DEPENDENCIES += sqlite
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_PERSIST_SQLITE=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 MOSQUITTO_DEPENDENCIES += systemd
 MOSQUITTO_CONF_OPTS += -DWITH_SYSTEMD=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
