Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77EF107BCE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C69740E3A;
	Fri, 13 Mar 2026 20:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDqfj2LxGqzS; Fri, 13 Mar 2026 20:36:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 888D940E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434202;
	bh=W5SuxWqXcGoCy4NZEmzMu2MVTiRmba363bwC2DtNvi0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M4MxBazG0k9VghDk8qwdCM9UoledSqn1Lm5ZvF2DAjrZiA6lqdogssrXgiqyrZUk9
	 1frCgEHIhTyqt4jOjXWaeR2ohV3LU8bznrL2ObxV/pSMW6LxoV6iwXhPjvivRtKuDo
	 x9fhHppqXIVtjuWuMYZTX+en+iKCPWgkGIw4vKqMkvEvfEDccEs2fiASrDO9Ank4Us
	 HMaWKOOHTUfBRowhQjsZ9zmdMV05+hllJ7/v9KIzTB7ZFXj1i+2q34TNgyolHFGYnV
	 02OjOh9oiTyFaAWfkZQQbnNIsNXNXMtZHeu47e0RIZJcnb8/Z0P8/+91YPT6j5ozmr
	 hmMlwWfVeAw6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 888D940E67;
	Fri, 13 Mar 2026 20:36:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D66201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F24C405E6
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1OU5PZyz6aSQ for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 586DF405DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 586DF405DC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DC1186F30; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:26:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 344db9a16c691324eb5114c9143e777b21ca4a6b
X-Git-Newrev: 9e11bbbcd1958df45e308078cd620ebffff52eea
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.8DC1186F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to enable
 bridge support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e11bbbcd1958df45e308078cd620ebffff52eea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 6 ++++++
 package/mosquitto/mosquitto.mk | 3 ++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index c221a2a648..aa678714b0 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -88,6 +88,12 @@ config BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API
 	  Add support for simple webserver as a listener to serve
 	  some of the HTTP API.
 
+config BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE
+	bool "bridge support"
+	default y  # legacy
+	help
+	  Include bridge support for connecting to other brokers
+
 config BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD
 	bool "static password file plugin"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a0ec136238..89dab87a53 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -92,7 +92,8 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_PLUGIN_SPARKPLUG_AWARE=OFF \
 	-DWITH_PLUGIN_PASSWORD_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_PASSWD),ON,OFF) \
 	-DWITH_PLUGIN_ACL_FILE=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_PLUGIN_STATIC_ACL),ON,OFF) \
-	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF)
+	-DWITH_PLUGIN_DYNAMIC_SECURITY=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_DYNAMIC_SECURITY_PLUGIN),ON,OFF) \
+	-DINC_BRIDGE_SUPPORT=$(if $(BR2_PACKAGE_MOSQUITTO_BROKER_BRIDGE),ON,OFF)
 
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER_HTTP_API),y)
 MOSQUITTO_DEPENDENCIES += libmicrohttpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
