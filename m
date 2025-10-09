Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F47CCA470
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 06:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCE9836EA;
	Thu,  9 Oct 2025 06:14:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqoxgnSql7XH; Thu,  9 Oct 2025 06:14:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EAAB836AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EAAB836AE;
	Thu,  9 Oct 2025 06:14:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D65B119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 06:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76DBA61118
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 06:14:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RG-dl1nJaJs3 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 06:14:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9EBA060FB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EBA060FB8
Received: from mail.tkos.co.il (guitar.tkos.co.il [84.110.109.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9EBA060FB8
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 06:14:00 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 835714408FC;
 Thu,  9 Oct 2025 09:12:57 +0300 (IDT)
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 09:13:52 +0300
Message-ID: <d1296ef3586d2a3df9e52f36d7e1ce41ac33a2c9.1759990432.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1759990377;
 bh=w2LkY3IE4WE2aSg7NWMI7wJ90r0nov9iNMEjP4stfrg=;
 h=From:To:Cc:Subject:Date:From;
 b=en+PnuphbetLhBI4x9eSsmhxSxC/Pt42nlDmCKdgOlM/sIJ1+yZafFRaFuUNMENZp
 6EmqjmpDOE81WgCB2waTd8L5skVaXmmG+yAXnApVcoovOTgVjsrirKxzUcjM5iGRiv
 H3KnsZp83SECnU3dx3GYJAZwFLq/x9K2MXnNRACZAOnSD92HePpgiIZ+EbBiJUOv4l
 fSUgioEZ+Cc29ozOEMy/4SU1kQ6GcDtUYwyOA96gEpZTtkLmY7LdU/rwg3rAcwAjpd
 1tYORqSmBTL/6ru4xzyPsdlOGhmmvunTQPJN7CwBOrYwFean07fy1fYypFzv/u/mQb
 CYeO26a1SzkJw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=en+Pnuph
Subject: [Buildroot] [PATCH] package/sexpect: bump to version 2.3.15
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch.

Main change in this release is cmake 4 build fix.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...1-Unconditionally-define-_GNU_SOURCE.patch | 69 -------------------
 package/sexpect/sexpect.hash                  |  2 +-
 package/sexpect/sexpect.mk                    |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch

diff --git a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
deleted file mode 100644
index bb8b60f0c0d9..000000000000
--- a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 7ef4ef027c5064502bba23869aed9d1595a4e301 Mon Sep 17 00:00:00 2001
-Message-ID: <7ef4ef027c5064502bba23869aed9d1595a4e301.1732873390.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Fri, 29 Nov 2024 11:36:16 +0200
-Subject: [PATCH] Unconditionally define _GNU_SOURCE
-
-uClibc also uses _GNU_SOURCE to expose glibc compatible API extensions.
-But toolchain built with uClibc don't define __gnu_linux__. This leads
-to implicit declaration warnings at build time. With GCC 14 these
-warnings become errors by default.
-
-For example:
-
-.../sexpect-2.3.14/server.c: In function 'expect_exact':
-.../sexpect-2.3.14/server.c:630:17: error: implicit declaration of function 'strcasestr'; did you mean 'strcasecmp'?
-  [-Wimplicit-function-declaration]
-  630 |         found = strcasestr(g.expbuf, g.conn.pass.pattern);
-      |                 ^~~~~~~~~~
-      |                 strcasecmp
-
-Define _GNU_SOURCE unconditionally to fix the build.
-
-Upstream: https://github.com/clarkwang/sexpect/pull/40
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
- main.c   | 2 --
- pty.c    | 2 --
- server.c | 2 --
- 3 files changed, 6 deletions(-)
-
-diff --git a/main.c b/main.c
-index 886050a887c1..2bc7c867e297 100644
---- a/main.c
-+++ b/main.c
-@@ -1,7 +1,5 @@
- 
--#if defined(__gnu_linux__) || defined(__CYGWIN__)
- #define _GNU_SOURCE
--#endif
- 
- #include <fcntl.h>
- #include <limits.h>
-diff --git a/pty.c b/pty.c
-index bf4f6e99805e..f90325d87c77 100644
---- a/pty.c
-+++ b/pty.c
-@@ -1,7 +1,5 @@
- 
--#if defined(__gnu_linux__) || defined(__CYGWIN__)
- #define _GNU_SOURCE
--#endif
- 
- #include <string.h>
- #include <stdio.h>
-diff --git a/server.c b/server.c
-index c7e41e0a7dc4..308852f08089 100644
---- a/server.c
-+++ b/server.c
-@@ -1,7 +1,5 @@
- 
--#if defined(__gnu_linux__) || defined(__CYGWIN__)
- #define _GNU_SOURCE
--#endif
- 
- #include <assert.h>
- #include <fcntl.h>
--- 
-2.45.2
-
diff --git a/package/sexpect/sexpect.hash b/package/sexpect/sexpect.hash
index d5121176269e..ce1232de82fe 100644
--- a/package/sexpect/sexpect.hash
+++ b/package/sexpect/sexpect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f6801c8b979d56eec54aedd7ede06e2342f382cee291beea88b52869186c557c  sexpect-2.3.14.tar.gz
+sha256  44f5711aa99f3ccf9c4b0edfcd9a7d25fa64b442574624ce451713d1532c1a7e  sexpect-2.3.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
index 7b878600e41f..bbc84c1ca6ec 100644
--- a/package/sexpect/sexpect.mk
+++ b/package/sexpect/sexpect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEXPECT_VERSION = 2.3.14
+SEXPECT_VERSION = 2.3.15
 SEXPECT_SITE = $(call github,clarkwang,sexpect,v$(SEXPECT_VERSION))
 SEXPECT_LICENSE = GPL-3.0
 SEXPECT_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
