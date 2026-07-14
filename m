Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B14C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A492E40412;
	Tue, 14 Jul 2026 11:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8BSGo43WDXV; Tue, 14 Jul 2026 11:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061444093B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784029820;
	bh=HxzNUx3Oy0PussOnhOjhtl16prw/4b5IA/g+2YDP954=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r/p9Xns+Rych5Jemp4v3eLgQOB8Vk0SdA1L6s7zPbRhV2gIcF40Apylg10/BaOdL+
	 zay8/kwxI62PMYXzdGdkfvqMqP/V+RNARL7ae2loaknqzn4UYB5YoXmVDCsgw54mLA
	 oVhHlDv4hIqQooRMviI4LbMD303jcaqdx4MuAjh1ZNvzzHs4581mpRCM8JHhdORHOK
	 4AO0gWVLy1yRmKSdo1rjZMq+eAeNmInyhj3oPUD9UHwXLqMnYcBs+WlWDc/JvAXB1R
	 ZJ369ySJYRvSyCL/qgaLkqd3zBhZbUDmsbtyQ+sQ4yaq/R8JGQFjaQB+SlRDfj+Qnl
	 HA/F09cWMe6mQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 061444093B;
	Tue, 14 Jul 2026 11:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D9F0B88
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B04480FA9
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8nj7XNSc05P for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:50:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCB5E80E14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCB5E80E14
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 065188889D; Tue, 14 Jul 2026 11:49:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 13:41:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21bf78411ea52c1f67afac7b76a6f56f75b28434
X-Git-Newrev: 3058a669c56b457b4147cb67c334a852834072a4
X-Patchwork-Hint: ignore
Message-Id: <20260714114942.065188889D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: bump version to 1.3.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3058a669c56b457b4147cb67c334a852834072a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog

Added upstream patch which adds ints.h as installed header to prevent
build errors which would be caused by this bump.

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...pendency-to-ints.h-in-minizip-Makefile.am.patch | 26 ++++++++++++++++++++++
 package/minizip-zlib/minizip-zlib.hash             |  4 ++--
 package/minizip-zlib/minizip-zlib.mk               |  4 ++--
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
new file mode 100644
index 0000000000..98e16251d8
--- /dev/null
+++ b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
@@ -0,0 +1,26 @@
+From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Tue, 17 Feb 2026 10:48:39 -0500
+Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
+
+So that ints.h is part of the installation.
+
+Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ contrib/minizip/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
+index d343011eb..b7dea4f7e 100644
+--- a/contrib/minizip/Makefile.am
++++ b/contrib/minizip/Makefile.am
+@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
+ minizip_includedir = $(includedir)/minizip
+ minizip_include_HEADERS = \
+ 	crypt.h \
++	ints.h \
+ 	ioapi.h \
+ 	mztools.h \
+ 	unzip.h \
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 6d4a2d2e20..32af7ff0eb 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.3.1
+MINIZIP_ZLIB_VERSION = 1.3.2
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
-MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_SITE = https://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
 MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
