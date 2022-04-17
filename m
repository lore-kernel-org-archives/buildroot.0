Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465D5C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 20:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE8C40FDC;
	Sun, 17 Apr 2022 20:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ElZv1EShckQ; Sun, 17 Apr 2022 20:29:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6D2940FD8;
	Sun, 17 Apr 2022 20:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 94B481BF3AE
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 20:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 751A9610B6
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 20:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ixshpgEcDEBF for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 20:29:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 458A860807
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 20:29:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w4so16520747wrg.12
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 13:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PC5pD1W86Q7pTeZkXHPLf/DN+l7QWQUXf2lcotv9Ia8=;
 b=ILPpbP1c7nwKaWAW6+orXlzO3O1ofmoYORfUCSSeKEMQriOiXCGQJDoT9MsU+wFaKw
 WGClkv5wZGQeksv7rL3f3xSYJ6msQyJSYvpZzE5FFznNSUGnONVjbgxPyjxtoBx0ekHZ
 X6xhbvygjpL+Lconv2XTK1trCfRpYXbRI6F7JnJbCa85EB3hFI/xUXFit+eu3X1z/z0q
 h/ercQuUDfxe4XXC9x7dN+4xXZohbt+RJjnwxNRWW5B1qOehMGEZkVlHO5aeaeVGcvCp
 fKzYvW1Mif0O+foGmmNTJrer1fj7fdoEoqyPYVg/w/78RTSEAQep+G61CV/G6ydfkXa2
 c00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PC5pD1W86Q7pTeZkXHPLf/DN+l7QWQUXf2lcotv9Ia8=;
 b=rscPqWHIFt/wHHrCuTBj1wWsN5mZ+WebTUEUhO3+LmcrD+FPkN6A2fr8nJoxHoPWQO
 n3qXyerb2OHTByw401FEdB1vBbFy6BdW6eQnwaD0o79Di+XAH+JGE3H1fwDAD6IP4BIR
 R+CIawuEIxD5IdEa+vXg+9qpwGbb01E0smwQCvj10woGlYCicTtIDnGQv4IygG8olYs5
 SZz3aCTVhsXvKdIFo2Y/xRBqGoUCJfHskEK/VZ8MEtpsEkK8USW5h0aUzCvQ9n3jDpLR
 g8IsvxtpmrKIWW47eye6lB1a0xpCo0qpXlLUkzfsnd3xXFxZXUEboZHZYAehMw8AcW7x
 mncQ==
X-Gm-Message-State: AOAM532yd3kfA8ne0b8zkAx3dljsx9sWbuSMDkqL9RH+RyFJ7O3Wvkvc
 4xWOVljc8ff5ITwetQTyCnRZWKrEGZg=
X-Google-Smtp-Source: ABdhPJyeEZ7febXMtipZMoLyOohxrtldBFYr8sEU7++JsmBsSyUI56x/lGyW9oq3K7TM/zySGtPYYQ==
X-Received: by 2002:a05:6000:1786:b0:20a:873b:24e5 with SMTP id
 e6-20020a056000178600b0020a873b24e5mr5798834wrg.427.1650227388928; 
 Sun, 17 Apr 2022 13:29:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a05600c354d00b003928fd158a4sm3878326wmq.29.2022.04.17.13.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 13:29:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Apr 2022 22:27:46 +0200
Message-Id: <20220417202746.110249-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/glorytun: fix aarch64 build with
 uclibc
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
Cc: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following aarch64 build failure with uclibc:

mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
   51 | #include <sys/auxv.h>
      |          ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-support-for-Apple-silicon.patch  | 51 +++++++++++++++++++
 ...s256.c-fix-aarch64-build-with-uclibc.patch | 43 ++++++++++++++++
 2 files changed, 94 insertions(+)
 create mode 100644 package/glorytun/0001-Add-support-for-Apple-silicon.patch
 create mode 100644 package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch

diff --git a/package/glorytun/0001-Add-support-for-Apple-silicon.patch b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
new file mode 100644
index 0000000000..6d4b8273f3
--- /dev/null
+++ b/package/glorytun/0001-Add-support-for-Apple-silicon.patch
@@ -0,0 +1,51 @@
+From 577ae0352d191fa604f861ea2f0847e7c5eda617 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Wed, 1 Jul 2020 22:51:43 +0200
+Subject: [PATCH] Add support for Apple silicon
+
+[Retrieved from:
+https://github.com/angt/aegis256/commit/577ae0352d191fa604f861ea2f0847e7c5eda617]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ aegis256.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
+index 9a580bf..75a772c 100644
+--- a/mud/aegis256/aegis256.c
++++ b/mud/aegis256/aegis256.c
+@@ -36,7 +36,7 @@ typedef __m128i       x128;
+ #define store128(X,Y) _mm_storeu_si128((x128 *)(X), (Y))
+ #define set2x64(X,Y)  _mm_set_epi64x((long long)(X), (long long)(Y))
+ 
+-#elif defined(__linux__) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
++#elif (defined(__APPLE__) || defined(__linux__)) && (defined(__ARM_NEON_FP) || defined(__aarch64__))
+ 
+ #ifdef __clang__
+ #pragma clang attribute push (__attribute__((target("crypto"))),apply_to=function)
+@@ -48,7 +48,9 @@ typedef __m128i       x128;
+ #endif
+ 
+ #ifdef __ARM_FEATURE_CRYPTO
++#ifdef __linux__
+ #include <sys/auxv.h>
++#endif
+ #include <arm_neon.h>
+ 
+ typedef uint8x16_t    x128;
+@@ -62,11 +64,15 @@ typedef uint8x16_t    x128;
+ int
+ aegis256_is_available(void)
+ {
++#ifdef __linux__
+     return (getauxval(AT_HWCAP) & HWCAP_AES)
+ #ifdef HWCAP2_AES
+         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
+ #endif
+         ;
++#else // __APPLE__
++    return 1;
++#endif
+ }
+ 
+ #endif // __ARM_FEATURE_CRYPTO
diff --git a/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
new file mode 100644
index 0000000000..37ae8a3301
--- /dev/null
+++ b/package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch
@@ -0,0 +1,43 @@
+From eb22e270a962d4a2da1972304fd8b1216211c9d1 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 16 Apr 2022 23:32:55 +0200
+Subject: [PATCH] aegis256.c: fix aarch64 build with uclibc
+
+Fix the following aarch64 build failure with uclibc:
+
+mud/aegis256/aegis256.c:51:10: fatal error: sys/auxv.h: No such file or directory
+   51 | #include <sys/auxv.h>
+      |          ^~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/4e1bbd72b9b7e0f9963f6693c3d7bc9a1d24fab4
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/angt/aegis256/commit/eb22e270a962d4a2da1972304fd8b1216211c9d1]
+---
+ aegis256.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mud/aegis256/aegis256.c b/mud/aegis256/aegis256.c
+index 75a772c..4e73fab 100644
+--- a/mud/aegis256/aegis256.c
++++ b/mud/aegis256/aegis256.c
+@@ -48,7 +48,7 @@ typedef __m128i       x128;
+ #endif
+ 
+ #ifdef __ARM_FEATURE_CRYPTO
+-#ifdef __linux__
++#if defined(__linux__) && __has_include("sys/auxv.h")
+ #include <sys/auxv.h>
+ #endif
+ #include <arm_neon.h>
+@@ -64,7 +64,7 @@ typedef uint8x16_t    x128;
+ int
+ aegis256_is_available(void)
+ {
+-#ifdef __linux__
++#if defined(__linux__) && __has_include("sys/auxv.h")
+     return (getauxval(AT_HWCAP) & HWCAP_AES)
+ #ifdef HWCAP2_AES
+         || (getauxval(AT_HWCAP2) & HWCAP2_AES)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
