Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D31C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BAC3402EA;
	Sat, 15 Jan 2022 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HIfyLOOnpsTo; Sat, 15 Jan 2022 16:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 273764031F;
	Sat, 15 Jan 2022 16:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3E91BF424
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 647F24018B
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhmf8rOF0TqB for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:23:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 334F140004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:23:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id k5so2745030wmj.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/fIqK1ymXkUEwtancuY4RiRorcpdhFdiflkBIE+Emxk=;
 b=ZJwnxi5coqLkSzaKYvdaOXndDYdHufMyfk4oQN2qosAhnaZcRdL5994cuLcRzK5PaL
 pqhUAGoGeIkF0RAAAn1d2AaSISUuskk06pUpA4ztoOJP6kAr/fCui84xhSrpepDEMp4l
 cUK+yLUAO2/VBVqY48Ut1AL3RB+EWLmJ/+oLf43yHY39c0ZggLZ3HL7LxO/1vPe3pU/M
 Tc4uqyWZfUXfWFFI/zKU5GFe+jiVBk5Jn8ezq6aJKUXkJav/3T4VipgXhBOS/AIsE02O
 FLNWqNXFBhl3ZdAwdWWuZ5S6HAuDcwOoS5ygAaa6FxbiErQ5LXZK3wz0GXSJVIGnm5Qm
 ccnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/fIqK1ymXkUEwtancuY4RiRorcpdhFdiflkBIE+Emxk=;
 b=vTQZwW5SRNA5eYV+fUlzbypq9rvOm1xrqdxFLVGIiVtY/sTA15dVoraTucz8nUGWXg
 nZrFRuDEfZrIiI6XD3yNBpYdWcEtrIKKPFXckmN3rC0De+zPQH+E5grDgJb7wzNi/uX6
 Qnis8vz+PlQzz68sNlnh3QymMdRrJy50Ebkezi8uMkGpF/WepPS99889xRKnWZ4kL7vK
 4D81+deMv+lgOIenn+MI5hWfg1g1U4U62Bl1moBsf157GTg4WLOHnSosyYn+mqCDTc98
 L5s8i0BqjBwpRXDCdId//dSh91p8Dze/fUkKoebLVKv+/OlhRU0Ww/fPoSfAC854ee8h
 fpYg==
X-Gm-Message-State: AOAM5320Mmk20S48h0aWTuke1N6vvTwiMYsyOF3dTIVRPEW5heNz134W
 rqZHK+n4ghIbSNAJCZ/ZweGOvqMpr1A=
X-Google-Smtp-Source: ABdhPJxqOwDTwHyRjuctXELeebhPfPPJMJIPHLtPmsaL/7v78X1GiOGVksrtVo6nSE2OkJtPZwUvsw==
X-Received: by 2002:a1c:e909:: with SMTP id q9mr12430048wmc.184.1642263797321; 
 Sat, 15 Jan 2022 08:23:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id q10sm11355325wmq.10.2022.01.15.08.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 08:23:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 17:21:42 +0100
Message-Id: <20220115162142.2300207-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpdecimal: bump to version 2.5.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version) and so autoreconf

https://www.bytereef.org/mpdecimal/changelog.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ort-for-enable-disable-shared-static.patch | 147 ------------------
 package/mpdecimal/mpdecimal.hash              |   2 +-
 package/mpdecimal/mpdecimal.mk                |   3 +-
 3 files changed, 2 insertions(+), 150 deletions(-)
 delete mode 100644 package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch

diff --git a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch b/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
deleted file mode 100644
index 60d6b4bb02..0000000000
--- a/package/mpdecimal/0001-Add-minimal-support-for-enable-disable-shared-static.patch
+++ /dev/null
@@ -1,147 +0,0 @@
-From c349964887901848fb4cd5db53a5bcb6dae27aaa Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sun, 23 Nov 2014 10:16:33 +0100
-Subject: [PATCH] Add minimal support for --{enable,disable}-{shared,static}
-
-mpdecimal uses autoconf, but not automake or libtool, so this commit
-adds some basic handling of --{enable,disable}-{shared,static}, so
-that building the shared library can be disabled in pure static
-library contexts.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[Fabrice: update for 2.5.0 (add libmpdec++)]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.in          |  6 ++++++
- configure.ac         | 13 +++++++++++++
- libmpdec/Makefile.in | 11 ++++++++++-
- 3 files changed, 29 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 2c91891..0c44f36 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -9,6 +9,8 @@ LIBSTATIC = @LIBSTATIC@
- LIBSONAME = @LIBSONAME@
- LIBSHARED = @LIBSHARED@
- INSTALL = @INSTALL@
-+BUILD_SHARED = @BUILD_SHARED@
-+BUILD_STATIC = @BUILD_STATIC@
- 
- prefix = @prefix@
- exec_prefix = @exec_prefix@
-@@ -32,9 +34,13 @@ install: FORCE
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
- 	$(INSTALL) -m 644 libmpdec/mpdecimal.h $(DESTDIR)$(includedir)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
-+ifeq ($(BUILD_STATIC),yes)
- 	$(INSTALL) -m 644 libmpdec/$(LIBSTATIC) $(DESTDIR)$(libdir)
-+endif
-+ifeq ($(BUILD_SHARED),yes)
- 	$(INSTALL) -m 755 libmpdec/$(LIBSHARED) $(DESTDIR)$(libdir)
- 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED) $(LIBSONAME) && ln -sf $(LIBSHARED) $(LIBNAME)
-+endif
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(docdir)
- 	cp -R doc/* $(DESTDIR)$(docdir)
- 
-@@ -74,9 +80,13 @@ install_libcxx: install_lib
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(includedir)
- 	$(INSTALL) -m 644 libmpdec++/decimal.hh $(DESTDIR)$(includedir)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(libdir)
-+ifeq ($(BUILD_STATIC),yes)
- 	$(INSTALL) -m 644 libmpdec++/$(LIBSTATIC_CXX) $(DESTDIR)$(libdir)
-+endif
-+ifeq ($(BUILD_SHARED),yes)
- 	$(INSTALL) -m 755 libmpdec++/$(LIBSHARED_CXX) $(DESTDIR)$(libdir)
- 	cd $(DESTDIR)$(libdir) && ln -sf $(LIBSHARED_CXX) $(LIBSONAME_CXX) && ln -sf $(LIBSHARED_CXX) $(LIBNAME_CXX)
-+endif
- 	cp -R doc/libmpdec++ $(DESTDIR)$(docdir)
- 
- 
-diff --git a/configure.ac b/configure.ac
-index 7ee8f86..2b3e505 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -88,6 +88,19 @@ CFLAGS="$saved_cflags"
- AC_PROG_INSTALL
- AC_SUBST(INSTALL)
- 
-+AC_ARG_ENABLE([shared],
-+	[AS_HELP_STRING([--enable-shared], [build shared library])],
-+	[BUILD_SHARED=$enableval],
-+	[BUILD_SHARED=yes])
-+
-+AC_ARG_ENABLE([static],
-+	[AS_HELP_STRING([--enable-static], [build static library])],
-+	[BUILD_STATIC=$enableval],
-+	[BUILD_STATIC=yes])
-+
-+AC_SUBST(BUILD_SHARED)
-+AC_SUBST(BUILD_STATIC)
-+
- # _FORTIFY_SOURCE wrappers for memmove and bcopy are incorrect:
- # http://sourceware.org/ml/libc-alpha/2010-12/msg00009.html
- AC_MSG_CHECKING(for glibc _FORTIFY_SOURCE/memmove bug)
-diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
-index d9619a3..985c73c 100644
---- a/libmpdec/Makefile.in
-+++ b/libmpdec/Makefile.in
-@@ -7,6 +7,8 @@
- LIBSTATIC = @LIBSTATIC@
- LIBSONAME = @LIBSONAME@
- LIBSHARED = @LIBSHARED@
-+BUILD_SHARED = @BUILD_SHARED@
-+BUILD_STATIC = @BUILD_STATIC@
- 
- CC = @CC@
- LD = @LD@
-@@ -32,8 +34,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
-   MPD_LDFLAGS += $(MPD_PUSE)
- endif
- 
-+ifeq ($(BUILD_SHARED),yes)
-+TARGETS += $(LIBSHARED)
-+endif
-+
-+ifeq ($(BUILD_STATIC),yes)
-+TARGETS += $(LIBSTATIC)
-+endif
- 
--default: $(LIBSTATIC) $(LIBSHARED)
-+default: $(TARGETS)
- 
- 
- OBJS := basearith.o context.o constants.o convolute.o crt.o mpdecimal.o \
-diff --git a/libmpdec/Makefile.in b/libmpdec/Makefile.in
-index d9619a3..985c73c 100644
---- a/libmpdec++/Makefile.in
-+++ b/libmpdec++/Makefile.in
-@@ -13,6 +13,8 @@ LIBSTATIC_CXX = @LIBSTATIC_CXX@
- LIBNAME_CXX = @LIBNAME_CXX@
- LIBSONAME_CXX = @LIBSONAME_CXX@
- LIBSHARED_CXX = @LIBSHARED_CXX@
-+BUILD_SHARED = @BUILD_SHARED@
-+BUILD_STATIC = @BUILD_STATIC@
- 
- CXX = @CXX@
- LDXX = @LDXX@
-@@ -39,8 +41,15 @@ ifeq ($(MAKECMDGOALS), profile_use)
-   MPD_LDXXFLAGS += $(MPD_PUSE)
- endif
- 
-+ifeq ($(BUILD_SHARED),yes)
-+TARGETS += $(LIBSHARED_CXX)
-+endif
-+
-+ifeq ($(BUILD_STATIC),yes)
-+TARGETS += $(LIBSTATIC_CXX)
-+endif
- 
--default: $(LIBSTATIC_CXX) $(LIBSHARED_CXX)
-+default: $(TARGETS)
- 
- 
- OBJS := decimal.o
--- 
-2.1.0
-
diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index c931ee4a6d..81150c7575 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  15417edc8e12a57d1d9d75fa7e3f22b158a3b98f44db9d694cfd2acde8dfa0ca  mpdecimal-2.5.0.tar.gz
+sha256  9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  mpdecimal-2.5.1.tar.gz
 # Locally computed
 sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index fa310a2274..25c12c08b1 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,12 +5,11 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.5.0
+MPDECIMAL_VERSION = 2.5.1
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
 MPDECIMAL_CONF_OPTS = LD="$(TARGET_CC)"
-MPDECIMAL_AUTORECONF = YES
 
 # On i386, by default, mpdecimal tries to uses <fenv.h> which is not
 # available in musl/uclibc. So in this case, we tell mpdecimal to use
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
