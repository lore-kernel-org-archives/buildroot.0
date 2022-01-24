Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386CAC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCF3681389;
	Mon, 24 Jan 2022 22:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJTHbu1jdo88; Mon, 24 Jan 2022 22:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C43FE813AB;
	Mon, 24 Jan 2022 22:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B330F1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A267C813AB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TcXQ_xU0u4Ji for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:18:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04FE181389
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:18:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id l25so16239618wrb.13
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sH35JMCRioabq4GrPjPguIwl/ryCVj5ElOddvGrEEuc=;
 b=SKxTQSZXmtc6qRmsfugRFiA08kOHLuaORLSf/J3l5oQk2I3g793QtVN5OVVkb2Bsy1
 hE82YIeuNUwqBz/O2bArbNJU9dJf/5TMYs2XbgjNQoGxafi23rWhRI02jV169Yh3Mh6d
 l8emcbdI0LnAhzyDZcNyZxvFFSD4EKoQBawbhdCO8yUyLq10OMlVdeWEWEh+fKQvFX3r
 fku46O4vZ/iprNDF/UnKCJSJrWv8JnvKc67zTpRmbIwTeVSLilLLsxIFCghLZBW/ftbq
 95QLPj0vGEUaQnQ1J1Ng0WLlyodbvIhR850X1h32j/A7FyHfP8AhFhBjHuxGV78TbCtI
 L2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sH35JMCRioabq4GrPjPguIwl/ryCVj5ElOddvGrEEuc=;
 b=cfR7bRr7Y4SJQLFduaoaD6d5+6yEV5deNCr/sq/litEOQFvdFJPfabptpdpNGog3MK
 5A0w+NViBD7QeFCRJyRHMQHinpcIWEgodaHHBl0v9DcQiuLaEqHsrBfRQdryTsK96bqy
 bzSh1/p6B3rBy4ggjwl73YD3cC7wrKWNbuq28VBgow8MJMXZBjdJkPeAMjNSrfgILkEb
 6mKU49qdJ0fgDAC2fPcDANa9IKZIKGN/nwag3J58bVbTpQJUzClE3Eautphfp+yZaBMW
 2t0CMFSQLKzChgZheG17nzT6BhPHvLpSO9Vd4ecwV41F+NjSwwgM0p4gfgn1/A6VF58D
 8+Cw==
X-Gm-Message-State: AOAM533XolhoGkDM6mstjSrJdGdUZL6a5cF9ZgD8c0SlSJle7+00bCfH
 vMQYpMddTG9levPiFfzijg4P0crUaFY=
X-Google-Smtp-Source: ABdhPJyY6CgJrdEuAkJclCf0+AKqhYeBMWMcMvaI0eL2zYBWRG6IOFVhFoDEpwV/3xc/GDI6+Fghug==
X-Received: by 2002:a05:6000:10d2:: with SMTP id
 b18mr15368730wrx.593.1643062718735; 
 Mon, 24 Jan 2022 14:18:38 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o12sm8664830wry.115.2022.01.24.14.18.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:18:38 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 23:16:57 +0100
Message-Id: <20220124221657.2629467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freeipmi: bump to version 1.6.9
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

Drop patches (already in version) and so autoreconf

https://github.com/chu11/freeipmi-mirror/blob/freeipmi-1-6-9/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeipmi/0001-fix-build-on-musl.patch | 49 ------------------
 .../0002-check-for-inb-and-outb.patch         | 50 -------------------
 ...ure.ac-use-pkg-config-to-find-gcrypt.patch | 50 -------------------
 package/freeipmi/freeipmi.hash                |  2 +-
 package/freeipmi/freeipmi.mk                  |  4 +-
 5 files changed, 2 insertions(+), 153 deletions(-)
 delete mode 100644 package/freeipmi/0001-fix-build-on-musl.patch
 delete mode 100644 package/freeipmi/0002-check-for-inb-and-outb.patch
 delete mode 100644 package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch

diff --git a/package/freeipmi/0001-fix-build-on-musl.patch b/package/freeipmi/0001-fix-build-on-musl.patch
deleted file mode 100644
index ff7425d221..0000000000
--- a/package/freeipmi/0001-fix-build-on-musl.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6295c96ae54cb16efe41e53f526a4dc19cd719f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Oct 2021 00:26:40 +0200
-Subject: [PATCH] fix build on musl
-
-musl doesn't provide getmsg or putmsg even if stropts.h is available
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/freeipmi.git/commit/?id=6295c96ae54cb16efe41e53f526a4dc19cd719f2]
----
- configure.ac                            | 1 +
- libfreeipmi/driver/ipmi-sunbmc-driver.c | 4 ++--
- 2 files changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 562dd624e..711b27674 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -479,6 +479,7 @@ AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
- AC_CHECK_FUNCS([iopl])
- AC_CHECK_FUNCS([asprintf])
- AC_CHECK_FUNCS([cbrt])
-+AC_CHECK_FUNCS([getmsg putmsg])
- 
- dnl sighandler_t apparently not defined in Apple/OS X
- AC_CHECK_TYPES([sighandler_t], [], [], [[#include <signal.h>]])
-diff --git a/libfreeipmi/driver/ipmi-sunbmc-driver.c b/libfreeipmi/driver/ipmi-sunbmc-driver.c
-index 05caca8b6..4ae8c5719 100644
---- a/libfreeipmi/driver/ipmi-sunbmc-driver.c
-+++ b/libfreeipmi/driver/ipmi-sunbmc-driver.c
-@@ -423,7 +423,7 @@ _sunbmc_write (ipmi_sunbmc_ctx_t ctx,
-   assert (ctx->io_init);
-   assert (ctx->putmsg_intf);
- 
--#if defined(HAVE_SYS_STROPTS_H)
-+#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_PUTMSG)
-   memset (&sbuf, '\0', sizeof (struct strbuf));
- 
-   /* Due to API differences, we need to extract the cmd out of the
-@@ -573,7 +573,7 @@ _sunbmc_read (ipmi_sunbmc_ctx_t ctx,
-       return (-1);
-     }
- 
--#if defined(HAVE_SYS_STROPTS_H)
-+#if defined(HAVE_SYS_STROPTS_H) && defined(HAVE_GETMSG)
-   if (getmsg (ctx->device_fd, NULL, &sbuf, &flags) < 0)
-     {
-       SUNBMC_ERRNO_TO_SUNBMC_ERRNUM (ctx, errno);
diff --git a/package/freeipmi/0002-check-for-inb-and-outb.patch b/package/freeipmi/0002-check-for-inb-and-outb.patch
deleted file mode 100644
index 3bc006acc7..0000000000
--- a/package/freeipmi/0002-check-for-inb-and-outb.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 47249279f3ef2c1fcfc312294f1c98c35232aed0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 2 Jan 2022 10:37:00 +0100
-Subject: [PATCH] check for inb and outb
-
-Check for inb and outb before using them to avoid the following build
-failure on uclibc-ng:
-
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: ../libfreeipmi/.libs/libfreeipmi.a(libfreeipmi_la-ipmi-kcs-driver.o): in function `_ipmi_kcs_test_if_state':
-/home/buildroot/autobuild/instance-1/output-1/build/freeipmi-1.6.8/libfreeipmi/driver/ipmi-kcs-driver.c:537: undefined reference to `inb'
-
-Fixes:
- - http://autobuild.buildroot.org/results/13f58266f7747c183033c811a4e8ca6fa30b6f4d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/50]
----
- configure.ac                         | 2 +-
- libfreeipmi/driver/ipmi-kcs-driver.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 711b27674..bcc4156ff 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -476,7 +476,7 @@ AC_CHECK_FUNCS([memcpy mempcpy memset mlock])
- AC_CHECK_FUNCS([getline getprogname])
- AC_CHECK_FUNCS([strerror strerror_r])
- AC_CHECK_FUNCS([flockfile fputs_unlocked fwrite_unlocked])
--AC_CHECK_FUNCS([iopl])
-+AC_CHECK_FUNCS([inb iopl outb])
- AC_CHECK_FUNCS([asprintf])
- AC_CHECK_FUNCS([cbrt])
- AC_CHECK_FUNCS([getmsg putmsg])
-diff --git a/libfreeipmi/driver/ipmi-kcs-driver.c b/libfreeipmi/driver/ipmi-kcs-driver.c
-index c212887c0..a9d4b2e96 100644
---- a/libfreeipmi/driver/ipmi-kcs-driver.c
-+++ b/libfreeipmi/driver/ipmi-kcs-driver.c
-@@ -162,7 +162,7 @@
- #if defined(__FreeBSD__) || defined(__NetBSD__) || defined(__OpenBSD__)
- # define _INB(port)  inb (port)
- # define _OUTB(data, port)  outb (port, data)
--#elif defined(HAVE_IOPL)
-+#elif defined(HAVE_INB) && defined(HAVE_OUTB)
- # define _INB(port)  inb (port)
- # define _OUTB(data, port)  outb (data, port)
- #else
--- 
-2.33.0
-
diff --git a/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch b/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch
deleted file mode 100644
index 6db6c2ae3b..0000000000
--- a/package/freeipmi/0003-configure.ac-use-pkg-config-to-find-gcrypt.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 727291789fa1930a3e5aa04a25e954cfa6e615d6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 15 Jan 2022 16:27:44 +0100
-Subject: [PATCH] configure.ac: use pkg-config to find gcrypt
-
-Use pkg-config to find gcrypt and avoid the following static build
-failure:
-
-configure:13642: checking for gcry_md_open in -lgcrypt
-configure:13665: /home/buildroot/autobuild/instance-1/output-1/host/bin/x86_64-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c -lgcrypt   >&5
-/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-buildroot-linux-musl/10.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/lib/../lib64/libgcrypt.a(libgcrypt_la-visibility.o): in function `gcry_err_make_from_errno':
-visibility.c:(.text+0x29): undefined reference to `gpg_err_code_from_errno'
-
-Fixes:
- - http://autobuild.buildroot.org/results/5354f7231cf08bf762e7d86fca874ce63d9a116b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/chu11/freeipmi-mirror/pull/52]
----
- configure.ac | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bcc4156ff..531e10b8d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -405,7 +405,11 @@ fi
- dnl Checks for libraries.
- dnl don\'t include lib if LAN not desired
- if test x"${ac_with_encryption}" = xyes; then
--  AC_CHECK_LIB([gcrypt], [gcry_md_open], [have_gcrypt=yes], [have_gcrypt=no])
-+  PKG_CHECK_MODULES([GCRYPT], [libgcrypt], [have_gcrypt=yes], [
-+     AC_CHECK_LIB([gcrypt], [gcry_md_open],
-+        [have_gcrypt=yes GCRYPT_LIBS=-lgcrypt],
-+        [have_gcrypt=no])
-+  ])
-   if test "x${have_gcrypt}" = "xno"; then
-      AC_MSG_ERROR([libgcrypt required to build libfreeipmi])
-      AC_MSG_NOTICE([Note: libgpg-error required for libgcrypt])
-@@ -421,7 +425,6 @@ if test x"${ac_with_encryption}" = xyes; then
-   if test "x${have_gcrypt_threads}" = "xno"; then
-      AC_MSG_ERROR([libgcrypt with threads support required for libfreeipmi])
-   fi
--  GCRYPT_LIBS=-lgcrypt
- fi
- AC_SUBST(GCRYPT_LIBS)
- 
--- 
-2.34.1
-
diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index f73b4a25fe..05fb50bd4c 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  4aa46a269ecc1bbff9412451f17b5408f64395e7dc45b713edf5eb5362700a71  freeipmi-1.6.8.tar.gz
+sha256  f25e1c35f3d0f1b5a99cc31ecc2353ca83ed46a15163842fba870127dc9c8206  freeipmi-1.6.9.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index b25ef0a4c6..9fb59245b9 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.8
+FREEIPMI_VERSION = 1.6.9
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
@@ -14,8 +14,6 @@ FREEIPMI_LICENSE_FILES = \
 	COPYING.sunbmc COPYING.ZRESEARCH
 FREEIPMI_DEPENDENCIES = host-pkgconf
 FREEIPMI_INSTALL_STAGING = YES
-# We're patching configure.ac
-FREEIPMI_AUTORECONF = YES
 # Disable checking for /dev/urandom and /dev/random through AC_CHECK_FILE
 FREEIPMI_CONF_OPTS = --without-random-device
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
