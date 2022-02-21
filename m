Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78124C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 22:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 210C5408DF;
	Mon, 21 Feb 2022 22:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZlmA5y1PvzB; Mon, 21 Feb 2022 22:00:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FEA3408D7;
	Mon, 21 Feb 2022 22:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5EF1BF3AB
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 252174058C
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 22:00:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlmo78HTeiPI for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 22:00:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74C5F400D6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 22:00:34 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d27so29357173wrb.5
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 14:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To0kC9R44Lgi8oFq2eFTSlx0B+8+cIiYVz5E68+1PVw=;
 b=q3fLfbEEV107TtIO5YtrKf9UKlAcez66vYw6AelqfDZIdgSTh0HgQGm/hqM329cZTZ
 M3LLiQJlz9bgoSVN+8luoOcRKTo4zdWZkCpTvD+ZqzPhyFNU6sS9pgzvETB6B99cVLZ1
 SJWfZNfD+lrveYd5M5MWEzKltOnt7vdDCWlA1Bm31ZtlKGikAWQGgbukO7eBvnyK86aX
 fESNXNPGiDBCxbLi8P33hhBFSC3iGbO2b0fyfUL5d9oTsJ3QBpnkt8yTDID5a4xjSEEj
 lnrtTglUe4VD6sE57LitwAxZEfGmtDq1dV9JJIVTgwxoQYDhjz0MQ+/7zXaWpUGDJniy
 9ELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=To0kC9R44Lgi8oFq2eFTSlx0B+8+cIiYVz5E68+1PVw=;
 b=Ne32YxheNLhn7AKkl+3sbTe841gMilC26s7a2BB55eSoaTjRfNJTWAQSvKhWRrdtcO
 AItz3tQzeeer16TkLBeQcX5kQFhsol3eYz7A7/9/ga/plyg6PNZrttJkohHFligKPN7U
 iyWuWUreMR/3AWkPlWjnrxRG32lTIm8bv2SONSaFUekTxc+IYJ5zEP3Iqz25S9D7vjUT
 CCwQrBg7hLb0L0VjORXhU5hjLoTNsTWgy5EZhAS60lh35SKBNTLrSK5hkDSEwpY8/a/N
 OwzPkEx6ByA2e1jhtN1+iw7H+gc9bNCz5bmLqy9xcF0BuH6ELEFKXOi3Jbi7PdJT9jcF
 1CAw==
X-Gm-Message-State: AOAM532NAXIk2ctHa9PDLkCJG1+GqTP8R3ojYX00+2aZ/hD3qsI4lHUu
 Gt1hnKTGQ253Y9G2VdduIgZiNP67cfI=
X-Google-Smtp-Source: ABdhPJyQYWkhwvfwqUXMq5TnAcZziZyQarBoRXH98YVt+5j5pUqho/ATC/ntu8MlLRB+67KvO7eL0A==
X-Received: by 2002:a5d:49c5:0:b0:1e0:8842:aebe with SMTP id
 t5-20020a5d49c5000000b001e08842aebemr17766048wrs.337.1645480832256; 
 Mon, 21 Feb 2022 14:00:32 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f21-20020a7bcd15000000b0037bf83d99a2sm548899wmj.1.2022.02.21.14.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 14:00:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 23:00:25 +0100
Message-Id: <20220221220025.2198034-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/flac: security bump to version 1.3.4
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release mostly fixes (security related) bugs including:
 - Fix 12 decoder bugs found by oss-fuzz, including CVE-2020-0499
 - Fix encoder bug CVE-2021-0561

Also:
 - Replace first patch which was reverted by
   https://github.com/xiph/flac/commit/4fbb6d4f2ecf2a96c17ea9880108409f852c08a9
 - Disable stack protection (enabled by default since
   https://github.com/xiph/flac/commit/f706f2832270a0b7851cdffe62ad37acda9423fe)
 - Drop md5 which is not provided anymore
 - Update indentation in hash file (two spaces)

https://github.com/xiph/flac/releases/tag/1.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin and Peter Seiderer):
 - Add upstream patch

 package/flac/0001-Fix-uclibc-build.patch      | 81 +++++++++++++++++++
 ...ck-for-sys-auxv.h-before-defining-FL.patch | 36 ---------
 package/flac/flac.hash                        | 12 ++-
 package/flac/flac.mk                          |  5 +-
 4 files changed, 89 insertions(+), 45 deletions(-)
 create mode 100644 package/flac/0001-Fix-uclibc-build.patch
 delete mode 100644 package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch

diff --git a/package/flac/0001-Fix-uclibc-build.patch b/package/flac/0001-Fix-uclibc-build.patch
new file mode 100644
index 0000000000..fcba670fae
--- /dev/null
+++ b/package/flac/0001-Fix-uclibc-build.patch
@@ -0,0 +1,81 @@
+From 4c62082f64132bfcbcb6569aa914c5ec283303f9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 21 Feb 2022 18:21:11 +0100
+Subject: [PATCH] Fix uclibc build
+
+Commit 4fbb6d4f2ecf2a96c17ea9880108409f852c08a9 reverted commit
+44036c9a9b45d03373fe90e9c112852bfc054c51 and so broke again the build on
+uclibc
+
+So put back the sys/auxv.h check as well as a getauxval check in a way
+that doesn't break iOS
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/xiph/flac/pull/292]
+---
+ configure.ac      | 5 ++++-
+ src/libFLAC/cpu.c | 9 ++++-----
+ 2 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4d7dc2e4..6f32fa45 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,7 +69,7 @@ AC_C_INLINE
+ AC_C_VARARRAYS
+ AC_C_TYPEOF
+ 
+-AC_CHECK_HEADERS([stdint.h inttypes.h byteswap.h sys/param.h sys/ioctl.h termios.h x86intrin.h cpuid.h])
++AC_CHECK_HEADERS([stdint.h inttypes.h byteswap.h sys/auxv.h sys/param.h sys/ioctl.h termios.h x86intrin.h cpuid.h])
+ 
+ XIPH_C_BSWAP32
+ XIPH_C_BSWAP16
+@@ -101,6 +101,9 @@ fi
+ # For the XMMS plugin.
+ AC_CHECK_TYPES(socklen_t, [], [])
+ 
++dnl check for getauxval in standard library
++AC_CHECK_FUNCS(getauxval)
++
+ dnl check for getopt in standard library
+ dnl AC_CHECK_FUNCS(getopt_long , , [LIBOBJS="$LIBOBJS getopt.o getopt1.o"] )
+ AC_CHECK_FUNCS(getopt_long, [], [])
+diff --git a/src/libFLAC/cpu.c b/src/libFLAC/cpu.c
+index 8b92f4c7..64c6acad 100644
+--- a/src/libFLAC/cpu.c
++++ b/src/libFLAC/cpu.c
+@@ -53,11 +53,9 @@
+ #define dfprintf(file, format, ...)
+ #endif
+ 
+-#if defined FLAC__CPU_PPC
+-#if defined(__linux__) || (defined(__FreeBSD__) && (__FreeBSD__ >= 12))
++#if defined(HAVE_SYS_AUXV_H)
+ #include <sys/auxv.h>
+ #endif
+-#endif
+ 
+ #if (defined FLAC__CPU_IA32 || defined FLAC__CPU_X86_64) && (defined FLAC__HAS_NASM || FLAC__HAS_X86INTRIN) && !defined FLAC__NO_ASM
+ 
+@@ -247,7 +245,7 @@ ppc_cpu_info (FLAC__CPUInfo *info)
+ #define PPC_FEATURE2_ARCH_2_07		0x80000000
+ #endif
+ 
+-#ifdef __linux__
++#if defined (__linux__) && defined(HAVE_GETAUXVAL)
+ 	if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_3_00) {
+ 		info->ppc.arch_3_00 = true;
+ 	} else if (getauxval(AT_HWCAP2) & PPC_FEATURE2_ARCH_2_07) {
+@@ -267,7 +265,8 @@ ppc_cpu_info (FLAC__CPUInfo *info)
+ 	info->ppc.arch_2_07 = false;
+ 	info->ppc.arch_3_00 = false;
+ #else
+-#error Unsupported platform! Please add support for reading ppc hwcaps.
++	info->ppc.arch_2_07 = false;
++	info->ppc.arch_3_00 = false;
+ #endif
+ 
+ #else
+-- 
+2.34.1
+
diff --git a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch b/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
deleted file mode 100644
index d1398d4b3e..0000000000
--- a/package/flac/0001-configure.ac-check-for-sys-auxv.h-before-defining-FL.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 14a0713389fbfef59225d027ea466ebb478a8c6b Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Thu, 19 Sep 2019 21:18:04 +0200
-Subject: [PATCH] configure.ac: check for sys/auxv.h before defining FLAC__CPU_PPC
-
-Upstream: https://github.com/xiph/flac/pull/142
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0228a12..64cb3f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -144,7 +144,7 @@ case "$host_cpu" in
- 	powerpc64|powerpc64le)
- 		cpu_ppc64=true
- 		cpu_ppc=true
--		AC_DEFINE(FLAC__CPU_PPC)
-+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
- 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
- 		AC_DEFINE(FLAC__CPU_PPC64)
- 		AH_TEMPLATE(FLAC__CPU_PPC64, [define if building for PowerPC64])
-@@ -152,7 +152,7 @@ case "$host_cpu" in
- 		;;
- 	powerpc|powerpcle)
- 		cpu_ppc=true
--		AC_DEFINE(FLAC__CPU_PPC)
-+		AC_CHECK_HEADER(sys/auxv.h, AC_DEFINE(FLAC__CPU_PPC))
- 		AH_TEMPLATE(FLAC__CPU_PPC, [define if building for PowerPC])
- 		asm_optimisation=$asm_opt
- 		;;
---
-2.23.0
-
diff --git a/package/flac/flac.hash b/package/flac/flac.hash
index df7c2d1b95..2444535e0f 100644
--- a/package/flac/flac.hash
+++ b/package/flac/flac.hash
@@ -1,10 +1,8 @@
-# From https://ftp.osuosl.org/pub/xiph/releases/flac/MD5SUMS
-md5 26703ed2858c1fc9ffc05136d13daa69  flac-1.3.3.tar.xz
 # From https://ftp.osuosl.org/pub/xiph/releases/flac/SHA1SUMS
-sha1 6ac2e8f1dd18c9b0214c4d81bd70cdc1e943cffe  flac-1.3.3.tar.xz
+sha1  99c28482a8b2d81deaf740639e4cb55658427420  flac-1.3.4.tar.xz
 # From http://downloads.xiph.org/releases/flac/SHA256SUMS.txt
-sha256 213e82bd716c9de6db2f98bcadbc4c24c7e2efe8c75939a1a84e28539c4e1748  flac-1.3.3.tar.xz
+sha256  8ff0607e75a322dd7cd6ec48f4f225471404ae2730d0ea945127b1355155e737  flac-1.3.4.tar.xz
 # Locally computed
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
-sha256 5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
-sha256 fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL
+sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LGPL
+sha256  fa27cb11f13f97b0c5f3ff363b1e2610c6efe87ed175779cb2a78e44eb19d34c  COPYING.Xiph
diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 9aa00b7ffd..2ff048b6e6 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLAC_VERSION = 1.3.3
+FLAC_VERSION = 1.3.4
 FLAC_SITE = http://downloads.xiph.org/releases/flac
 FLAC_SOURCE = flac-$(FLAC_VERSION).tar.xz
 FLAC_INSTALL_STAGING = YES
@@ -19,7 +19,8 @@ FLAC_AUTORECONF = YES
 FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
-	--disable-altivec
+	--disable-altivec \
+	--disable-stack-smash-protection
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
