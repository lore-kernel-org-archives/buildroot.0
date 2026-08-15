Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A2DC5CFDB
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 17:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82E180E6E;
	Sat, 15 Aug 2026 17:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkJiA4TrYpbw; Sat, 15 Aug 2026 17:22:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F25A480E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786814553;
	bh=OzrKsLtwB6RBo3WENUd9cO4vJK5nWJ02aEvxDRVdbl8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V17Q44dnOSxLb4ACT9hFYH1HJ4jTGRTn9QEVAWM0am5xIS3k7qWjsWvC8Nr7+MVPj
	 SHDwP4sjf/IqzLnGkTb5CNicRe7TpCjRuOn6cJGxmcRj7ftbRULKjZfAGUS3qoN5iX
	 1iRba5FjCg2t9IEgccu9Rf06EkF/GfYFRCUxoO/ig3mAMOIMcbPVKCbSuXYsbrgUSh
	 Z8QoxFNtUSyg6ZTGFkwahdDDJbe6WuhnCtyi3t8TXNIuZdIlDMQzQk73hhuWV6j+Fx
	 3qRV4BrntAmjBYtTZ6Ih1iShezi3cKOVctu48lQJPrt50JzPWgSovodkiVBZ1ldlSR
	 oxnIW8LLrctNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F25A480E02;
	Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B2EB2B2
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DA1240878
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmkkJ10yJYPq for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A44F407C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A44F407C8
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 17:22:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0D638D7AC; Sat, 15 Aug 2026 17:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 19:15:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 328fa370f0bc45cbce22fa73263e2a2c3b597e07
X-Git-Newrev: cf89a66d6c7852372ff0dc8163f85814ddd56dce
X-Patchwork-Hint: ignore
Message-Id: <20260815172140.A0D638D7AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdcss: bump version to 1.6.0
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
Content-Type: multipart/mixed; boundary="===============9216963901874575278=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9216963901874575278==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cf89a66d6c7852372ff0dc8163f85814ddd56dce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libdvdcss/-/blob/1.6.0/NEWS

Removed sha1 hash, sha256 is enough.

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Fixed-compilation-problems-with-PATH_MAX.patch | 46 ----------------------
 package/libdvdcss/libdvdcss.hash                   |  6 +--
 package/libdvdcss/libdvdcss.mk                     |  2 +-
 3 files changed, 3 insertions(+), 51 deletions(-)

diff --git a/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch b/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch
deleted file mode 100644
index 35ebf4f4d1..0000000000
--- a/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From be34d026f44389745e29a7da977f84712066d3d0 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 15 Nov 2025 19:41:09 +0100
-Subject: [PATCH] Fixed compilation problems with PATH_MAX
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In file included from ../src/cpxm.c:38:
-../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
-   65 |     char   psz_cachefile[PATH_MAX];
-
-In file included from ../src/error.c:26:
-../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
-   65 |     char   psz_cachefile[PATH_MAX];
-
-In file included from ../src/libdvdcpxm.c:47:
-../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
-   65 |     char   psz_cachefile[PATH_MAX];
-
-Upstream: https://code.videolan.org/videolan/libdvdcss/-/merge_requests/24
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libdvdcss.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/libdvdcss.h b/src/libdvdcss.h
-index f9d36ba..997af34 100644
---- a/src/libdvdcss.h
-+++ b/src/libdvdcss.h
-@@ -26,6 +26,11 @@
- 
- #include <limits.h>
- 
-+#include <config.h>
-+#ifdef HAVE_SYS_PARAM_H
-+#   include <sys/param.h>
-+#endif
-+
- #include "dvdcss/dvdcss.h"
- #include "cpxm.h"
- #include "css.h"
--- 
-2.47.3
-
diff --git a/package/libdvdcss/libdvdcss.hash b/package/libdvdcss/libdvdcss.hash
index 835155be80..a6b9992a13 100644
--- a/package/libdvdcss/libdvdcss.hash
+++ b/package/libdvdcss/libdvdcss.hash
@@ -1,7 +1,5 @@
-# From https://download.videolan.org/pub/videolan/libdvdcss/1.5.0/libdvdcss-1.5.0.tar.xz.sha1
-sha1  bb21a27a32fa2a1d1e81448722fdc62c521a8803  libdvdcss-1.5.0.tar.xz
-# From https://download.videolan.org/pub/videolan/libdvdcss/1.5.0/libdvdcss-1.5.0.tar.xz.sha256
-sha256  529463e4d1befef82e5c6e470db7661a2db0343e092a2fb0d6c037cab8a5c399  libdvdcss-1.5.0.tar.xz
+# From http://download.videolan.org/pub/videolan/libdvdcss/1.6.0/libdvdcss-1.6.0.tar.xz.sha256
+sha256  7ea556c846b7bfc32d47b41cae56d1863a6b6d5f706bb162778d6f298490977c  libdvdcss-1.6.0.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
index dae62fb592..a953145547 100644
--- a/package/libdvdcss/libdvdcss.mk
+++ b/package/libdvdcss/libdvdcss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDCSS_VERSION = 1.5.0
+LIBDVDCSS_VERSION = 1.6.0
 LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.xz
 LIBDVDCSS_SITE = https://download.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
 LIBDVDCSS_INSTALL_STAGING = YES

--===============9216963901874575278==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9216963901874575278==--
