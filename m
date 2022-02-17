Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB40C433FE
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 13:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BED441E4A;
	Thu, 17 Feb 2022 13:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NXO840twtNL3; Thu, 17 Feb 2022 13:55:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B381D4027A;
	Thu, 17 Feb 2022 13:55:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70CBB1BF3C6
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FA7B83F4B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 13:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NjsW5YI_ppRX for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 13:55:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 241B283E2A
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:55:29 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso6246337wmj.2
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WqTCU55Xxaawr8+KocheqQDh80lc1EpW3+9m4UHOeAU=;
 b=Zi6bMbXqcc+YPfm3aO/PF07plUkQrtviluX1YlZ3n/DvzwDsiDxY/hbMVHFeCR3W/h
 89w1QlMhDLpzUQ2xnP1rlb/m7A6sM7gx3NzUGnkOhPI2Z62fFEF0qxge8D/RKIMlY4OW
 9p2XqoUOamKrKIl/g3A6Fo32qHwMIicAoiuOZ+4HVA03R3VoUCxwekV0bivH6HYHzshR
 eu/dgPEOs3s2TPaVdUfdjrRE447rd1v+8YOBt4O0I8znn9sbxFFxxGfhSuNL81Gcmyfj
 O/OKe8vIsJVtuIW97rlh3Gl1fcVDebE2anF+JiRQ8G4LnXTJNRjGjjOjiMjlMrOEDpN9
 yP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WqTCU55Xxaawr8+KocheqQDh80lc1EpW3+9m4UHOeAU=;
 b=Gg/mF4mYt9bkvSBx/ZgZ/oWAORgZi2sioRJr8tXCdbmIiUGRh5iqUVSMvGf/jge4md
 NY9F2MgjqsnF7SLMzg2mGusg99+fMJ6vdgt15o23BgJMvXhGp9aWINJRFgdcHgcEWlgI
 LvhIabXUFAftCNKRYZut8Bua9VQQIkldVxt2KHdBUzdPPe9kqN6G7oAlVTiA5Jmuu386
 IGuvPigNsOtrard3faupgYUN3+RJOgJq2gYi6ShBNh1/i09RtDVzxRpJoK/Xb4ZLGCjf
 cyYxokBdl83azJD88/+VOftRxqkpbWsNFpWap/Ij2dN7oxylE16SofIN67eaXnGBZznJ
 0SKQ==
X-Gm-Message-State: AOAM532DorPVlfMZziii+NsUUvtjAWxR/2Ws9XLFcEM31NrUOprzD4ej
 wreOInUyKyrjtDAsAX3ub1m6B+3Cyjo=
X-Google-Smtp-Source: ABdhPJxjd90znoaChL86CYiAFZCTAzPMmQUz+zxU34a115hvvFEgVvIz2anZlwrXMNi/BCE3kDTB0A==
X-Received: by 2002:a05:600c:4602:b0:37c:d11a:e892 with SMTP id
 m2-20020a05600c460200b0037cd11ae892mr2705592wmo.69.1645106126753; 
 Thu, 17 Feb 2022 05:55:26 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f14sm1590645wmq.3.2022.02.17.05.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 05:55:26 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 14:55:39 +0100
Message-Id: <20220217135539.3784058-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/safeclib: disable tests
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

Disable tests to avoid the following build failure raised since bump to
version 3.7.1 in commit cc27267ae41bf44276c63b1e86042c4fae4adf50 and
https://github.com/rurban/safeclib/commit/b90c52b1691fe82ce0a0681a503e1d45584f0162:

In file included from perf_memcpy32_s.c:7:
perf_private.h: In function 'rdtsc':
perf_private.h:72:3: error: 'asm' undeclared (first use in this function)
   72 |   asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
      |   ^~~

Fixes:
 - http://autobuild.buildroot.org/results/ceb13c071b1461eb6d73f5940d6b010095127f41

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Add-an-option-to-disable-tests.patch | 66 +++++++++++++++++++
 package/safeclib/safeclib.mk                  |  4 +-
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 package/safeclib/0001-Add-an-option-to-disable-tests.patch

diff --git a/package/safeclib/0001-Add-an-option-to-disable-tests.patch b/package/safeclib/0001-Add-an-option-to-disable-tests.patch
new file mode 100644
index 0000000000..420578fe2e
--- /dev/null
+++ b/package/safeclib/0001-Add-an-option-to-disable-tests.patch
@@ -0,0 +1,66 @@
+From 55b861a098434843f5614adcaab469defed95321 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 17 Feb 2022 14:36:51 +0100
+Subject: [PATCH] Add an option to disable tests
+
+Add an option to disable tests which are not always needed (e.g. on
+embedded systems) and can raise the following build failure on some
+architectures such as ARM cortex-a9:
+
+In file included from perf_memcpy32_s.c:7:
+perf_private.h: In function 'rdtsc':
+perf_private.h:72:3: error: 'asm' undeclared (first use in this function)
+   72 |   asm volatile("mrc p15, 0, %0, c9, c14, 0" : "=r"(pmuseren));
+      |   ^~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/ceb13c071b1461eb6d73f5940d6b010095127f41
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/rurban/safeclib/pull/115]
+---
+ Makefile.am  |  6 +++++-
+ configure.ac | 10 ++++++++++
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 429a84b2..7d14afb6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -34,7 +34,11 @@
+ ACLOCAL_AMFLAGS = -I m4 --install ${ACLOCAL_FLAGS}
+ 
+ # Sub-directories to preform recursive make in
+-SUBDIRS = src tests
++SUBDIRS = src
++
++if ENABLE_TESTS
++SUBDIRS += tests
++endif
+ 
+ # Library header files
+ pkginclude_HEADERS    = \
+diff --git a/configure.ac b/configure.ac
+index b7fd03e9..8c8fbee7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -360,6 +360,16 @@ AC_ARG_ENABLE(doc,
+ 	esac], [enable_doc=true])
+ AM_CONDITIONAL(ENABLE_DOC, test "x$enable_doc" = "xtrue")
+ 
++AC_ARG_ENABLE(tests,
++	AS_HELP_STRING([--disable-tests],
++	               [disable tests @<:@default=no@:>@]),
++	[case "${enableval}" in
++	yes) enable_tests=true ;;
++	no)  enable_tests=false ;;
++	*)   AC_MSG_ERROR([bad value ${enableval} for --enable-tests]) ;;
++	esac], [enable_tests=true])
++AM_CONDITIONAL(ENABLE_TESTS, test "x$enable_tests" = "xtrue")
++
+ dnl for windows dllimport. checking pic_flag DLL_EXPORT would be better,
+ dnl but this is only enabled for the shared objs, and we need it in the config
+ dnl for our tests.
+-- 
+2.34.1
+
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index bc58c1a38c..8f909f729b 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -11,9 +11,11 @@ SAFECLIB_SOURCE = safeclib-$(SAFECLIB_VERSION).tar.xz
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
+# We're patching configure.ac
+SAFECLIB_AUTORECONF = YES
 SAFECLIB_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=c99"
 # -fstack-protector-strong is used by default. Disable that so the
 # BR2_SSP_* options in the toolchain wrapper are used instead
-SAFECLIB_CONF_OPTS = --disable-hardening
+SAFECLIB_CONF_OPTS = --disable-hardening --disable-tests
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
