Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90475606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JlN2bZEM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6199D81137;
	Thu,  5 Nov 2026 22:54:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id laDs-sZ1XSqJ; Thu,  5 Nov 2026 22:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3D64D81160
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793919242;
	b=FYvJTjbyHPLqXQUlcxZp6M3usY7cEG3Ww6iZYJU7CmOP8hVAA2bVJrmxj890NUxOC1PD
	 Yn34yyu2gz4nQ5IYuULVG5nmLZ6QHaUIwcTTvq/9lnxGM1XHvplADYHmLcDHm37WoAvi/
	 QhlRcJ+G77zZrhXPnFksbua+cXhMo6D9zxkPWWphaUIM8LU5z9ZbLNgYb6RMxy2QBA29J
	 lhp2kkyuybSJTAtgwHDpxDlO6ZMs2XG2c0eUQEe/0Ocf5hGI9wtJQYo+cR2a4oRBds01x
	 G2cysoueLAY0B4GMGjBY6B5thXQVGTpX2MVPXE4gInnQrqJ4lt1ZowBAaDwwwBLP0Ew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793919242;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rIoFsL5tSAwHGw/U5PxRcAk7wYXtwgXay5QGDkNjwxE=;
	b=KIo1RjBlAEVWzTT6OhxfkaRaB58vUuad7qTmEa8baBhyyryVJGYZ2+OcXR5MLluKx0o2
	 /XyGZIZfpFgbg80LtF0SPRKRS2VUuIpxbFE2W87U6e2aHyleeijTJhcCvOc5REP8LYJO3
	 sCwnfvHZiqEAZ7WWpqfP0SUp0T+N4Az/Vypm6j5dpsE1HwhOAnmW81jE+Viy25JsA1cLD
	 R8dvofDp7afHT9DlNOpW5zjCweg9JYZ9ADwWRCqbb2ovb3WBsk0rvCt3YEJ/SI538udof
	 9XBmYNL9zmd5A/v7PYMCp+9fGuybvEssICrayR6A/IHDBAgIn6yui+lSfC8iE/XuktQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793919242;
	bh=rIoFsL5tSAwHGw/U5PxRcAk7wYXtwgXay5QGDkNjwxE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JlN2bZEMfux+9k1VsXKjASBJ18PDGc/LoeY4o8/YmDp/Vulqv/OTwbtuzKXzoL/El
	 S6lyd6vYyZhyJXDiEUl2ZYofoKzGHZtUiCYJnQnK9/mWFv6VK0PDPmBOHzPBKUyvax
	 fGy5y9mfYB7v8aTvMbp2Tl7a4uTG+Z0G2llN9cMk0bpHseSHJwiHjQrwDU4ppdA6YK
	 8sfRx+eIg4nQL5q9BJ6cVLuMNHVDOs7G8NV7WfxZvhjJ0PmSDAcboA7imkbO6ot3qU
	 xOGQO6f8ergg0X1Y/w9xyzZ3O/hoqAclpxb5D2wU1/Tqjq37CxWI2IQTmPPPzmd8sD
	 ANxIf7yP09Msg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D64D81160;
	Thu,  5 Nov 2026 22:54:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F95E209E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90D2681137
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZirfO4Qk0Bci for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 22:53:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6E29F8110F
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E29F8110F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 22:53:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E92089C6D9; Thu,  5 Nov 2026 22:52:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 23:50:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4b0e7b369761a4cea9809f73c836afc8adc3432
X-Git-Newrev: b6004b205f5df573bbd02face06daef9ccc342d1
X-Patchwork-Hint: ignore
Message-Id: <20261105225227.E92089C6D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{lib,
 minizip-}zlib: security bump version to 1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6004b205f5df573bbd02face06daef9ccc342d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/madler/zlib/releases/tag/v1.4
https://github.com/madler/zlib/blob/v1.4/ChangeLog
https://madler.net/pipermail/zlib-announce_madler.net/2026/000017.html
"This version remedies several security vulnerabilities, fixes other
 bugs, and has many other enhancements and portability improvements."

Removed patches which are included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...ffer-overflow-bug-in-non-blocking-gzwrite.patch | 31 ----------------------
 package/libzlib/libzlib.hash                       |  2 +-
 package/libzlib/libzlib.mk                         |  4 +--
 ...pendency-to-ints.h-in-minizip-Makefile.am.patch | 26 ------------------
 package/minizip-zlib/minizip-zlib.mk               |  2 +-
 5 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
deleted file mode 100644
index 32aaabcc76..0000000000
--- a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
-From: Mark Adler <git@madler.net>
-Date: Wed, 16 Sep 2026 16:26:14 -0700
-Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
-
-This addresses CVE-2026-85091.
-
-Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
-CVE: CVE-2026-85091
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- gzwrite.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/gzwrite.c b/gzwrite.c
-index b217b85ce..512329244 100644
---- a/gzwrite.c
-+++ b/gzwrite.c
-@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
-             n -= state->strm.avail_in;
-             state->x.pos += n;
-             len -= n;
--            if (ret == -1)
-+            if (ret == -1) {
-+                state->strm.avail_in = 0;
-+                state->strm.next_in = state->in;
-                 return state->again ? put - len : 0;
-+            }
-         } while (len);
-     }
- 
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index bc8b046426..11907ede28 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
+sha256  4f11c512053d7bab8d9e9b89bde3575add3e4c50a383b42ef6cb837035fc5a7c  zlib-1.4.tar.xz
 # License files, locally calculated
 sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index 9ce08d7093..ac411d3d11 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, please also update the minizip-zlib package
-LIBZLIB_VERSION = 1.3.2
+LIBZLIB_VERSION = 1.4
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
@@ -15,8 +15,6 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
-LIBZLIB_IGNORE_CVES += CVE-2026-85091
-
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
deleted file mode 100644
index 98e16251d8..0000000000
--- a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
-From: Rui Chen <rui@chenrui.dev>
-Date: Tue, 17 Feb 2026 10:48:39 -0500
-Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
-
-So that ints.h is part of the installation.
-
-Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- contrib/minizip/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
-index d343011eb..b7dea4f7e 100644
---- a/contrib/minizip/Makefile.am
-+++ b/contrib/minizip/Makefile.am
-@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
- minizip_includedir = $(includedir)/minizip
- minizip_include_HEADERS = \
- 	crypt.h \
-+	ints.h \
- 	ioapi.h \
- 	mztools.h \
- 	unzip.h \
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index d5c07fcca5..acbff105d4 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version here, please also update the libzlib package
-MINIZIP_ZLIB_VERSION = 1.3.2
+MINIZIP_ZLIB_VERSION = 1.4
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = https://www.zlib.net
 MINIZIP_ZLIB_DL_SUBDIR = libzlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
