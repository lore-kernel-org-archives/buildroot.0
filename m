Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5F107BCE7
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9BC640D52;
	Fri, 13 Mar 2026 20:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ILVuDetFcnGB; Fri, 13 Mar 2026 20:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49F540DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434193;
	bh=EIWYajSwX5CaT82FmS4VJiyqe+Bjvaoq67VObVCmbKU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tAOYlgBawBpJNkXht+WrOMX5T+rKx0E9JSisqyl5kMkJGY7q3JzptGmsyW7Lniyvk
	 sxLAwaZbMRAMUtnespPCv1/qC7M82qMbVdq+XeLzwfAMoqrQ33WHCXbrWnTFmbETwS
	 CxwNy3UprrIwRX8+mSntDLRG1nIeDhRPtPeC+6BZcMcJRoxocJSyixufQXSwM6eiIp
	 K8BP+vDTNXqNvAAHDYavgVrali8eDwtxXq5N9MgsmPUm6+q1SXTIkrv5YZBnhePcrN
	 iUX3EGLEvBrjeb/aqraotGxIe56mv0MBV0c8exhWq8queZCjWC6XzlPbTNvvqQ+X0/
	 JrWdHeyCJHLRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49F540DF3;
	Fri, 13 Mar 2026 20:36:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B7EB201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A8B60DE4
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mTtC0AK1-6-p for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F23360DE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F23360DE5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6457786EF1; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:25:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5ed4f52235293b9b6bc26d435e5484e461cbb6d
X-Git-Newrev: 989214ae3dddb85721e6fbaf255fab71b9d5c12b
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.6457786EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to enable
 HTTP API on listeners
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/989214ae3dddb85721e6fbaf255fab71b9d5c12b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The mosquitto broker (not the library) can have listeners configured to
serve HTTP requests; it can optionally accept (some) HTTP API requests
on such listeners.

Add a new option to enable the availability of http_pi.

Note that we do not just depend on libmicrohttpd to be enabled, because
the HTTP API is a security boundary, and enabling it must be an explicit
decision.

Co-developped-by: Titouan Christophe <titouan.christophe@mind.be>
[yann.morin@orange.com: make it an explicit option]
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 11 ++++++++++-
 package/mosquitto/mosquitto.mk | 10 ++++++++--
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 789e30f97f..87ecdc1076 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -79,15 +79,24 @@ config BR2_PACKAGE_MOSQUITTO_BROKER
 	help
 	  Build and install the mosquitto broker onto target.
 
+if BR2_PACKAGE_MOSQUITTO_BROKER
+
+config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
+	bool "http_api"
+	select BR2_PACKAGE_LIBMICROHTTPD
+	help
+	  Add support for simple webserver as a listener to serve
+	  some of the HTTP API.
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN
 	bool "dynamic security plugin"
-	depends on BR2_PACKAGE_MOSQUITTO_BROKER
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Build and install the dynamic security plugin for
 	  mosquitto broker onto target.
 
 endif
+endif
 
 comment "mosquitto needs a toolchain w/ dynamic library"
 	depends on BR2_USE_MMU
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 9b3bcc1cf5..160945d6d9 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -18,8 +18,7 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_DOCS=OFF \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
-	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_HTTP_API=OFF
+	-DWITH_BUNDLED_DEPS=ON
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -95,6 +94,13 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_PERSIST_SQLITE=OFF \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
+MOSQUITTO_DEPENDENCIES += libmicrohttpd
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_HTTP_API=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),y)
 MOSQUITTO_CONF_OPTS += -DWITH_PLUGIN_DYNAMIC_SECURITY=ON
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
