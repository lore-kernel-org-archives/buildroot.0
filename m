Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2065107BCE4
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D8E960DE5;
	Fri, 13 Mar 2026 20:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ii-m2AyL3uqD; Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADC6160DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434192;
	bh=NIbfTQOEIdaECnT5whAZND/DB9Bay/45F2PtBQhcGEU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FK/s6kytMvRTuwJNAMJcw62Io1iOVUmisE6HRtmcrfmoCZuZiyiNrsexDKpL6z+K8
	 94w/R1YkK+/Tuk1iKM4bxP3gZL++sNZ5E/lXROmwhVdwOErRg97p7Vogwm2KgFf+BX
	 wVXxF/mBYFEfhaq48vbaoztlb8iITUGT5PN3Sxs9OlgSNVB2XUKHKRL+Tts3bSOOua
	 x2ic5GFlk6OWQUkyRCrrvFxDbOOl0rQ9gbU81q5yirNa6Bvkk6ni1pv5takCfdj9Eq
	 RJBhP1dTjqjdcWy+fd/4f0JbL8wzuxXw9Y3pAknQozKBzo3cTD5HwktkkyMaoHKrb/
	 YBwFiVzEfRilg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADC6160DE6;
	Fri, 13 Mar 2026 20:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2200201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4000405F1
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0OqEfru5VTd for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20DA5405D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20DA5405D7
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4867C86F38; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:22:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41dec067fefe590b535af93767c907352025e6e9
X-Git-Newrev: 53a885e48c1ad4a1f4b76e70f7d182161873d2df
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.4867C86F38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option to build
 broker-related apps
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/53a885e48c1ad4a1f4b76e70f7d182161873d2df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

mosquitto_{ctrl,db_dump,passwd,signal} can be handy to interact with
the mosquitto broker during development, but are usually unnecessary
on the target.

Add an option to enable or disable them. Make that new option enabled
by default when the broker is enabled, to keep backward compatibility
with previous (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 16 ++++++++++++++++
 package/mosquitto/mosquitto.mk | 12 ++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 417745873b..754c07be78 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -33,6 +33,22 @@ config BR2_PACKAGE_MOSQUITTO_CLIENTS
 	    mosquitto_sub
 	    mosquitto_rr
 
+config BR2_PACKAGE_MOSQUITTO_APPS
+	bool "install apps"
+	default y if BR2_PACKAGE_MOSQUITTO_BROKER  # Backward compatibility
+	depends on BR2_USE_WCHAR  # libedit
+	# For mosquitto_ctrl shell feature, mandatorily enabled:
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
+	help
+	  Those apps can be used to interact with the broker:
+	    mosquitto_db_dump
+	    mosquitto_signal
+
+	  Additionally, when openssl is enabled, the following apps are
+	  also installed:
+	    mosquitto_ctrl
+	    mosquitto_passwd
+
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index 62934966ca..a1848f96b3 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -19,8 +19,7 @@ MOSQUITTO_CONF_OPTS = \
 	-DWITH_TESTS=OFF \
 	-DWITH_STATIC_LIBRARIES=OFF \
 	-DWITH_BUNDLED_DEPS=ON \
-	-DWITH_HTTP_API=OFF \
-	-DWITH_CTRL_SHELL=OFF
+	-DWITH_HTTP_API=OFF
 
 # adns uses getaddrinfo_a
 ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
@@ -75,12 +74,18 @@ else
 MOSQUITTO_CONF_OPTS += -DWITH_CLIENTS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_MOSQUITTO_APPS),y)
+MOSQUITTO_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBEDIT),libedit,readline)
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=ON -DWITH_CTRL_SHELL=ON
+else
+MOSQUITTO_CONF_OPTS += -DWITH_APPS=OFF -DWITH_CTRL_SHELL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_MOSQUITTO_BROKER),y)
 
 MOSQUITTO_CONF_OPTS += \
 	-DCMAKE_INSTALL_SYSCONFDIR=/etc \
 	-DWITH_BROKER=ON \
-	-DWITH_APPS=ON \
 	-DWITH_PLUGINS=ON \
 	-DWITH_PLUGIN_ACL_FILE=ON \
 	-DWITH_PLUGIN_PASSWORD_FILE=ON \
@@ -125,7 +130,6 @@ MOSQUITTO_POST_INSTALL_TARGET_HOOKS += MOSQUITTO_INSTALL_TARGET_CONF
 else # !BR2_PACKAGE_MOSQUITTO_BROKER
 MOSQUITTO_CONF_OPTS += \
 	-DWITH_BROKER=OFF \
-	-DWITH_APPS=OFF \
 	-DWITH_PLUGINS=OFF
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
