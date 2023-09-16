Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F9ECD37BC
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E984040B3B;
	Sat, 16 Sep 2023 13:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E984040B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8joHtNXixPv; Sat, 16 Sep 2023 13:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 110594026E;
	Sat, 16 Sep 2023 13:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 110594026E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0A6C1BF291
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A6B4026E
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A6B4026E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxNd6MrFTKlF for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:54:41 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5772B4016F
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5772B4016F
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-401187f8071so20130645e9.0
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 06:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694872479; x=1695477279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8oXIgLz2CV+lQPLZg9eP+tcCbrlcp/WU/wrcd4OlVHk=;
 b=wwrlpTKzlV2TTH6Ur/kz+B+BSMFksRILOTSlizaUEGhuTUafJi6AfD673ET1/iZ+If
 m+Z+TxkHX2wnghwOPf/VcAG9Dm+CJc0SDT0JDBhUdjsgOPn6MmuY7LoN2udx3Ix5L3xq
 x8LL5MV8f55/9Fcg5BmmArvn8/QqlptBXxLjfJ+oIVWR/NAkj/K6bHYzNB7O8p1YPDqe
 mdkiATTu/gV3R+fW2rNB4iRXLd4bsQdDwolOy5es8KG2/mpJI35Ma9cTLcukiUFhKRDy
 0wWmX3n9rNgV0zvUAUhKeQA5rp0YBkAurlLJrRyDNXHRHa0KXgR/1qW5oSv0Mh/QFGOV
 5sXw==
X-Gm-Message-State: AOJu0YwW3gqlYOuEg+MfjkdeRuMJfj/6Q2ehBnItBMDjXOb6WPyul1Vx
 uk2U3LpGjcERJblh3i8Q18laarSKu+A=
X-Google-Smtp-Source: AGHT+IGk4aga9d/op4dRV4ntZ1WQzO1eplyDpw/LnOEw2MdN4fvmvhNbYW/+x7VYt+onPwdeDWCRUg==
X-Received: by 2002:a05:600c:690f:b0:3fe:d67d:5040 with SMTP id
 fo15-20020a05600c690f00b003fed67d5040mr5689379wmb.5.1694872478706; 
 Sat, 16 Sep 2023 06:54:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c025200b003fe1a092925sm7435296wmj.19.2023.09.16.06.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Sep 2023 06:54:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 15:54:35 +0200
Message-Id: <20230916135435.113400-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694872479; x=1695477279; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8oXIgLz2CV+lQPLZg9eP+tcCbrlcp/WU/wrcd4OlVHk=;
 b=Gxd7rcyPD+OULr4r33jBpU4ZMZBm808wgJZ8xWgKOAXeqComxhQlbfYuTB3fY439e1
 14rZFmABz0RWcPCq/652jJbcAjsUtowkYyrtucJFI/dS9Sh6uJtUBDiPF+kLuQN3+rkZ
 NAbUXeGgriQQREGngUSDSQz6omG0yIUg/agxS64bPUzZuwp4XZF23TlLsXXJSsDhPidH
 p1DmMlh9FjINbtyfVNcGsvsR5E/2Z6iV0jEq4PpQoM6GzVAUbonixKeb4ECn3GkYHEkI
 3KqpsgojgJ/x7BP0I5eYJtMEGmmPtGZd40i3cFDBOf9gOuDd3X+RAHDyCKvad2bFXi6D
 BLnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Gxd7rcyP
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: needs gcc >= 4.9
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Karoly Kasza <kaszak@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux-pam raises the following build failure with gcc 4.8 since bump to
version 1.5.3 in commit f8147e27cdac8f998ec6644a09ce4e8d62b6433c and
https://github.com/linux-pam/linux-pam/commit/8f9816b57e3a475fc2d2cbb106c188b778098f85:

pam_access.c: In function 'pam_sm_authenticate':
pam_access.c:1084:13: error: 'for' loop initial declarations are only allowed in C99 mode
             for (int i = 0; filename_list[i] != NULL; i++) {
             ^

Those build failures could be fixed by adding -std=c99 but then the
build will fails because stdadtomic.h is mandatory since
https://github.com/linux-pam/linux-pam/commit/a35e092e24ee7632346a0e1b4a203c04d4cd2c62

Fixes:
 - http://autobuild.buildroot.org/results/9b2ba987d2c873f4a7caea72707acb655279d16b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linux-pam/Config.in   |  5 +++--
 package/nodm/Config.in        |  5 +++--
 package/openvmtools/Config.in |  5 +++--
 package/php-pam/Config.in     |  5 +++--
 package/rsh-redone/Config.in  | 11 +++++++----
 package/shadow/Config.in      |  6 ++++--
 6 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 27ba55bd61..b17716f2f7 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LINUX_PAM
 	depends on BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	select BR2_PACKAGE_FLEX
 	help
 	  A Security Framework that Provides Authentication for
@@ -11,7 +12,7 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
-comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library"
+comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/nodm/Config.in b/package/nodm/Config.in
index 2dd6f1e1cf..52fd031b9b 100644
--- a/package/nodm/Config.in
+++ b/package/nodm/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NODM
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR) # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_LINUX_PAM
 	help
@@ -17,7 +18,7 @@ config BR2_PACKAGE_NODM
 
 	  https://github.com/spanezz/nodm/
 
-comment "nodm needs a toolchain w/ wchar, locale, dynamic library"
+comment "nodm needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_PACKAGE_XORG7
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 67855f50e0..066a7a4736 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -32,13 +32,14 @@ config BR2_PACKAGE_OPENVMTOOLS_PAM
 	bool "PAM support"
 	# linux-pam needs locale and wchar, but we already have this
 	# dependency on the main symbol, above.
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Support for PAM in openvmtools
 
-comment "PAM support needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
+comment "PAM support needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_OPENVMTOOLS_RESOLUTIONKMS
 	bool "resolutionkms support"
diff --git a/package/php-pam/Config.in b/package/php-pam/Config.in
index 70f62a3180..c91fa8b6fe 100644
--- a/package/php-pam/Config.in
+++ b/package/php-pam/Config.in
@@ -4,13 +4,14 @@ config BR2_PACKAGE_PHP_PAM
 	depends on BR2_USE_WCHAR # linux-pam
 	depends on BR2_USE_MMU # linux-pam
 	depends on !BR2_STATIC_LIBS # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  PHP PAM (Pluggable Authentication Modules) integration
 
 	  https://pecl.php.net/package/PAM
 
-comment "php-pam needs a toolchain w/ wchar, locale, dynamic library"
+comment "php-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/rsh-redone/Config.in b/package/rsh-redone/Config.in
index 53ff2bea7f..fed643def4 100644
--- a/package/rsh-redone/Config.in
+++ b/package/rsh-redone/Config.in
@@ -19,11 +19,13 @@ config BR2_PACKAGE_RSH_REDONE_RLOGIND
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library"
+comment "rlogind needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_RSH_REDONE_RSH
 	bool "rsh"
@@ -33,10 +35,11 @@ config BR2_PACKAGE_RSH_REDONE_RSHD
 	depends on BR2_ENABLE_LOCALE && BR2_USE_WCHAR
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 
-comment "rshd needs a toolchain w/ wchar, locale, dynamic library"
+comment "rshd needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on !(BR2_ENABLE_LOCALE && BR2_USE_WCHAR) \
-		|| BR2_STATIC_LIBS
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 endif
diff --git a/package/shadow/Config.in b/package/shadow/Config.in
index e3580c2cf5..e85e5884d2 100644
--- a/package/shadow/Config.in
+++ b/package/shadow/Config.in
@@ -20,14 +20,16 @@ config BR2_PACKAGE_SHADOW_ACCOUNT_TOOLS_SETUID
 	depends on BR2_ENABLE_LOCALE  # linux-pam
 	depends on BR2_USE_WCHAR  # linux-pam
 	depends on !BR2_STATIC_LIBS  # linux-pam
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # linux-pam
 	select BR2_PACKAGE_LINUX_PAM
 	help
 	  Install the user and group management tools (e.g. groupadd)
 	  with setuid and authenticate the callers via PAM.
 
-comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, locale"
+comment "account-tools-setuid needs a toolchain w/ dynamic library, wchar, locale, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE
+	depends on BR2_STATIC_LIBS || !BR2_USE_WCHAR || \
+		!BR2_ENABLE_LOCALE || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_SHADOW_UTMPX
 	bool "utmpx"
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
