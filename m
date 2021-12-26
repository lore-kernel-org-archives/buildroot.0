Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391FCC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 16:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE1D402A4;
	Sun, 26 Dec 2021 16:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YSvs1Ibtw2qk; Sun, 26 Dec 2021 16:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 342C540286;
	Sun, 26 Dec 2021 16:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0B761BF2BF
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 16:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0C0840286
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 16:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcOzGkK9yAUY for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 16:21:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2B5540285
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 16:21:56 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id b73so8244626wmd.0
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ndEX/6pvmrJ/SRF+wS3cJezsNBKPeqbZ6Y8OjUofY2k=;
 b=SXaJrujN7/fyZzPC2hhgUYL31wD2FkZexLYsbbbpcefDh1YAoGt4x21qAD6oWzwj2e
 7pKP6a9JCnBLtqEzL+QXKN/SJOih4Tx6O+YKeRlpp+CSdK5+d/7yOELr+w1i3PP1dIi6
 I750Xrvb8l3AyTwxt8Z/VCe+Z0fWtEfIpebBHhBtNHeKBFjm8ZqqJEfbAQKnoTZplWVG
 +ciAHG0aLKI5LGbLDdY77D2C2gcm8Fb+RvuiuqsYljgMxAj3TC+RRri4kj8mjGbbyOnR
 RZsCJRUBmWj77YfL3lD1+RN/nxJBZMjMb6EiRzrVhILwam1Yd9+LGc/4wQXolxGf8ZZ6
 oxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ndEX/6pvmrJ/SRF+wS3cJezsNBKPeqbZ6Y8OjUofY2k=;
 b=ukkxzenKk2D6vhNdAAl1GJpB0Vbj2K6FbESrsJh2YHfcI7jCDfgTO+yKfzmYWPWNxj
 6UHuHAjr7duLZ4YUutchCFPhJ0ubzGXAfsweHKh9+dwoga8DCPULjgD4IYCkjp6ng99F
 d77VcIlAtLYgRli9D7PqlYBBGNfpwVjfFmfgq62I4jS49myAFY+wfxxCkQuWcPDAL+/3
 mgkKume9EIdY20PKqUU7hMgJK9ycY0VIhZHcZU52Z0ymCdMGHs8DL6CiO+uEjTjMVcSr
 JfNcN2e758qfFiAWuu4GlNA/C/WvYXx7EnvHuBeo8hvxDy3TxYSjpV8NoLW8t+GJHX9Z
 zs6Q==
X-Gm-Message-State: AOAM530rbSCtz7+NM4DdBhPr5QT6A54BznUc7pAp9ZSPgcZp9RmBrcb6
 FtO8RmmynuH6tnMEWoNAPZaFVXSvnxAF0w==
X-Google-Smtp-Source: ABdhPJypXViuBZkokJQM5DShJRLg0HZV63FebkYNFF0+y0Lmzxd+N36+OnVsR5ChZKB6STxOo/FLnw==
X-Received: by 2002:a05:600c:3ac8:: with SMTP id
 d8mr10606015wms.72.1640535714882; 
 Sun, 26 Dec 2021 08:21:54 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id z5sm12740310wru.87.2021.12.26.08.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 08:21:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 17:20:57 +0100
Message-Id: <20211226162057.1052161-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211226162057.1052161-1-fontaine.fabrice@gmail.com>
References: <20211226162057.1052161-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libseccomp: bump to version 2.5.3
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- host-gperf is a mandatory dependency since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/9b129c41ac1f43d373742697aa2faf6040b9dfab
- RISC-V 64 bits is supported since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/5432e15521d5ce5a7d3f26bf78674cbaa9d73d1f
- Add a dependency on kernel >= 3.17 because __NR_seccomp is
  unconditionally used since version 2.5.0 and
  https://github.com/seccomp/libseccomp/commit/dead12bc788b259b148cc4d93b970ef0bd602b1a
  and __NR_seccomp is only available since
  https://github.com/torvalds/linux/commit/48dc92b9fc3926844257316e75ba11eb5c742b2c

https://github.com/seccomp/libseccomp/blob/v2.5.3/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libseccomp/Config.in       | 7 ++++---
 package/libseccomp/libseccomp.hash | 4 ++--
 package/libseccomp/libseccomp.mk   | 3 ++-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index da1d9008e6..7de91c07c5 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -5,12 +5,13 @@ config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
+	default y if BR2_RISCV_64
 	default y if BR2_s390x
 
 config BR2_PACKAGE_LIBSECCOMP
 	bool "libseccomp"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	help
 	  High level interface to the Linux Kernel's seccomp filter
 
@@ -24,6 +25,6 @@ config BR2_PACKAGE_LIBSECCOMP
 
 	  https://github.com/seccomp/libseccomp
 
-comment "libseccomp needs a toolchain w/ headers >= 3.12"
+comment "libseccomp needs a toolchain w/ headers >= 3.17"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
diff --git a/package/libseccomp/libseccomp.hash b/package/libseccomp/libseccomp.hash
index 2d07c1c1fa..20b8864727 100644
--- a/package/libseccomp/libseccomp.hash
+++ b/package/libseccomp/libseccomp.hash
@@ -1,4 +1,4 @@
-# From https://github.com/seccomp/libseccomp/releases/tag/v2.4.4
-sha256  4e79738d1ef3c9b7ca9769f1f8b8d84fc17143c2c1c432e53b9c64787e0ff3eb  libseccomp-2.4.4.tar.gz
+# From https://github.com/seccomp/libseccomp/releases/tag/v2.5.3
+sha256  59065c8733364725e9721ba48c3a99bbc52af921daf48df4b1e012fbc7b10a76  libseccomp-2.5.3.tar.gz
 # Locally calculated
 sha256  102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  LICENSE
diff --git a/package/libseccomp/libseccomp.mk b/package/libseccomp/libseccomp.mk
index e7512730d5..ee2cb126f1 100644
--- a/package/libseccomp/libseccomp.mk
+++ b/package/libseccomp/libseccomp.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBSECCOMP_VERSION = 2.4.4
+LIBSECCOMP_VERSION = 2.5.3
 LIBSECCOMP_SITE = https://github.com/seccomp/libseccomp/releases/download/v$(LIBSECCOMP_VERSION)
 LIBSECCOMP_LICENSE = LGPL-2.1
 LIBSECCOMP_LICENSE_FILES = LICENSE
 LIBSECCOMP_CPE_ID_VENDOR = libseccomp_project
 LIBSECCOMP_INSTALL_STAGING = YES
+LIBSECCOMP_DEPENDENCIES = host-gperf
 
 $(eval $(autotools-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
