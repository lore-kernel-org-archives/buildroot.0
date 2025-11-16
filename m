Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B814FCCD19A
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6C6E821D2;
	Sun, 16 Nov 2025 18:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsUkeTQgF6Wb; Sun, 16 Nov 2025 18:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7589822E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7589822E6;
	Sun, 16 Nov 2025 18:51:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE3261A9
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B01F6404BD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATIa518fCqbK for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A41401AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A41401AD
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C320F84716; Sun, 16 Nov 2025 18:51:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 19:17:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75dc8e1842143f347bd7395ecedad4308bc14953
X-Git-Newrev: cd3a2f0ff35346ad5fd6a9867113260addccf127
X-Patchwork-Hint: ignore
Message-Id: <20251116185140.C320F84716@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdvdcss: bump version to 1.5.0
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
Content-Type: multipart/mixed; boundary="===============0102750597489397300=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0102750597489397300==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=cd3a2f0ff35346ad5fd6a9867113260addccf127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/libdvdcss/-/blob/1.5.0/NEWS

Added patch to fix build errors.

Updated _SITE, switched tarball to xz and build system to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix check-package error in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-Fixed-compilation-problems-with-PATH_MAX.patch | 46 ++++++++++++++++++++++
 package/libdvdcss/libdvdcss.hash                   |  8 ++--
 package/libdvdcss/libdvdcss.mk                     |  8 ++--
 3 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch b/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch
new file mode 100644
index 0000000000..35ebf4f4d1
--- /dev/null
+++ b/package/libdvdcss/0001-Fixed-compilation-problems-with-PATH_MAX.patch
@@ -0,0 +1,46 @@
+From be34d026f44389745e29a7da977f84712066d3d0 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 15 Nov 2025 19:41:09 +0100
+Subject: [PATCH] Fixed compilation problems with PATH_MAX
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In file included from ../src/cpxm.c:38:
+../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
+   65 |     char   psz_cachefile[PATH_MAX];
+
+In file included from ../src/error.c:26:
+../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
+   65 |     char   psz_cachefile[PATH_MAX];
+
+In file included from ../src/libdvdcpxm.c:47:
+../src/libdvdcss.h:65:26: error: ‘PATH_MAX’ undeclared here (not in a function)
+   65 |     char   psz_cachefile[PATH_MAX];
+
+Upstream: https://code.videolan.org/videolan/libdvdcss/-/merge_requests/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/libdvdcss.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/libdvdcss.h b/src/libdvdcss.h
+index f9d36ba..997af34 100644
+--- a/src/libdvdcss.h
++++ b/src/libdvdcss.h
+@@ -26,6 +26,11 @@
+ 
+ #include <limits.h>
+ 
++#include <config.h>
++#ifdef HAVE_SYS_PARAM_H
++#   include <sys/param.h>
++#endif
++
+ #include "dvdcss/dvdcss.h"
+ #include "cpxm.h"
+ #include "css.h"
+-- 
+2.47.3
+
diff --git a/package/libdvdcss/libdvdcss.hash b/package/libdvdcss/libdvdcss.hash
index 4d20f19efc..835155be80 100644
--- a/package/libdvdcss/libdvdcss.hash
+++ b/package/libdvdcss/libdvdcss.hash
@@ -1,7 +1,7 @@
-# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.3/libdvdcss-1.4.3.tar.bz2.sha1
-sha1  fcea8b2749ead8183636e48300bea8791abc79ee  libdvdcss-1.4.3.tar.bz2
-# From http://download.videolan.org/pub/videolan/libdvdcss/1.4.3/libdvdcss-1.4.3.tar.bz2.sha256
-sha256  233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079  libdvdcss-1.4.3.tar.bz2
+# From https://download.videolan.org/pub/videolan/libdvdcss/1.5.0/libdvdcss-1.5.0.tar.xz.sha1
+sha1  bb21a27a32fa2a1d1e81448722fdc62c521a8803  libdvdcss-1.5.0.tar.xz
+# From https://download.videolan.org/pub/videolan/libdvdcss/1.5.0/libdvdcss-1.5.0.tar.xz.sha256
+sha256  529463e4d1befef82e5c6e470db7661a2db0343e092a2fb0d6c037cab8a5c399  libdvdcss-1.5.0.tar.xz
 
 # Hash for license file:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libdvdcss/libdvdcss.mk b/package/libdvdcss/libdvdcss.mk
index f4d721771f..dae62fb592 100644
--- a/package/libdvdcss/libdvdcss.mk
+++ b/package/libdvdcss/libdvdcss.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBDVDCSS_VERSION = 1.4.3
-LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.bz2
-LIBDVDCSS_SITE = http://www.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
+LIBDVDCSS_VERSION = 1.5.0
+LIBDVDCSS_SOURCE = libdvdcss-$(LIBDVDCSS_VERSION).tar.xz
+LIBDVDCSS_SITE = https://download.videolan.org/pub/videolan/libdvdcss/$(LIBDVDCSS_VERSION)
 LIBDVDCSS_INSTALL_STAGING = YES
 LIBDVDCSS_LICENSE = GPL-2.0+
 LIBDVDCSS_LICENSE_FILES = COPYING
 
-$(eval $(autotools-package))
+$(eval $(meson-package))

--===============0102750597489397300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0102750597489397300==--
