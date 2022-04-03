Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F16C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 14:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DCE940520;
	Sun,  3 Apr 2022 14:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3VYkGtr4ZwHy; Sun,  3 Apr 2022 14:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9779B40147;
	Sun,  3 Apr 2022 14:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6874C1BF3B0
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 14:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FD1240147
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 14:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4aOJlK4LNcG for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 14:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D891400A6
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 14:02:12 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d7so10731007wrb.7
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gNQhvbSrHGqfLb00AQe9y8RVVUEE6PSAQmOW/h+V6o=;
 b=B01a1VTeqCRfLeNrCYxuqIFL4yaAftd+wy4f5KnoZ3TicuKjX+wgmBxWdZ0hZrrAnO
 GMFxDr6tQhP3V9y/1CZIP7Ea6ch6JC51nUfYUFwlkJFZZijwWhJ2DvcDi6kNaaU7Sxjw
 laA7xp7slLvpAmoLP7TKKg0E1mDZiblLI8vgR3ri7kH9RVMfimtn8pTc0Pmid4haTMC2
 U8C86toKMDEWn8O0Mxr1J60lsU9v7UTpkqr49wgZ4clG7EefSq4Zz/j5MHv5AUPyRyLi
 hygqPJBkVjbNMwgBs+LR3+lF+Ax+0UKae3OfN7CgdFrwMG+TIluN6lCLDG1F88Wox+Yh
 4B9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/gNQhvbSrHGqfLb00AQe9y8RVVUEE6PSAQmOW/h+V6o=;
 b=QGJ3oYnM0XGsdH0DHGUZqLaAuvWD2zN/6GQ0d8/hhwFwMGIT+Mr38g7R1Ytu28OtUj
 SJ9EulyR+hCBV1Gv+RJhiHTjXWKeYyx0N3amYxfI5Ra2AVXKfy9OUm8VdhQD8LQ/P/YR
 DE8qsFfW0s8KlT4My7cmiEpRCalyuwB6jZYfnWTWncN98+6mpNwK1OdW+CnyiuuOH5Jj
 LUAEkvOE2uZLm5HFaM9nhGTL7KaMdQE+77hM+niOwIohU3VUOkXcn+oc5AGFM+3UZ0Ut
 o1d1xm79EL19zXsYnHVN2TjCe9F+XAhZKVUjnkvzN73PjvE2Q89jSU+awER99JvVistj
 8Srw==
X-Gm-Message-State: AOAM5325ihrdidi8b3Gb/AVQRogQOEDIxuDeQsgqQtDqTLVjyCxxkoqS
 vjQf/axKdKBGK2dJ6nDcz+n/Dqp6NJI=
X-Google-Smtp-Source: ABdhPJztqzNVBoYL2ehQSkuLEJ7aA+SmKPEdx+stmlO2/OQr16YExc8Ex8F+fILtazcBlDUM0R0Q3g==
X-Received: by 2002:a5d:5848:0:b0:203:fef3:888b with SMTP id
 i8-20020a5d5848000000b00203fef3888bmr13964800wrf.611.1648994530369; 
 Sun, 03 Apr 2022 07:02:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0038cb8b38f9fsm15124208wmq.21.2022.04.03.07.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 07:02:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 16:00:24 +0200
Message-Id: <20220403140024.3774250-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glib-networking: fix build with
 libressl
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

glib-networking raises the following build failure with libressl:

../tls/openssl/gtlsconnection-openssl.c: In function 'g_tls_connection_openssl_handshake_thread_request_rehandshake':
../tls/openssl/gtlsconnection-openssl.c:419:27: error: 'TLS1_3_VERSION' undeclared (first use in this function); did you mean 'TLS1_2_VERSION'?
  419 |   if (SSL_version(ssl) >= TLS1_3_VERSION)
      |                           ^~~~~~~~~~~~~~
      |                           TLS1_2_VERSION
../tls/openssl/gtlsconnection-openssl.c:419:27: note: each undeclared identifier is reported only once for each function it appears in
../tls/openssl/gtlsconnection-openssl.c:420:11: error: implicit declaration of function 'SSL_key_update' [-Werror=implicit-function-declaration]
  420 |     ret = SSL_key_update (ssl, SSL_KEY_UPDATE_REQUESTED);
      |           ^~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b8dea5704903c84858c7a339a73ecb713ac2791c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/glib-networking/Config.in          | 1 +
 package/glib-networking/glib-networking.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
index 38cded5e6b..9c5d36af16 100644
--- a/package/glib-networking/Config.in
+++ b/package/glib-networking/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_GLIB_NETWORKING
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL if !BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_P11_KIT if BR2_PACKAGE_GNUTLS
 	help
 	  Network-related GIO modules for glib.
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index f74e520d31..e8905dfff4 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -31,7 +31,7 @@ else
 GLIB_NETWORKING_CONF_OPTS += -Dgnutls=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 GLIB_NETWORKING_DEPENDENCIES += openssl
 GLIB_NETWORKING_CONF_OPTS += -Dopenssl=enabled
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
