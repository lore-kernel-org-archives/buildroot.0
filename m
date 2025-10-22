Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E461BCCD1AB
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC77161472;
	Wed, 22 Oct 2025 16:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mSWeuMsgsBqv; Wed, 22 Oct 2025 16:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82D82614CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D82614CD;
	Wed, 22 Oct 2025 16:42:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DAEBDE
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4604183DAD
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LrF_0hUZj9UK for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D99F83DB9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D99F83DB9
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B96B8615A; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:38:54 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 6c45afcaa286be1f7817a95840480b5d20eb7fcc
X-Git-Newrev: c177e65fac3ffb902586471db2fd84281a72753b
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.7B96B8615A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sexpect: bump to
 version 2.3.15
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c177e65fac3ffb902586471db2fd84281a72753b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Drop upstream patch.

Main change in this release is cmake 4 build fix.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7176f6b28751dfb5e1592caba7efb3f9da4d2685)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-Unconditionally-define-_GNU_SOURCE.patch  | 69 ----------------------
 package/sexpect/sexpect.hash                       |  2 +-
 package/sexpect/sexpect.mk                         |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch b/package/sexpect/0001-Unconditionally-define-_GNU_SOURCE.patch
deleted file mode 100644
index bb8b60f0c0..0000000000
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
index d512117626..ce1232de82 100644
--- a/package/sexpect/sexpect.hash
+++ b/package/sexpect/sexpect.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f6801c8b979d56eec54aedd7ede06e2342f382cee291beea88b52869186c557c  sexpect-2.3.14.tar.gz
+sha256  44f5711aa99f3ccf9c4b0edfcd9a7d25fa64b442574624ce451713d1532c1a7e  sexpect-2.3.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sexpect/sexpect.mk b/package/sexpect/sexpect.mk
index 7b878600e4..bbc84c1ca6 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
