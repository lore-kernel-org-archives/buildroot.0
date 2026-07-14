Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C9C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF5AF40975;
	Tue, 14 Jul 2026 11:50:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7oOtuJdIdwe6; Tue, 14 Jul 2026 11:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F02504093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784029819;
	bh=BZkx8W8l2uKsC7O+BX/4SiH3gqJUzCj0eM3tWgeJnc4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o3OmBVBkw2oUFSiah4awoFQWESlo3x13LzJrHOM9YXweJE8inkjuEGALB6hmxXo0D
	 1krDC4ygQcUTK9kZK11h554biSwGCSQpQIs2kcyvVhIXNOi8zs5O2zecXcYQ/3B5zF
	 tS2J/ewt6THerWz7xXgwKEgFKRJRsEXkoUXsuhwrYa5r7a6a1pbB7yr0+RkKP5kTKS
	 DQlNlvyNePG20qPFqrPxBMqzJYMnYXIWvOV5woiLhkj4rOOCmn4AQ3UiIt8U5lEP9M
	 uYE+AOvcgckqvyxlV0ZVpQCp9X79oJUNEcdX/o2yGPy7ntlN4Zef5GHwSaGIltt0S5
	 VO9XN7MKmjb5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F02504093B;
	Tue, 14 Jul 2026 11:50:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F9CF9CF
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7959C40470
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqSwWAjfWazS for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C24400BD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2C24400BD
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1002C8889E; Tue, 14 Jul 2026 11:49:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 13:41:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3058a669c56b457b4147cb67c334a852834072a4
X-Git-Newrev: bfd1d7367801e3ff1ca300671601391bb9bf17d4
X-Patchwork-Hint: ignore
Message-Id: <20260714114942.1002C8889E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: share source tarball
 with libzlib
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bfd1d7367801e3ff1ca300671601391bb9bf17d4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Both packages use the same tarball as source.

Added comments to keep the version number in sync.

Transformed minizip-zlib.hash into a link to ../libzlib/libzlib.hash.

Added MINIZIP_ZLIB_DL_SUBDIR = libzlib so minizip-zlib uses the same
tarball as libzlib.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libzlib/libzlib.mk             | 1 +
 package/minizip-zlib/minizip-zlib.hash | 5 +----
 package/minizip-zlib/minizip-zlib.mk   | 2 ++
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index c73328deee..d71d5d5233 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version here, please also update the minizip-zlib package
 LIBZLIB_VERSION = 1.3.2
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = https://www.zlib.net
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
deleted file mode 100644
index bc8b046426..0000000000
--- a/package/minizip-zlib/minizip-zlib.hash
+++ /dev/null
@@ -1,4 +0,0 @@
-# From http://www.zlib.net/
-sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
-# License files, locally calculated
-sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
new file mode 120000
index 0000000000..7214943cfa
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -0,0 +1 @@
+../libzlib/libzlib.hash
\ No newline at end of file
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 32af7ff0eb..d5c07fcca5 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
+# When updating the version here, please also update the libzlib package
 MINIZIP_ZLIB_VERSION = 1.3.2
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
 MINIZIP_ZLIB_SITE = https://www.zlib.net
+MINIZIP_ZLIB_DL_SUBDIR = libzlib
 MINIZIP_ZLIB_LICENSE = Zlib
 MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
