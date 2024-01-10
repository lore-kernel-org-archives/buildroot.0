Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B114C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38288400C1;
	Wed, 10 Jan 2024 22:01:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38288400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s4nZoFMRNV4g; Wed, 10 Jan 2024 22:01:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C3A40143;
	Wed, 10 Jan 2024 22:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C3A40143
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC62F1BF94D
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D176483D6A
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D176483D6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KGxYJbXGxe8T for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:01:42 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0F4583D66
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0F4583D66
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3376555b756so2733767f8f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 14:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704924099; x=1705528899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6h/q2VmoKLPqvAX6UVXmShblJZOaicXC5Dg+uFbumlE=;
 b=m/wf25ACY10zml9J+ikX4vvoTEBKdtC3gpvLQLXbdD0fVUcMP+hwMeekgr3vcoKJVG
 OXy3cnWWuJIwYiPynj91DqJjKCYxz6ROG45owPw8yu2+h7ahJwfNWMGqfqLHN6FkR3hg
 +DIqFdVfGLVykGUEWA43tVub8osTAVm9P/G/3fuD3xZi478Y9BP9pSagceARdYouwc4+
 N7cTZ3oJ43HL2dmtKlJqRx/y6OMg1d4eagA9UUGV+1cDtV7dz0YUlLUSQSs2I5V+tQ9n
 RPypaJpR693FqeADBUQ2rgNz4gb4jLGL5qzJWZTkIoKeLPcipLdNlgqqZKXuuH2E2kYg
 lnmg==
X-Gm-Message-State: AOJu0YxoQFUg9BfzouDf1+Ab+CWOViCQbHKMNOpBhLIWGWX2QH/gHQJt
 r4jPtal31IqbsZTCIGoPQskl1++mLOc=
X-Google-Smtp-Source: AGHT+IHHRDoHz+JDqRYw+d5mngZNcsJ3DFBbHNWaYuNd/KkLUDmVyycZik6indrLtTyRyXbPeWootQ==
X-Received: by 2002:adf:eb8d:0:b0:336:641d:626c with SMTP id
 t13-20020adfeb8d000000b00336641d626cmr43364wrn.61.1704924098841; 
 Wed, 10 Jan 2024 14:01:38 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d6346000000b0033667867a66sm5760363wrw.101.2024.01.10.14.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 14:01:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:01:31 +0100
Message-ID: <20240110220131.1268844-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704924099; x=1705528899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6h/q2VmoKLPqvAX6UVXmShblJZOaicXC5Dg+uFbumlE=;
 b=LLCBE5AX6kUvK/VbWWISsKhIpb/3kd8o8GRfoK21Nn2MqDGSHAvoJ/5XcTQLH2xHSd
 KljiliIx7LV5Bdtxq5tGXAb9/MPp+w4Fu4VCZFn5FV+axF5gBs6S2T49oG/KKGEv/QIn
 C4yLjofdJB3fq5+nK13xpNH8tkSqYswlhOHKEnvSDp6raaYTm6cYRIWT2S7eqoR+Q7o8
 TbfUVyKCDUHZsMIT841P/iF8RQKaNa/j2K0aDppleNSDU8aUhxE/JMY2bS442lgohx16
 /aECFNGJqAZw4efIhFuazFNOC8moExUbMLX3HCDRlLnedvt3cZ5zntHDZhYdoguNVnN+
 K+ew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LLCBE5AX
Subject: [Buildroot] [PATCH 1/1] package/kismet: bump to version 2023-07-R1
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

- openssl is a mandatory dependency of BR2_PACKAGE_KISMET_SERVER since
  https://github.com/kismetwireless/kismet/commit/d916acf8c0fa36d8d794ce3d0fb87fc180592b6c
- pcre2 is an optional dependency since
  https://github.com/kismetwireless/kismet/commit/bb1ecb1c5688cafb1914847c2d068f820b847f2b
- disable wifi-coconut (enabled by default and depends on libusb:
  https://github.com/kismetwireless/kismet/commit/e221b8d45c1598aac64dd4403be1bf7d7df3d0a6)

https://kismetwireless.net/posts/kismet-2023-07-r1/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/Config.in   |  1 +
 package/kismet/kismet.hash |  2 +-
 package/kismet/kismet.mk   | 12 ++++++++----
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/kismet/Config.in b/package/kismet/Config.in
index 7bde6c92af..80e68743a5 100644
--- a/package/kismet/Config.in
+++ b/package/kismet/Config.in
@@ -63,6 +63,7 @@ config BR2_PACKAGE_KISMET_SERVER
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PROTOBUF
 
 comment "server needs a toolchain w/ dynamic library, wchar"
diff --git a/package/kismet/kismet.hash b/package/kismet/kismet.hash
index 725d24e551..543515858e 100644
--- a/package/kismet/kismet.hash
+++ b/package/kismet/kismet.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2149cceac5526508653f4d02dcf7a694e3da3dc000a2372a1ee4bf9988279781  kismet-2022-08-R1.tar.xz
+sha256  f08548e26ca65fa1e567b1debbea1ca4d0e7206bddb96a4f639c90171873e8f7  kismet-2023-07-R1.tar.xz
 sha256  93c7f0d7e356b0abfb6f494ff3ea37f96abc84e9a5619b25d4e43f7553a55739  LICENSE
diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 8def78ad2a..c448233d60 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-KISMET_VERSION = 2022-08-R1
+KISMET_VERSION = 2023-07-R1
 KISMET_SOURCE = kismet-$(KISMET_VERSION).tar.xz
 KISMET_SITE = http://www.kismetwireless.net/code
 KISMET_DEPENDENCIES = \
 	host-pkgconf \
 	libpcap \
 	$(if $(BR2_PACKAGE_LIBNL),libnl) \
+	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_PROTOBUF),protobuf) \
 	protobuf-c \
 	sqlite \
@@ -19,7 +20,7 @@ KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
 KISMET_SELINUX_MODULES = kismet
 
-KISMET_CONF_OPTS = --disable-debuglibs
+KISMET_CONF_OPTS = --disable-debuglibs --disable-wifi-coconut
 
 KISMET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
@@ -57,9 +58,12 @@ else
 KISMET_CONF_OPTS += --disable-lmsensors
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+KISMET_DEPENDENCIES += pcre2
+KISMET_CONF_OPTS += --enable-pcre --enable-require-pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 KISMET_DEPENDENCIES += pcre
-KISMET_CONF_OPTS += --enable-pcre
+KISMET_CONF_OPTS += --enable-pcre --disable-require-pcre2
 else
 KISMET_CONF_OPTS += --disable-pcre
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
