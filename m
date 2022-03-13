Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB18C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 09:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4268781C56;
	Sun, 13 Mar 2022 09:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yOOWHpYyNpkb; Sun, 13 Mar 2022 09:22:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E98D81B25;
	Sun, 13 Mar 2022 09:22:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B65A41BF2A6
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D01B60B57
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 09:22:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4hpRCqiZW6zy for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 09:22:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A925607BC
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 09:22:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p9so19364575wra.12
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 01:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQAAYMyw6jCeAKgxKwI3yCTmPxs5iVW868W+Er9FzP0=;
 b=OpJa3kG+HNgiUu/d5ddleDQhcTvURAvKmWCdMVzRNZuSbeLPMDFq9jOsmfTa1NbJaR
 A1iYAGCaX8quaTgATfRoxJwXdfePzOttR3eUPhc7eAtfS4yjPXLI7g3BpNQTHJkUOxUj
 rgjMkk8iKP2iTHGvcJiTbPsPRBaP8gUOzLp0Tok3hTUTiNKQprmvU27Z9GMl9E8sq+uq
 pvQ6MqEXthOWyUTZkGHmTKpUVKYYi9lVibdyDzzrgPRcvM+zgkApAfR2nb620Jhob1Y2
 iWzFxmaWX01evq5odST5FkyGGZOHyFO+juih6/UqYuRqgexffVHOzdMlS456nm+J6SzY
 Wagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JQAAYMyw6jCeAKgxKwI3yCTmPxs5iVW868W+Er9FzP0=;
 b=ZzWlWVWBy8gYBS/zUPh+iijNIvjLO+Dfd7ngP6MTaIedJWV3LAqymVZ4GT1MC+tT1i
 mtru7J0blaSLHGMQau6DBi0exOAvKqxsO1hR0cMzZLJGVTRYTAf5YJnu+nteZoKgAH4a
 wK869dH9MCLQiL7y13njsBmnke77RQTriV3NfZogmMz9Uw++Nj1Hg+9sd1F/1Rl84l7u
 yVyWOVqOnmyw8MxbY2AhMjnCjqm21wzC1bTrmK3oVEjCWbLZs9ffyLm7xD9Nkz8AKgw3
 AQA21R7dh+B07n6l/Ql9J9YXRH/1tVXU+R7l5qR/JTztF2sk6XFR/bl4H5OdOipijsg+
 ep1A==
X-Gm-Message-State: AOAM532ik9SCbg8AS4s9NKCI4VQ/yPTBJuIVMu40TQTaSdVNz1v4+Owc
 ZdPPQ9giiyhhYZICpiKdXNvTpPDeHLw=
X-Google-Smtp-Source: ABdhPJxkThG5c7Bqc1tInCEo5Rtoh2UX31pz83uexmWOT6OfYyJ//Xb3rh+OlNX0v9+RMy1lBTrI6A==
X-Received: by 2002:a05:6000:15cb:b0:1f1:e26a:feae with SMTP id
 y11-20020a05600015cb00b001f1e26afeaemr12694432wry.295.1647163364466; 
 Sun, 13 Mar 2022 01:22:44 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p18-20020adfba92000000b001e4ae791663sm11107401wrg.62.2022.03.13.01.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 01:22:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 10:21:47 +0100
Message-Id: <20220313092148.353432-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/bind: reorder openssl variables
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl is mandatory since bump to version 9.16.26 in commit
8adeaec8afacbc680edebae91524f6144926ac92 so move openssl variables in
the beginning of bind.mk instead of keeping them in the middle of the
file. Moreover, drop "BIND_DEPENDENCIES += host-pkgconf zlib" as
host-pkgconf is already mandatory

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.mk | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 5ddf7652eb..e0c81152e1 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -28,7 +28,8 @@ BIND_TARGET_SERVER_SBIN += dnssec-keyfromlabel dnssec-signzone tsig-keygen
 BIND_TARGET_TOOLS_BIN = dig host nslookup nsupdate
 BIND_CONF_ENV = \
 	BUILD_CC="$(TARGET_CC)" \
-	BUILD_CFLAGS="$(TARGET_CFLAGS)"
+	BUILD_CFLAGS="$(TARGET_CFLAGS)" \
+	LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 BIND_CONF_OPTS = \
 	$(if $(BR2_TOOLCHAIN_HAS_THREADS),--enable-threads,--disable-threads) \
 	--without-lmdb \
@@ -36,14 +37,17 @@ BIND_CONF_OPTS = \
 	--with-randomdev=/dev/urandom \
 	--enable-epoll \
 	--enable-filter-aaaa \
-	--disable-backtrace
+	--disable-backtrace \
+	--with-openssl=$(STAGING_DIR)/usr \
+	--with-ecdsa=yes \
+	--with-eddsa=no \
+	--with-aes=yes
 
-BIND_DEPENDENCIES = libuv
+BIND_DEPENDENCIES = host-pkgconf libuv openssl
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BIND_CONF_OPTS += --with-zlib
 BIND_DEPENDENCIES += zlib
-BIND_DEPENDENCIES += host-pkgconf zlib
 else
 BIND_CONF_OPTS += --without-zlib
 endif
@@ -76,13 +80,6 @@ else
 BIND_CONF_OPTS += --with-libxml2=no
 endif
 
-BIND_DEPENDENCIES += host-pkgconf openssl
-BIND_CONF_OPTS += \
-	--with-openssl=$(STAGING_DIR)/usr \
-	--with-ecdsa=yes \
-	--with-eddsa=no \
-	--with-aes=yes
-BIND_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 # GOST cipher support requires openssl extra engines
 ifeq ($(BR2_PACKAGE_OPENSSL_ENGINES),y)
 BIND_CONF_OPTS += --with-gost=yes
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
