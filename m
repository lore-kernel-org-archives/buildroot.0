Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E1ED3C92A
	for <buildroot@archiver.kernel.org>; Sun, 20 Oct 2024 09:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B809809D3;
	Sun, 20 Oct 2024 09:26:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTy_lyuD4bUM; Sun, 20 Oct 2024 09:26:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF68280A56
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF68280A56;
	Sun, 20 Oct 2024 09:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CB17A71F
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 09:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB2CC809D3
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 09:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9kvJSquhPc8b for <buildroot@buildroot.org>;
 Sun, 20 Oct 2024 09:26:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B133A8059E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B133A8059E
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B133A8059E
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 09:26:06 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-20bb39d97d1so32565765ad.2
 for <buildroot@buildroot.org>; Sun, 20 Oct 2024 02:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729416366; x=1730021166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R7wzhx7vppkcS7dIMqN9K8mfvFu+mH3pTBx0uZlF6Ms=;
 b=pu3sxmj3coo6FwRXMpzjXDHi8qnCBvtQhwrwOd7voDYfY0+1ai97AsMNCZnu/Ch+VQ
 KU5rrJgk6LZ1YjcAVuPRBSVMT5+PpRdVNREHqx/XvPO/c3mC7hIeUOUW/aYJsyqxpK9K
 jeuYqvrdIFgz5DoNdii1sokahMIVYrFMCPqcgIHb+9/p01KnNfLxb98Hybfo7eekYg/P
 U6qikJLagNVafA6oO9OxI1mMkx9oP0KyBjcO0rmABdBmxfVMwzX0tFHd31GpeANbaLhj
 fJ+PvH4LIN4aIuVxze1tF1Sqa6UeV9zWLpZ2kUpZYs/VId70dVa2G+9H8YQYeYKEaLBj
 SuLw==
X-Gm-Message-State: AOJu0YwQwFPrR4HswxRN6kfVXMC1ZsRos1vNvFDCUphk9U0LmULtbzAH
 2k9iy0Cv2AmcmL8qU/0Pl+yoXDr6OqwD3mCkV+qD1lqXgK0AboNmcb+hkA==
X-Google-Smtp-Source: AGHT+IGgsc9nPt9QeKdo3Lo0/F7puSeY6jihcVIzXCeJS/5kb3ahHDGWisudCYghkWcjxTQoj/kZsA==
X-Received: by 2002:a17:902:d2d2:b0:20b:6e74:b712 with SMTP id
 d9443c01a7336-20e5a92f0a5mr101896955ad.45.1729416365692; 
 Sun, 20 Oct 2024 02:26:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20e7f0f36c2sm7480205ad.256.2024.10.20.02.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2024 02:26:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 062A1437667D; Sun, 20 Oct 2024 16:25:58 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Buildroot Development <buildroot@buildroot.org>
Date: Sun, 20 Oct 2024 16:25:29 +0700
Message-ID: <20241020092527.734923-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8421; i=bagasdotme@gmail.com;
 h=from:subject; bh=WZZzcyfGVA+YNEs4y75rfYs/qpZvR0abfZGZseMqwPU=;
 b=owGbwMvMwCUmqirOYPHY4znjabUkhnSRM+1rVr/ITn5jsHzK9c2tHZtNitx5ubyePura1ikbv
 Nnn9YawjlIWBjEuBlkxRZbotbK7jHn3XjKLSSiCmcPKBDKEgYtTACaS3cPw3+e8S8fjoJlH71WI
 yrfe32CrJn1pqzLzaekA8QNvWLPL3zMytB0UMfwqKOscJelS+jDs4tTlc+6vE73x4k7gpvTjstu
 VOAE=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=5BAD1DBA330DBDD2365C60721525170038E348E7
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729416366; x=1730021166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R7wzhx7vppkcS7dIMqN9K8mfvFu+mH3pTBx0uZlF6Ms=;
 b=bPjtyV/ZcYYH78rnGx/xmnfHuXpwLYl3WmbRYKx9WpE3k8V2+aplKbvT4OHlZa0tk1
 nJEz58XJ70zyX69mVBl0P+kV68mdNxKU5k+4hJdWaA7okblHJz5OwUrhp+sVA0CE6slD
 BOwYiJap8EsW9GkTctFbGqpAjrFsbU8apZoNOsjjACm2PPz9Eo7IMq7bflRJ0+QyOGxE
 PFaYH4Au6OThop+CFRiIDePbE7ki2T75lhQVYnRisbhysaqZJ0i60avxwZ5ZJfKEXHJK
 UtXgFWyeu54XvBfUWvZebchxkmfRp8V5VdXO7hPTkrpIIZPpbFtV5mQpJ7TjOJeQi2K1
 ICqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bPjtyV/Z
Subject: [Buildroot] [PATCH] package/git: fix wchar-less uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package fails to build on wchar-less uClibc-ng configuration
(i.e. without BR2_TOOLCHAIN_BUILDROOT_WCHAR selected):

```
    CC t/unit-tests/unit-test.o
t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
In file included from t/unit-tests/clar/clar.c:13:
t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
  769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
      |                                                                 ^~~~~~
t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                       ^~~~~~~
t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
      |                                                          ^~~~~~~
t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
  787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
      |                                                                 ^~~~~~~
make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
```

This is because since version 2.47.0, Git imports clar unit testing
framework, which uses wchar_t. On wchar-less uClibc-ng configuration,
however, the installed <wchar.h> header is a stub (that is, wchar_t
is undefined).

Fix the build failure by only using wchar_t when __UCLIBC_HAS_WCHAR__
is actually defined.

Fixes: https://autobuild.buildroot.org/results/45a1bd9a34c4b0945a07c22338b201908cf45d8c/
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---

From upstream discussion [1], it seems like wchar-less uclibc config is broken
and needs to be fixed in uclibc-ng proper. Cc'ing Waldemar.

[1]: https://lore.kernel.org/git/ZxHrIBCdnwdRdXAv@pks.im/

 ...fix-clar-build-for-wchar-less-uclibc.patch | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch

diff --git a/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch b/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch
new file mode 100644
index 0000000000..50e844f5d4
--- /dev/null
+++ b/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch
@@ -0,0 +1,97 @@
+From 3d24a1610bf5a84486c84526ded567a53e10b96f Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Fri, 18 Oct 2024 14:59:48 +0200
+Subject: [PATCH] t/unit-tests: fix clar build for wchar-less uclibc
+
+Git fails to build on uclibc systems without wchar support:
+
+```
+    CC t/unit-tests/unit-test.o
+t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
+t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
+  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
+      |                       ^~~~~~~
+In file included from t/unit-tests/clar/clar.c:13:
+t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
+  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
+      |                                                          ^~~~~~~
+t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
+  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
+      |                       ^~~~~~~
+t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
+  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
+      |                                                          ^~~~~~~
+t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
+  769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
+      |                                                                 ^~~~~~
+t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
+  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
+      |                       ^~~~~~~
+t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
+  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
+      |                                                          ^~~~~~~
+t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
+  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
+      |                       ^~~~~~~
+t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
+  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
+      |                                                          ^~~~~~~
+t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
+  787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
+      |                                                                 ^~~~~~~
+make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
+```
+
+This is because on these systems, although there is #error macro
+in uclibc source when __UCLIBC_HAS_WCHAR__ is not defined, somehow
+the #error doesn't get triggered when wchar_t is used in clar.
+
+Fix the build failure by only using wchar_t when __UCLIBC_HAS_WCHAR__
+is actually defined.
+
+Upstream: https://lore.kernel.org/git/ZxJnfYtuxnAEBc1E@archie.me/
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
+---
+ t/unit-tests/clar/clar.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/t/unit-tests/clar/clar.c b/t/unit-tests/clar/clar.c
+index cef0f023c2..6de0b415b1 100644
+--- a/t/unit-tests/clar/clar.c
++++ b/t/unit-tests/clar/clar.c
+@@ -18,6 +18,13 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ 
++#if defined(__UCLIBC__) && ! defined(__UCLIBC_HAS_WCHAR__)
++   /* uClibc can be built without wchar support, in which case the
++      installed <wchar.h> is a stub that does not define wchar_t. */
++#else
++#  define HAVE_WCHAR
++#endif
++
+ #ifdef _WIN32
+ #	define WIN32_LEAN_AND_MEAN
+ #	include <windows.h>
+@@ -763,6 +770,7 @@ void clar__assert_equal(
+ 			}
+ 		}
+ 	}
++#ifdef HAVE_WCHAR
+ 	else if (!strcmp("%ls", fmt)) {
+ 		const wchar_t *wcs1 = va_arg(args, const wchar_t *);
+ 		const wchar_t *wcs2 = va_arg(args, const wchar_t *);
+@@ -798,6 +806,7 @@ void clar__assert_equal(
+ 			}
+ 		}
+ 	}
++#endif // HAVE_WCHAR
+ 	else if (!strcmp("%"PRIuZ, fmt) || !strcmp("%"PRIxZ, fmt)) {
+ 		size_t sz1 = va_arg(args, size_t), sz2 = va_arg(args, size_t);
+ 		is_equal = (sz1 == sz2);
+
+base-commit: 777489f9e09c8d0dd6b12f9d90de6376330577a2
+-- 
+An old man doll... just what I always wanted! - Clara
+

base-commit: 0ad7035fce67cbe91db9dea7d81e6a4bc0691ad1
-- 
An old man doll... just what I always wanted! - Clara

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
