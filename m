Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F9EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 08:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71CD41521;
	Sun, 12 Jun 2022 08:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJZNxnCe9zux; Sun, 12 Jun 2022 08:48:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 798CF4091A;
	Sun, 12 Jun 2022 08:48:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 017441BF4DA
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E46DD404B0
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g76lajWKw9dL for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 08:48:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB199400E5
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 08:48:21 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id o8so3680039wro.3
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z3JgVObtaNIIxLA0QEFMVFysUs4d9Of3jc5NPUPlYNs=;
 b=B/NqhnVH2K23eGMWMoKcBGaLesU1SH+mMeDt6rf604FDAtFrwmkCGowcd/yC9toGOI
 2rkl0a/DiYue2uyXK6SMPKMrXn7yEwCg0/0xGQP5UWpALq6I/MtRE+Ev6T2AWWVG3p+G
 0QJNBAxwWkDznh/nC82XuFGrEoBT1w2hbgTkwdhSOAUZvYXvwHmjQXSqjBYDOiFW40p3
 kYPHhuVpEVXJF7smro4oCUIRZXrN4b48y9TPdIjgnKC653EVIjny4FQnwKLWqs5YOUZX
 vLXXyitJ8uHcq90d3M53/Kt4JW9qnW6GkRoOpX7btbmVTMePKidueIrwqc2xZlcyI0wk
 fQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z3JgVObtaNIIxLA0QEFMVFysUs4d9Of3jc5NPUPlYNs=;
 b=vpNGJJ44nNzTnpef7OA9hhBZp4g6CWmDhhMRkzAohA2Zvb4Mgz2xKEVqRvf3NUdBcR
 UR7VHG4SnPsv4madjj+jHmWLgLwU5z6Qe42diLUdt33d+AFmK4YSekflv9WsiXumMCGT
 57LICskK7SqvJgsBGbjh/EkZK2uT83EXIqBB52WWmqkGvYijXqDV+cRcA9OcrTYdHqgt
 Msa+FqrHhUQA50sZlYEdwcP3ZbymcWOGPcy9PyjOJmTrLq0mvKVkHPpcAt2S+vD9eFrx
 F4aaN6np49VV/De6Yy0iBDbRNgPKUAS1ATax5WslMIn11eR4acmwtQ5YByw4xBFeK/vA
 0OPw==
X-Gm-Message-State: AOAM530XK/04uMD7Dn8D0EahmkFv9BAC5wrsD2IpzZiCQCxgea93qk7u
 UnHNqFkG22B2YFzDG7UhOmKAnZ9ehI8=
X-Google-Smtp-Source: ABdhPJxcCblD9qnd4j1okq+MWOEjx2PqRz60mPn2LkVZbiy1Mn1ZtbUl5iWgtba5sNPpQw10jZ8Rfg==
X-Received: by 2002:adf:f40e:0:b0:218:3ea6:2d4d with SMTP id
 g14-20020adff40e000000b002183ea62d4dmr35194549wro.309.1655023699616; 
 Sun, 12 Jun 2022 01:48:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003974a00697esm10769309wmq.38.2022.06.12.01.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 01:48:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 10:45:37 +0200
Message-Id: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/2] package/wolftpm: fix dependencies
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
Cc: Dimitar Tomov <dimi@tpm.dev>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pkg-config is not used by wolftpm and wolfssl dependency is missing (and
optional but highly recommended) resulting in the following build failure
since the addition of the package in commit
4bb884a3c61c6b71e33f69453a90eb2a367f64b7:

configure: error: WolfSSL library not found. You can get it from http://www.wolfssl.com/download.html
        If it's already installed, specify its path using --with-wolfcrypt=/dir or --prefix=/dir

Fixes:
 - http://autobuild.buildroot.org/results/77a93521b909e701ef4e86f18524258b9242c721

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Dimi Tomov):
 - Add a wolfcrypt option which is enabled by default

 package/wolftpm/Config.in  | 23 ++++++++++++++++++-----
 package/wolftpm/wolftpm.mk | 13 ++++++++++---
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/package/wolftpm/Config.in b/package/wolftpm/Config.in
index 0fe094f277..0b964c3d7e 100644
--- a/package/wolftpm/Config.in
+++ b/package/wolftpm/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_WOLFTPM
 	bool "wolftpm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_WOLFSSL
-	select BR2_PACKAGE_WOLFSSL_ALL
 	help
 	  wolfTPM is a portable, open-source TPM 2.0 stack with
 	  backward API compatibility, designed for embedded use.
@@ -12,5 +8,22 @@ config BR2_PACKAGE_WOLFTPM
 
 	  https://www.wolfssl.com/
 
-comment "wolftpm needs a toolchain w/ threads, dynamic library"
+if BR2_PACKAGE_WOLFTPM
+
+config BR2_PACKAGE_WOLFTPM_WOLFCRYPT
+	bool "wolfCrypt hooks"
+	default y
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wolfssl
+	depends on !BR2_STATIC_LIBS # wolfssl-all
+	select BR2_PACKAGE_WOLFSSL
+	# not mandatory, but needed to get all features
+	select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  Enable wolfCrypt hooks for RNG, Auth Sessions and Parameter
+	  encryption. Disabling this option is not recommended as it
+	  could create a security breach in most environments.
+
+comment "wolfCrypt hooks need a toolchain w/ threads, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+endif
diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index ea01eaad6b..760656e134 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -10,7 +10,6 @@ WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
 WOLFTPM_CPE_ID_VENDOR = wolfssl
-WOLFTPM_DEPENDENCIES = host-pkgconf
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
@@ -19,8 +18,7 @@ WOLFTPM_AUTORECONF = YES
 
 WOLFTPM_CONF_OPTS = \
 	--disable-examples \
-	--enable-devtpm \
-	--with-wolfcrypt=$(STAGING_DIR)/usr
+	--enable-devtpm
 
 # Fix for missing config.rpath in the codebase
 define WOLFTPM_TOUCH_CONFIG_RPATH
@@ -29,4 +27,13 @@ define WOLFTPM_TOUCH_CONFIG_RPATH
 endef
 WOLFTPM_PRE_CONFIGURE_HOOKS += WOLFTPM_TOUCH_CONFIG_RPATH
 
+ifeq ($(BR2_PACKAGE_WOLFTPM_WOLFCRYPT),y)
+WOLFTPM_CONF_OPTS += \
+	--enable-wolfcrypt \
+	--with-wolfcrypt=$(STAGING_DIR)/usr
+WOLFTPM_DEPENDENCIES += wolfssl
+else
+WOLFTPM_CONF_OPTS += --disable-wolfcrypt
+endif
+
 $(eval $(autotools-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
