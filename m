Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB24DCDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 15:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EBDB82C9C;
	Thu, 25 Jun 2026 15:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIWah5yJMPOm; Thu, 25 Jun 2026 15:47:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C0D482EFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782402436;
	bh=iIl60wBRpcSqRO8Qi+o0xluqcSckoHn9lXIao1B2MmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dXSWOGUEVB/+sjQsGuARdhrbv47gatXONUiMHGTg7o4eszqM7zT2gKzTJpmIP14T6
	 lHjLDNWHDycCHl6LiEnbpaLRySSdpR2yZzJhkdghJF6gbRHjvKZMqc9Z2s+YaGhsQF
	 TBy6n/xfEU8zJxlem7zzt6apsqaZwk704TeuEfOZo5oyrPyxv3kTvSRdJqm22Jcj91
	 /dDCt7VovwXP5KqytSeEZCA/a7K7Y2SL+oiOUKn+vqu8FNBqGkIvtS5YSdAgQwxvsF
	 tOAt/hpgiOVbG1xBxSw0SpiY4+vrjIyokw1gXzS+YAvppaN5y0zLniHINauXCDP9eP
	 fjrJlY37Jv2EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C0D482EFC;
	Thu, 25 Jun 2026 15:47:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 663DB254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9AE408AB
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sttuwow8hYVk for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 15:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A66E84025E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A66E84025E
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 15:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1FC3B857AC; Thu, 25 Jun 2026 15:46:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 17:46:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1db28a86877f6c2ec0797802ec667374aee59546
X-Git-Newrev: 54f96add94901511862df18e527e456982005b8e
X-Patchwork-Hint: ignore
Message-Id: <20260625154649.1FC3B857AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: security bump version to
 9.20.24
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54f96add94901511862df18e527e456982005b8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.20.24/doc/arm/html/changelog.html

Fixes CVE-2026-3593.

NOTE: Libraries libcap, liburcu are now mandatory.

NOTE 2: the bind version 9.18.x series is marked by upstream as
end-of-life. This commit switches to the current stable release
series 9.20.x. See:
https://kb.isc.org/docs/bind-9-end-of-life-dates
https://www.isc.org/bind/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: add note 2 in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bind/Config.in | 15 ++++++++++-----
 package/bind/bind.hash |  4 ++--
 package/bind/bind.mk   |  4 ++--
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 512e948ca2..6f5f14a6bb 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -1,10 +1,14 @@
 config BR2_PACKAGE_BIND
 	bool "bind"
-	depends on BR2_USE_MMU # fork(), libuv
+	depends on BR2_USE_MMU # fork(), libcap, libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
+	depends on BR2_TOOLCHAIN_HAS_THREADS # liburcu, libuv
+	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
+	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_OPENSSL
 	help
@@ -44,8 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+comment "bind needs a toolchain w/ threads, dynamic library, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
+		|| BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 766540ee22..a1ff3c6101 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.50/bind-9.18.50.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.24/bind-9.20.24.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  a24f93be94712a8c11752294410f2f8a2510ec7fdc931d207fc61cdf30e54f4d  bind-9.18.50.tar.xz
+sha256  989fef1fc88ea59d04cd86f854dca5a4616a20a9968bcdde3c1a3668ab36be08  bind-9.20.24.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 54870bfa4e..2b8156d0d0 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.50
+BIND_VERSION = 9.20.24
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
@@ -32,7 +32,7 @@ BIND_CONF_OPTS = \
 	--disable-static \
 	--with-openssl=$(STAGING_DIR)/usr
 
-BIND_DEPENDENCIES = host-pkgconf libuv openssl
+BIND_DEPENDENCIES = host-pkgconf libcap liburcu libuv openssl
 
 BIND_CFLAGS = $(TARGET_CFLAGS)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
