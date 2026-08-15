Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2846AC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE454407C8;
	Sat, 15 Aug 2026 17:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJ53zdDbqlNV; Sat, 15 Aug 2026 17:22:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF98440878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786814554;
	bh=gcCZXXD3pfv708TpyDXA88YJFcKyCfsgo84WvMOVL3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qIa4oZcx9HPSQA8p//oEqsLZZgizKi9HNzXjxBgJ4MVWh5dJr+BtSo2Z6jiVo9Ovm
	 nC/HYLOMi0xP2JNn+TdTnFi5mBRBR6kHKKY0b6i2JGIfXb16N7b62HkltrzYJZZq+M
	 8Pw/JgzcD84mNG6dJsx6N2K/QNdHcprENo7S1E3yoCvv/tyI+EfO45IInF+ypXC6/A
	 YQ98VuUTnXsq6mLy9+GWk+IBBdjhKDEUlxQFEhMjcBPZXQVaDn0APncOAaqD1bxHKa
	 9XXRhWFC5FVU38FZnQZgqkmMHrqXKW5SpmVIugiLLsYiLdF/2uQKxzPxU23U6ADwjO
	 i/69ZTRMT4lrQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF98440878;
	Sat, 15 Aug 2026 17:22:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E99E337
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 224A080E01
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkwCMdUttv0A for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B6F80E02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42B6F80E02
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A95348D7AF; Sat, 15 Aug 2026 17:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 19:15:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf89a66d6c7852372ff0dc8163f85814ddd56dce
X-Git-Newrev: cd9f9b47d7c00ae404d8d0eee47ddd6ce58143eb
X-Patchwork-Hint: ignore
Message-Id: <20260815172140.A95348D7AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdread: bump version to 7.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd9f9b47d7c00ae404d8d0eee47ddd6ce58143eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libdvdread/blob/7.1.1/NEWS

Removed sha1 hash, the sha256 hash is sufficient.

Added patch to fix build error which would be introduced by this bump
that was seen with br-arm-full-static defconfig by the Gitlab pipelines.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Fixed-compilation-problems-with-PATH_MAX.patch | 40 ++++++++++++++++++++++
 package/libdvdread/libdvdread.hash                 |  6 ++--
 package/libdvdread/libdvdread.mk                   |  2 +-
 3 files changed, 43 insertions(+), 5 deletions(-)

diff --git a/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
new file mode 100644
index 0000000000..5646d79f8a
--- /dev/null
+++ b/package/libdvdread/0001-Fixed-compilation-problems-with-PATH_MAX.patch
@@ -0,0 +1,40 @@
+From 4462612349edd3030d81e3c3a7b638e13e6b8ef2 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 12 Aug 2026 22:40:26 +0200
+Subject: [PATCH] Fixed compilation problems with PATH_MAX
+
+../src/dvd_reader.c: In function 'dir_has_file':
+../src/dvd_reader.c:393:14: error: 'PATH_MAX' undeclared (first use in this function)
+  393 |   char path[ PATH_MAX + 1 ];
+
+The build error was introduced by
+https://code.videolan.org/videolan/libdvdread/-/commit/da7d7ed4e8fe08c0af310925995b2f4742f7eabf
+
+and was found using the buildroot Gitlab pipelines with gcc 9.3.0.
+
+Upstream: https://code.videolan.org/videolan/libdvdread/-/merge_requests/142
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/dvd_reader.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/dvd_reader.c b/src/dvd_reader.c
+index ceef4ee..2a70958 100644
+--- a/src/dvd_reader.c
++++ b/src/dvd_reader.c
+@@ -29,6 +29,11 @@
+ #include <limits.h>         /* PATH_MAX */
+ #include <ctype.h>          /* isalpha */
+ 
++#include <config.h>
++#ifdef HAVE_SYS_PARAM_H
++#   include <sys/param.h>   /* PATH_MAX */
++#endif
++
+ #if defined(__FreeBSD__) || defined(__OpenBSD__) || defined(__NetBSD__) || defined(__bsdi__) || defined(__APPLE__)
+ # define SYS_BSD 1
+ #endif
+-- 
+2.47.3
+
diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 5fb51ff47c..4a669fbcc5 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,7 +1,5 @@
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha1
-sha1  aaba59e0e04fa12704fab4230344549d8ae4b2e3  libdvdread-7.0.1.tar.xz
-# From https://download.videolan.org/pub/videolan/libdvdread/7.0.1/libdvdread-7.0.1.tar.xz.sha256
-sha256  2e3e04a305c15c3963aa03ae1b9a83c1d239880003fcf3dde986d3943355d407  libdvdread-7.0.1.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdread/7.1.1/libdvdread-7.1.1.tar.xz.sha256
+sha256  a0d47876548bec806774bbf8dbf20bb19ba139464383156b32eb8e59915b90a9  libdvdread-7.1.1.tar.xz
 
 # Hash for license file:
 sha256  d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572  COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index cc515606b2..b6a34ad173 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 7.0.1
+LIBDVDREAD_VERSION = 7.1.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.xz
 LIBDVDREAD_SITE = https://download.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
