Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A344C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 20:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79D185A0E;
	Sun, 12 Dec 2021 20:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMRROstJCrWl; Sun, 12 Dec 2021 20:51:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422CC85940;
	Sun, 12 Dec 2021 20:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3DF931BF41A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C28160EC0
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDzmp83qF-Rz for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 20:51:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3823D60E99
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 20:51:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k9so6153717wrd.2
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6kl5unkXMmnwxpsILae0BMTCyqTcNGSQkV7TzUhdZhI=;
 b=SxoksrKNoYW54bqLGiZHhBlCcuf2SV5178Rhflv2NYHv7oauSBgfxTubGdhMsZGFEy
 9YsHOtQODiKjzz1bChrAc2aP7n4xaZ0r3OdifrgsTA5gBCbVDUumu/GoKq3sZV+kAQGB
 /UkhuMVZtVsKEt3H95wG3LZCRFkTRje4kjoEhJwnlEgQjUXH2M+z5n8uhumoVoj+3S8m
 xiLlrIF+8WWlxhD+qUvSDhvNo/s8SgrNSsufBpPm1rrLMz6k5S8fbqQO3kVn7DMAKMTj
 iJ1bpBGLUV7T6fsOkcUlKw8dntQ4SJTRr8ivfGUX06X0II4+aZ5scHh1FUJVpF/IgYYo
 GzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6kl5unkXMmnwxpsILae0BMTCyqTcNGSQkV7TzUhdZhI=;
 b=UrqBdriVNCGm2BzXjUnxMp2tJdpiMbT+P8vzG+/Nag2BVwol/SsHie3EhYqfz1GOgs
 YciLijyvmd7YCp/Umf9f/4Ry6utn7If2IKEjDLeItP4SXCwxTEcP8hXA76unPa5ltgL+
 mY5w9SRHQE2fPZGqSilmg1rgHqXCw4JYliDy04Jr6asdhQLgIUVXkxwsgtlp2KRgOYdF
 6/SzytQx7ssMeVlF4ZckUKF+cdQ6jEblOUG7JwDAAdgDrBPm7zv6c8pBvVE0kqWx5U8G
 s8Aj01qkcgflbvYHxk0SfgaMURKctHMpu/5KIOH0OKspYQCCvQ6KaPr3aytrAZI7K5Y1
 oVGg==
X-Gm-Message-State: AOAM53180N21EXVWJS9FgAsA775Gvpu0RAV3k+LVii+Gbw246+AVTdjJ
 Uppgq3+hEIOv6E6V1Ou89KIEW+xSX9onuA==
X-Google-Smtp-Source: ABdhPJz6dyTXxY1hUFBTRu7qTIeaKp5/rH79nnafLgb3O94OQp3AapXIpTzLf42GK2vGr0VmaYAzaA==
X-Received: by 2002:a5d:4e51:: with SMTP id r17mr11538007wrt.520.1639342283166; 
 Sun, 12 Dec 2021 12:51:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id v6sm5804081wrm.115.2021.12.12.12.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 12:51:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 21:51:11 +0100
Message-Id: <20211212205111.971429-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcoap: bump to version 4.3.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- disable examples source which is enabled by default since
  https://github.com/obgm/libcoap/commit/feb8c15b4572569716cf1c037092edb4717ca537
- mbedtls is an optional dependency since
  https://github.com/obgm/libcoap/commit/f601ddbf78720a74f29acb704256bc2655c4aeaa
- Add Apache-2.0 for mbedtls to licenses:
  https://github.com/obgm/libcoap/commit/0fccf2e71347af0ef3973ac565fca110ec3d4f40

https://github.com/obgm/libcoap/blob/v4.3.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcoap/libcoap.hash |  4 ++--
 package/libcoap/libcoap.mk   | 17 ++++++++++++-----
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 3472006224..4a5bcaa7ff 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  29a0394a265d3febee41e5e2dc03d34292a0aede37f5f80334e529ac0dab2321  libcoap-4.2.1.tar.gz
+sha256  1a195adacd6188d3b71c476e7b21706fef7f3663ab1fb138652e8da49a9ec556  libcoap-4.3.0.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  c51e85271aca3fbdd79bb4ee45dcfd854724538dad83b70afbbdfc62415e3e7f  LICENSE
+sha256  c5625e704d52deade1c9b2d7931ac8593be147ba63af62b53b8c7e309b7eaeb9  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 9a5e04d4fd..528d7d18a5 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,21 +4,28 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.2.1
+LIBCOAP_VERSION = 4.3.0
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
-LIBCOAP_LICENSE = BSD-2-Clause
+LIBCOAP_LICENSE = BSD-2-Clause, Apache-2.0 (mbedtls)
 LIBCOAP_LICENSE_FILES = COPYING LICENSE
 LIBCOAP_DEPENDENCIES = host-pkgconf
-LIBCOAP_CONF_OPTS = --disable-examples --without-tinydtls
+LIBCOAP_CONF_OPTS = \
+	--disable-examples --disable-examples-source --without-tinydtls 
 LIBCOAP_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
-LIBCOAP_CONF_OPTS += --enable-dtls --with-gnutls --without-openssl
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --with-gnutls --without-mbedtls --without-openssl
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBCOAP_DEPENDENCIES += openssl
-LIBCOAP_CONF_OPTS += --enable-dtls --without-gnutls --with-openssl
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --without-gnutls --without-mbedtls --with-openssl
+else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+LIBCOAP_DEPENDENCIES += mbedtls
+LIBCOAP_CONF_OPTS += \
+	--enable-dtls --without-gnutls --with-mbedtls --without-openssl
 else
 LIBCOAP_CONF_OPTS += --disable-dtls
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
