Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C45DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 07:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6364401E4;
	Thu, 25 Nov 2021 07:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2pUGDC_OZhTl; Thu, 25 Nov 2021 07:28:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C4740236;
	Thu, 25 Nov 2021 07:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F17EF1BF36C
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 07:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0EBD607B2
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 07:28:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiHNGvqSCvaz for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 07:28:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 52F60606CA
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 07:28:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id a9so9493160wrr.8
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 23:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUDeTYAxMoh3XL8BpCkGFn6VMTJniygxGq6LnaGrlPU=;
 b=ea8dgI59mYpX+mYuWsAjQMS6FHLlEdtgPKaMy4MWos1GibVLoy5iVTwBPaCLHIKtF+
 4mnzQhgjKSE7D4hkM6QnAsxLOWz8hsRiofnuEU3e2CqS3l0X6dJYNKXktrKnHnUf96pi
 ZTET9/W0v8K1Hx/u844idK+j5id4KJwcVvLUNBjYZGQHWVnrldwCnK0cVNMBlbnACC6w
 THYhuwn5UcA6ynf99+5l6IUJg81pOGqDewvgSDSggdmeltpHgp2dUySaLAuMVFFfX84l
 xATDckcPDpNy3fLNwiYrLMxulObz90LHp++TeZwqeFfZCJkBo0GPWCGdVrtPISaOfftp
 Dq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZUDeTYAxMoh3XL8BpCkGFn6VMTJniygxGq6LnaGrlPU=;
 b=B6wZ3Ghv/fN/WyDeKD0r/3gNZCQ8QEd3KD6Mqbr2e6lQP67AmGWePf1ULivO4s7ORw
 68XWNny8IXfbwn/GTqINZ+qGKNI1+ZOe1pX2ysiT2Cw5B3lETz4UY65IePWQRrE5XSna
 N/+Uyw4jG+/o1mtCBVrXkrmubBptOX0U9MWLNrhJhrmdG9m/bN9C0m++TXVNuPapmLod
 loPKdwEM++JXdTkanJGi7EgVfpqr93PLZ/fdxO4B/m7++c3pXdMhPdwbU8R1W1dgtguw
 r5Sigrdshi6x8/cjJ2h/GGdQDv0PomdHuQl9X4q2lSuKvLJlQ0z7W6fHaoR2DLGn0a1/
 rC1Q==
X-Gm-Message-State: AOAM5328FHrJ+XieoyB4J9W1hidesnCiEbcvbhRCXSsS2jvQcHr/9eK9
 HQX0Z2jcCiQh9nx8Ap1VHd/i1LLljaA=
X-Google-Smtp-Source: ABdhPJxpikhcVipb4xrixKjJAqKlj6jrzvbsynGbuuB6+y3nelw8dYEuiJaa8ikC8W4iHXbYBLp++w==
X-Received: by 2002:a5d:584e:: with SMTP id i14mr4269791wrf.386.1637825314274; 
 Wed, 24 Nov 2021 23:28:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b10sm1997898wrt.36.2021.11.24.23.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 23:28:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 08:25:22 +0100
Message-Id: <20211125072522.4179056-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/jitterentropy-library: bump to
 version 3.3.1
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Use official tarball
- Drop patches (already in version)
- license files renamed with
  https://github.com/smuellerDD/jitterentropy-library/commit/a08ae564c422b54ad3332d38be033933ade4df6d
- Update indentation in hash file (two spaces)

https://github.com/smuellerDD/jitterentropy-library/blob/v3.3.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Makefile-cleanup-install.patch       | 54 ------------------
 ...efile-add-additional-install-targets.patch | 56 -------------------
 ...-the-user-to-disable-stack-protector.patch | 36 ------------
 .../jitterentropy-library.hash                |  8 +--
 .../jitterentropy-library.mk                  |  8 ++-
 5 files changed, 9 insertions(+), 153 deletions(-)
 delete mode 100644 package/jitterentropy-library/0001-Makefile-cleanup-install.patch
 delete mode 100644 package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
 delete mode 100644 package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch

diff --git a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch b/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
deleted file mode 100644
index 9c7e40369a..0000000000
--- a/package/jitterentropy-library/0001-Makefile-cleanup-install.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 060b9b4147f6e5ff386a8b017796118d783e59fa Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Tue, 22 Oct 2019 12:44:30 -0500
-Subject: [PATCH] Makefile: cleanup install for rebuilds
-
-Support the ability to rebuild and redeploy without a clean. This
-required some force linking and man archive creation.
-
-Provide the ability to override the stripping of the shared lib for
-cases where a embedded target build may want to control stripping
-or provide cross arch tools.
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-[Retrieved from:
-https://github.com/smuellerDD/jitterentropy-library/commit/060b9b4147f6e5ff386a8b017796118d783e59fa]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4ff069b..2e78607 100644
---- a/Makefile
-+++ b/Makefile
-@@ -14,6 +14,8 @@ LIBDIR := lib
- # include target directory
- INCDIR := include
- 
-+INSTALL_STRIP ?= install -s
-+
- NAME := jitterentropy
- LIBMAJOR=$(shell cat jitterentropy-base.c | grep define | grep MAJVERSION | awk '{print $$3}')
- LIBMINOR=$(shell cat jitterentropy-base.c | grep define | grep MINVERSION | awk '{print $$3}')
-@@ -58,15 +60,15 @@ cppcheck:
- install:
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
- 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
--	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
-+	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
--	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
- 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
--	ln -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
--	ln -s lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
-+	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
-+	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
- 
- clean:
- 	@- $(RM) $(NAME)
diff --git a/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch b/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
deleted file mode 100644
index a331c9f33b..0000000000
--- a/package/jitterentropy-library/0002-Makefile-add-additional-install-targets.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d545d76cb3173cc98e1421604929248f2d882821 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 24 Oct 2019 18:48:47 +0200
-Subject: [PATCH] Makefile: add additional install targets
-
-Add install-includes, install-man, install-shared and install-static
-targets to allow the user to configure what must be installed
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://github.com/smuellerDD/jitterentropy-library/pull/11]
----
- Makefile | 18 ++++++++++++++----
- 1 file changed, 14 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 2e78607..41bc4f7 100644
---- a/Makefile
-+++ b/Makefile
-@@ -57,19 +57,29 @@ scan: $(analyze_plists)
- cppcheck:
- 	cppcheck --force -q --enable=performance --enable=warning --enable=portability *.h *.c
- 
--install:
-+install: install-man install-shared install-includes
-+
-+install-man:
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
- 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
- 	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
-+
-+install-shared:
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
- 	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
--	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
--	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
--	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
- 	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
- 	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
- 
-+install-includes:
-+	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
-+	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
-+	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
-+
-+install-static:
-+	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
-+	install -m 0755 lib$(NAME).a $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+
- clean:
- 	@- $(RM) $(NAME)
- 	@- $(RM) $(OBJS)
--- 
-2.23.0
-
diff --git a/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch b/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch
deleted file mode 100644
index eeff0a0fec..0000000000
--- a/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 37e8a6a7e5875e20a8de07fbfbb69912f1964f7d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 28 Oct 2019 09:47:49 +0100
-Subject: [PATCH] Makefile: allow the user to disable stack protector
-
-Allow the user to disable stack-protector by overriding CFLAGS as it is
-not supported by all toolchains.
-
-Fixes:
- - http://autobuild.buildroot.net/results/cba1ae830c7a4d1740098fe67aec59b4dc2f9a03
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/smuellerDD/jitterentropy-library/pull/12]
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 41bc4f7..b0f20e2 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,9 +1,9 @@
- # Compile Noise Source as user space application
- 
- CC ?= gcc
--CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0
- #Hardening
--CFLAGS +=-fstack-protector-all -fwrapv --param ssp-buffer-size=4
-+CFLAGS ?=-fstack-protector-all --param ssp-buffer-size=4
-+CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0 -fwrapv
- LDFLAGS +=-Wl,-z,relro,-z,now
- 
- # Change as necessary
--- 
-2.23.0
-
diff --git a/package/jitterentropy-library/jitterentropy-library.hash b/package/jitterentropy-library/jitterentropy-library.hash
index 5ff38f6fea..760befab53 100644
--- a/package/jitterentropy-library/jitterentropy-library.hash
+++ b/package/jitterentropy-library/jitterentropy-library.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256	42d4bd1050b5f0d7b45b5453e5b6cfc45c0492bb428791f571d8f69b066351a4  jitterentropy-library-2.2.0.tar.gz
-sha256	96b5a6b49aaeeba9036f9b80e6e299d613a8eca158741a25a67dc78792413e23  COPYING
-sha256	13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  COPYING.bsd
-sha256	e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING.gplv2
+sha256  9fcc954763a1dd4afe614a1b360f53b600d3376bbcc4b19177f27abf191ebad5  jitterentropy-library-3.3.1.tar.xz
+sha256  7e06574ff822594269083a796d06fa4e5e78c40efe5ca01a72d2a4662e8206df  LICENSE
+sha256  13aa749a5b0a454917a944ed8fffc530b784f5ead522b1aacaf4ec8aa55a6239  LICENSE.bsd
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE.gplv2
diff --git a/package/jitterentropy-library/jitterentropy-library.mk b/package/jitterentropy-library/jitterentropy-library.mk
index d9dc031c35..830da0e065 100644
--- a/package/jitterentropy-library/jitterentropy-library.mk
+++ b/package/jitterentropy-library/jitterentropy-library.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-JITTERENTROPY_LIBRARY_VERSION = 2.2.0
-JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
+JITTERENTROPY_LIBRARY_VERSION = 3.3.1
+JITTERENTROPY_LIBRARY_SOURCE = \
+	jitterentropy-library-$(JITTERENTROPY_LIBRARY_VERSION).tar.xz
+JITTERENTROPY_LIBRARY_SITE = http://www.chronox.de/jent
 JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0 or BSD-3-Clause
-JITTERENTROPY_LIBRARY_LICENSE_FILES = COPYING COPYING.bsd COPYING.gplv2
+JITTERENTROPY_LIBRARY_LICENSE_FILES = LICENSE LICENSE.bsd LICENSE.gplv2
 JITTERENTROPY_LIBRARY_INSTALL_STAGING = YES
 JITTERENTROPY_LIBRARY_INSTALL_TARGETS = install-includes
 JITTERENTROPY_LIBRARY_SELINUX_MODULES = entropyd
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
