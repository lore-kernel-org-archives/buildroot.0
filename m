Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F5A107BCE5
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 675AC60DFB;
	Fri, 13 Mar 2026 20:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEMEtxKL_Vt1; Fri, 13 Mar 2026 20:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7657560DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773434196;
	bh=Mon+9ZIrLT16IoBlYNx+tqNs6/rsnL0k79GYwtdvX3E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JWVxtXkV1yIfP/yJvylTvuusVTil7NqhNE88DR7rak251U2yYCWaQZtpasYlvHOOr
	 rgkq6nfXVbxjb3EsOsTVWCGys05JSB1uGkD1qvd0MpoqkKlDm+cSAVqOIY9ZZvdQLz
	 G2yj5J+RBvp/+qpYSM83bdk9VUmfP7sosftkSIiIBNV8O7hO9SgFa67PYP2tZlFw64
	 pTjmHIpo4ZYmXk8qdviv9DyoOCd5qA4OVoASv5thpGk6yFaaRmOkrSSLCUTC8jxFVl
	 TyebnLX9Wt0EGDPBQP0iptdszh7BSFpEZVAq/NyokAxm7qIEfi7sqTnhK8e0+7sFbF
	 maNc61qeNIVOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7657560DF4;
	Fri, 13 Mar 2026 20:36:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 968851AF
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 88837819FC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cH0L8TmuSmpU for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3050B819F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3050B819F5
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58AB586F30; Fri, 13 Mar 2026 20:36:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 21:22:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53a885e48c1ad4a1f4b76e70f7d182161873d2df
X-Git-Newrev: c5ed4f52235293b9b6bc26d435e5484e461cbb6d
X-Patchwork-Hint: ignore
Message-Id: <20260313203629.58AB586F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: add option for
 websockets
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5ed4f52235293b9b6bc26d435e5484e461cbb6d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Mosquitto 2.1.x adds the possibility to use a builtin websocket
implementation, as an alternative to using libwebsockets.

When using libwebsockets as the implementation, only the broker supports
websockets, and CLI tools do not; only when using the builtin one are
websockets usable with CLI tools (and the broker, of course).

Add a choice to select what type of websockets support to enable, if
any. Since the builtin implementation is still new, we keep the
libwebsockets one available.

Since this inverts the dependency logic to libwebsockets, we can't
provide a backward compatibility with existing (def)config files.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mosquitto/Config.in    | 25 ++++++++++++++++++++++++-
 package/mosquitto/mosquitto.mk |  4 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 754c07be78..789e30f97f 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -24,6 +24,30 @@ config BR2_PACKAGE_MOSQUITTO
 
 if BR2_PACKAGE_MOSQUITTO
 
+choice
+	prompt "Websockets support"
+	help
+	  Choose what websocket implementation to use. Note that
+	  the mosquitto_{sub,pub,rr} clients (above) only support
+	  websockets with the builtin implementation, while the
+	  broker supports websockets with either libwebsockets
+	  or the builtin implementation.
+
+config BR2_PACKAGE_MOSQUITTO_WS_NONE
+	bool "none"
+
+config BR2_PACKAGE_MOSQUITTO_WS_LIBWS
+	bool "with libwebsockets"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBWEBSOCKETS
+	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL
+
+config BR2_PACKAGE_MOSQUITTO_WS_BUILTIN
+	bool "with builtin implementation"
+	select BR2_PACKAGE_OPENSSL
+
+endchoice
+
 config BR2_PACKAGE_MOSQUITTO_CLIENTS
 	bool "install clients"
 	default y  # Backward compatibility
@@ -52,7 +76,6 @@ config BR2_PACKAGE_MOSQUITTO_APPS
 config BR2_PACKAGE_MOSQUITTO_BROKER
 	bool "install the mosquitto broker"
 	default y
-	select BR2_PACKAGE_LIBWEBSOCKETS_EXT_POLL if BR2_PACKAGE_LIBWEBSOCKETS
 	help
 	  Build and install the mosquitto broker onto target.
 
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index a1848f96b3..9b3bcc1cf5 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -41,9 +41,11 @@ MOSQUITTO_CONF_OPTS += \
 	-DWITH_TLS=ON \
 	-DWITH_TLS_PSK=ON
 
-ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_LIBWS),y)
 MOSQUITTO_DEPENDENCIES += libwebsockets
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=OFF
+else ifeq ($(BR2_PACKAGE_MOSQUITTO_WS_BUILTIN),y)
+MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=ON
 else
 MOSQUITTO_CONF_OPTS += -DWITH_WEBSOCKETS=OFF -DWITH_WEBSOCKETS_BUILTIN=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
