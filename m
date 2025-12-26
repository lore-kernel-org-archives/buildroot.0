Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D98CE8FDB0
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F7B660C26;
	Fri, 26 Dec 2025 18:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyTAwfzN-ykB; Fri, 26 Dec 2025 18:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FEDD60D4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773285;
	bh=MdJzuQDIN2trBb1rovbgofaAvKzhmlOgjtRB7g15DwA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cPlKPiVGc0TTZdwi8hM5plZL2g41GP2c4w9yF+M+pFBFp7lJ6SzrkEn1rLj26NTSr
	 ZOsLfXivlHKxaBCwxPwCjd9WCdYnFQRvRIzoMykT4dUyujhBOs/OQv16juqHb8/CSl
	 pYhczfmltV9KpYprdGrSOrrxoEo/ZudeOp9b+6iPFNE6bCPhEmHAW53Tf07H4pIr2x
	 PynTbqKMBmOQ3u4tgQX8efcavtpL0iRyBz/f3y9jojtWKZgBOcQsx9JiFq35YcmpJ/
	 gBD8H7FV6/cQcG8tqWfsXjW94uLskyskqJvErVo0jiuB77Z9U9ew7A0a+JBf7krKEs
	 OkNxW3UkbQKwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FEDD60D4E;
	Fri, 26 Dec 2025 18:21:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A54B7EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7087A80AAF
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0IuLA6B_xKSi for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7856D80BDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7856D80BDB
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7563283371; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35b32556477ef30bde9215b76647bc53ab977ec9
X-Git-Newrev: 2345568936724fbd081ac9a1e338cffb887c2a82
X-Patchwork-Hint: ignore
Message-Id: <20251226182055.7563283371@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{libtorrent,
 rtorrent}: bump version to 0.15.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=2345568936724fbd081ac9a1e338cffb887c2a82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patches which are included in this release.

Switched SITE to github according to http://rtorrent.net/

Both packages need to be bumped together due to version check for
libtorrent by rtorrent:
https://github.com/rakshasa/rtorrent/commit/6f8c1246dc013d1d5c39ecd66373346ac42fe746

Fixes:
https://autobuild.buildroot.net/results/a2e/a2e609caecc26f67134d0fed1c239e8d148e07fd/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  2 --
 .../0001-libtorrent.pc.in-add-Libs.Private.patch   | 30 -------------------
 package/libtorrent/libtorrent.hash                 |  2 +-
 package/libtorrent/libtorrent.mk                   |  5 ++--
 ...ded--disable-execinfo-option-to-configure.patch | 34 ----------------------
 package/rtorrent/rtorrent.hash                     |  2 +-
 package/rtorrent/rtorrent.mk                       |  7 ++---
 7 files changed, 8 insertions(+), 74 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 1f406c3426..bb8d5b152f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -614,7 +614,6 @@ package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patc
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
-package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
 package/libubootenv/0001-src-CMakeLists.txt-do-not-force-the-build-of-a-share.patch lib_patch.Upstream
 package/libuio/0001-configure.ac-set-automake-strictness-to-foreign.patch lib_patch.Upstream
 package/liburcu/0001-Only-blacklist-ARM-gcc-4.8.0-and-4.8.1.patch lib_patch.Upstream
@@ -920,7 +919,6 @@ package/rpi-userland/0005-dtmerge-add-missing-include-for-va_list.patch lib_patc
 package/rpi-userland/0006-interface-vcos-pthreads-CMakeLists.txt-fix-build-wit.patch lib_patch.Upstream
 package/rpi-userland/0007-GLES2-gl2ext.h-add-GLint64-GLuint64-and-GLsync-typed.patch lib_patch.Upstream
 package/rt-tests/0001-Fix-a-build-issue-with-uClibc-ng.patch lib_patch.Upstream
-package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch lib_patch.Upstream
 package/rubix/0001-dont-use-legacy-functions.patch lib_patch.Upstream
 package/rubix/0002-misc-fixes.patch lib_patch.Sob lib_patch.Upstream
 package/rygel/S99rygel Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch b/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
deleted file mode 100644
index 7d363d2939..0000000000
--- a/package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From a86219e725441eb87321fa3e24531dafa54ee674 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 20 Oct 2019 20:23:19 +0200
-Subject: [PATCH] libtorrent.pc.in: add Libs.Private
-
-Add Libs.Private: -lz so applications that want to link statically with
-libtorrent (such as rtorrent) will know that they must link with -lz
-
-Fixes:
- - http://autobuild.buildroot.org/results/075598e1699c2ac20a4dfbcb5695bbb7343f9a86
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/rakshasa/libtorrent/pull/202]
----
- libtorrent.pc.in | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/libtorrent.pc.in b/libtorrent.pc.in
-index cf6612bc..6108f7e9 100644
---- a/libtorrent.pc.in
-+++ b/libtorrent.pc.in
-@@ -7,4 +7,5 @@ Name: libtorrent
- Description: A BitTorrent library
- Version: @VERSION@
- Libs: -L${libdir} -ltorrent
-+Libs.Private: -lz
- Cflags: -I${includedir}
--- 
-2.23.0
-
diff --git a/package/libtorrent/libtorrent.hash b/package/libtorrent/libtorrent.hash
index 5c755c8bef..0895fcd87e 100644
--- a/package/libtorrent/libtorrent.hash
+++ b/package/libtorrent/libtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ed115a28f4ae8cfcd33b94a597c076ca74fd549867a26e4fac9505c27288e983  libtorrent-0.13.8.tar.gz
+sha256  6a0b01e4c0da817fc06fa0cd0ca539d79a19eaed617e16da9e2d8ba066ea95dd  libtorrent-0.15.3.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
diff --git a/package/libtorrent/libtorrent.mk b/package/libtorrent/libtorrent.mk
index b966a72788..e4189ba957 100644
--- a/package/libtorrent/libtorrent.mk
+++ b/package/libtorrent/libtorrent.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LIBTORRENT_VERSION = 0.13.8
-LIBTORRENT_SITE = http://rtorrent.net/downloads
+# When updating the version, please also update rtorrent
+LIBTORRENT_VERSION = 0.15.3
+LIBTORRENT_SITE = https://github.com/rakshasa/rtorrent/releases/download/v$(LIBTORRENT_VERSION)
 LIBTORRENT_DEPENDENCIES = host-pkgconf zlib
 LIBTORRENT_CONF_OPTS = --enable-aligned \
 	--disable-instrumentation \
diff --git a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch b/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
deleted file mode 100644
index 4ff4182b61..0000000000
--- a/package/rtorrent/0001-Added--disable-execinfo-option-to-configure.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 582e4e40256b43d3e5322168f1e1ed71ca70ab64 Mon Sep 17 00:00:00 2001
-From: rakshasa <sundell.software@gmail.com>
-Date: Wed, 16 Jun 2021 23:29:01 +0900
-Subject: [PATCH] Added '--disable-execinfo' option to configure.
-
-[Retrieved (and backported) from:
-https://github.com/rakshasa/rtorrent/commit/582e4e40256b43d3e5322168f1e1ed71ca70ab64]
-Signed-off-by: Fabrice Fontaine <Fontaine.fabrice@gmail.com>
----
- configure.ac | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index e3e7d3f1..0f45bc6a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,7 +27,15 @@ TORRENT_WITHOUT_VARIABLE_FDSET
- 
- AC_SYS_LARGEFILE
- 
--TORRENT_CHECK_EXECINFO
-+AC_ARG_ENABLE(execinfo,
-+  AC_HELP_STRING([--disable-execinfo], [disable libexecinfo [[default=enable]]]),
-+  [
-+    if test "$enableval" = "yes"; then
-+      TORRENT_CHECK_EXECINFO
-+    fi
-+  ],[
-+    TORRENT_CHECK_EXECINFO
-+  ])
- 
- TORRENT_ENABLE_ARCH
- TORRENT_WITH_SYSROOT
- 
diff --git a/package/rtorrent/rtorrent.hash b/package/rtorrent/rtorrent.hash
index 0403664639..fa3d8da0d1 100644
--- a/package/rtorrent/rtorrent.hash
+++ b/package/rtorrent/rtorrent.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9edf0304bf142215d3bc85a0771446b6a72d0ad8218efbe184b41e4c9c7542af  rtorrent-0.9.8.tar.gz
+sha256  6dfd42c19e6ff2f5ee8b99855314cef4f10bd669663c2670cc85fd6a4e2c4e40  rtorrent-0.15.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rtorrent/rtorrent.mk b/package/rtorrent/rtorrent.mk
index 210b1d34dc..815bf0044b 100644
--- a/package/rtorrent/rtorrent.mk
+++ b/package/rtorrent/rtorrent.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-RTORRENT_VERSION = 0.9.8
-RTORRENT_SITE = http://rtorrent.net/downloads
+# When updating the version, please also update libtorrent
+RTORRENT_VERSION = 0.15.3
+RTORRENT_SITE = https://github.com/rakshasa/rtorrent/releases/download/v$(RTORRENT_VERSION)
 RTORRENT_DEPENDENCIES = host-pkgconf libcurl libtorrent ncurses
 RTORRENT_LICENSE = GPL-2.0
 RTORRENT_LICENSE_FILES = COPYING
-# We're patching configure.ac
-RTORRENT_AUTORECONF = YES
 RTORRENT_CONF_OPTS = --disable-execinfo
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
