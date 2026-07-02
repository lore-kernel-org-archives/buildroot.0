Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC62C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C667541248;
	Fri,  3 Jul 2026 14:28:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-CUHkAw9zut; Fri,  3 Jul 2026 14:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED14A411E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088924;
	bh=F84u1QkNw8OlJum46MceaLOGdcu+DQxANas3YQKYLVg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dh+nbH/DXhVXjBbGKvsjapni6TnP5vGnNVaWbEw4UMVrWHKZI/WPUfoU3tcd4038c
	 E0Q/27ImxmhPp2AU35q3/sIxaw+/XyFd394bJIo94t4h2zFMGaHQCujwrS/teZ9Gwt
	 PIm9YcdGH7fqDDGERezO41/N0KTkQmvpsXF6WbO4E6x60opOjBbVLxAvrH4imUqZtS
	 tuDJupOdZPSeM3xx5lW8w9Tb4ew/s9Ip9hS0rL+7b1ve/CHJ3nhy1CxbQHmL4jZYaW
	 iT2dZcoruaGJXQVu3Lijjq2PP1/p92pr+QLuuqkpJyypYLURQNRC85oan6Z1ZERi+r
	 gqtIyJgylNBuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED14A411E1;
	Fri,  3 Jul 2026 14:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EC3FD363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D29C640EF6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5A3PMTt7Wyg4 for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 908B741171
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 908B741171
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33184883A1; Fri,  3 Jul 2026 14:27:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:32:37 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: e4079113a671cd63e159ef605759c9442f74f30d
X-Git-Newrev: 9b6388b486734c853968a89f11a40754abcd4ecd
X-Patchwork-Hint: ignore
Message-Id: <20260703142758.33184883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/bind: security
 bump version to 9.20.24
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b6388b486734c853968a89f11a40754abcd4ecd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

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
(cherry picked from commit 54f96add94901511862df18e527e456982005b8e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
