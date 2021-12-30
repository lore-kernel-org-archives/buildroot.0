Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D98C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 09:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AFEF813BD;
	Thu, 30 Dec 2021 09:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olf3MpvWjn21; Thu, 30 Dec 2021 09:46:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522678138A;
	Thu, 30 Dec 2021 09:46:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89D121BF346
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 795F7410C3
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 09:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFnp2BrE6bJ0 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 09:46:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87A95410C2
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 09:46:01 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k18so12644897wrg.11
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 01:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZdg7NP4L67lRPopkGf2QDJNS7XPq9kPIWbAYIVgPLc=;
 b=T3yKJU4dCY0D5MeEel+v39n+ffAK3tGCbvIx74u1BopZnPmJJUn+X5QM1XcFRrWllv
 Gewetm2/5k+BUJ1ahIi/DskBHaK4ZkH/RGIRiwRjuZnxdZl8SQNRgr4Urmth3mODpkUR
 oA0eI1fCE0y/5AS/BzV6D9rWRZmhsxzkDTY81lL0psF+ArobXnZQFxyNSwZs2lPEHxom
 M4qWTZqyUcPzvECKzdWA0wuxFneqkZdePKsnVJzxSNRJA6QLc3gySs6bjjfjeSnp1MFS
 KxG+TjiL4ZIHDo9s6nIvY/7PRKuCrlbkf0ttC3PWP5rBOLIoLmuhMQdaeHg54KmcNGzN
 Bp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZdg7NP4L67lRPopkGf2QDJNS7XPq9kPIWbAYIVgPLc=;
 b=QeD0pLQCweeBNc4Ydg9SO6uEMS6BfbgEqVnFpNzAyuFgRHxFUEM15qHzmRkWlvn6V5
 aNxH6TY8QK/8Qqzq4hFcJP1ONQSKkQPnAoUVr+HtQO8B5dG7eGhjzoFmyh4uvTTPk45Y
 PK94zOJwvIc2/cuKxORKJ4fT7TC8Ou/C5Q08TKX1Qfu3YHoskKQMjZgYRuP85lfPKa24
 drveMmMMgZhe2esfnS9ZCLafydHK6hr30os7kMLTxRpnG5NUWFRLJAe30t5mGPxQu40o
 LGka0HxLuFXbfBsjWUszCHCfdkuW82T7Pr3IeZiYrQnubw3W5kd5Tt481tbOItaEIIAc
 58QQ==
X-Gm-Message-State: AOAM533InvtS76xEMlVpjv14A1VmMAvurSL7d5+w/KQVQiXjonOCYdqf
 0H9h1ZwdSZlQH92hWvCe3Xm7DXkDGsQ=
X-Google-Smtp-Source: ABdhPJw2PSgnzi4N+EcAZg1N61+FjtBGXFJW5ds0Bt9wJV9Z1dv2ui8a6rLwxkeoE3H6htRVbBP6Mg==
X-Received: by 2002:adf:b608:: with SMTP id f8mr23328668wre.628.1640857559864; 
 Thu, 30 Dec 2021 01:45:59 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id h19sm22569246wmm.13.2021.12.30.01.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 01:45:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 10:44:43 +0100
Message-Id: <20211230094443.1727912-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix build with openssl and
 gnutls
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Combination of cryptolib=openssl and dns-over-tls=gnutls is disallowed
since version 250 and
https://github.com/systemd/systemd/commit/e37ad765c86d2a763a2d655068dfe59789f18e3e
resulting in the following build failure since commit
e9fb26cbb8dafd28f50a912bcaddb1056769ec17:

../output-1/build/systemd-250/meson.build:1482:16: ERROR: Problem encountered: Sorry, -Ddns-over-tls=gnutls is not supported when openssl is used as the cryptolib

Fixes:
 - http://autobuild.buildroot.org/results/2fcd4ad64b32cc4835866c9d99e05ab8c9bc794a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/systemd/systemd.mk | 38 ++++++++++++++++++--------------------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3b0356ac9a..0b52cc47d1 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -115,13 +115,6 @@ else
 SYSTEMD_CONF_OPTS += -Delfutils=false
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SYSTEMD_DEPENDENCIES += gnutls
-SYSTEMD_CONF_OPTS += -Dgnutls=true
-else
-SYSTEMD_CONF_OPTS += -Dgnutls=false
-endif
-
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 SYSTEMD_DEPENDENCIES += iptables
 SYSTEMD_CONF_OPTS += -Dlibiptc=true
@@ -230,13 +223,6 @@ else
 SYSTEMD_CONF_OPTS += -Dp11kit=false
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYSTEMD_DEPENDENCIES += openssl
-SYSTEMD_CONF_OPTS += -Dopenssl=true
-else
-SYSTEMD_CONF_OPTS += -Dopenssl=false
-endif
-
 ifeq ($(BR2_PACKAGE_PCRE2),y)
 SYSTEMD_DEPENDENCIES += pcre2
 SYSTEMD_CONF_OPTS += -Dpcre2=true
@@ -491,14 +477,26 @@ else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=gnutls -Ddefault-dns-over-tls=opportunistic
-SYSTEMD_DEPENDENCIES += gnutls
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=openssl -Ddefault-dns-over-tls=opportunistic
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=false \
+	-Dopenssl=true \
+	-Ddns-over-tls=openssl \
+	-Ddefault-dns-over-tls=opportunistic
 SYSTEMD_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=true \
+	-Dopenssl=false \
+	-Ddns-over-tls=gnutls \
+	-Ddefault-dns-over-tls=opportunistic
+SYSTEMD_DEPENDENCIES += gnutls
 else
-SYSTEMD_CONF_OPTS += -Ddns-over-tls=false -Ddefault-dns-over-tls=no
+SYSTEMD_CONF_OPTS += \
+	-Dgnutls=false \
+	-Dopenssl=false \
+	-Ddns-over-tls=false \
+	-Ddefault-dns-over-tls=no
 endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_TIMESYNCD),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
