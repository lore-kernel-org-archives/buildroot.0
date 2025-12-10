Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DF2D3B9AB
	for <buildroot@archiver.kernel.org>; Wed, 10 Dec 2025 21:49:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FB8340C8C;
	Wed, 10 Dec 2025 21:49:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1pJmKtw7geO; Wed, 10 Dec 2025 21:49:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 639F240C8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765403344;
	bh=P/J40MgL9n9pzKefF3KgQ6SgiXbHCF0nkDex9qjv/5Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hzKv7tmLaRSRNqL7+/P0sR2PxTgy1Qki8CXDrmHAu5XDdwcvXRy5nfjQgLxn1V7EC
	 515bcHturEX9CrHczeBCwBtHOtAQHfyoLtaiUmqnlg7kkgrac7GanZrL+LZtDhdW6P
	 JzBNI+EI7WOt14MpC7Pjo6OuYRij/1yH5/UqfLJELbeB1lhHWl3MxFIjQpK7R00Ycz
	 1NTviWrUPvMJrJ75JvKZ3Ol84p1EKrDYSV3zb7SkJiXGjvSyJZk7/5bHudx6eNhPp4
	 RSNOKzMVJU0ACvp92yN6ZF/Dvo9oNsQ3ckYyp2epjUb93EInDOnCSA8AssxJLzIpbR
	 zKwrU7DKHh8tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 639F240C8E;
	Wed, 10 Dec 2025 21:49:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C84EE7
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 21:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E94040BA8
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 21:49:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4wqDLprgz2O8 for <buildroot@buildroot.org>;
 Wed, 10 Dec 2025 21:49:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A6B0408C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A6B0408C0
 for <buildroot@buildroot.org>; Wed, 10 Dec 2025 21:49:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5487686A1D; Wed, 10 Dec 2025 21:49:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Dec 2025 22:48:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c621515d839b94f2013286683aaf6329e855b08b
X-Git-Newrev: 9e9fb093804738434f5f429d2ce59546e4eb8147
X-Patchwork-Hint: ignore
Message-Id: <20251210214901.5487686A1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libubox: bump version
 to git ecddb31dc3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e9fb093804738434f5f429d2ce59546e4eb8147
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This bump includes patches which add cmake4 compatibility.

json-c is now a mandatory dependency due to upstream commit:
https://git.openwrt.org/?p=project/libubox.git;a=commitdiff;h=b7acc8e6fd5e13611ad90a593e98f9589af4009a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libubox/Config.in     | 3 +++
 package/libubox/libubox.hash  | 2 +-
 package/libubox/libubox.mk    | 4 ++--
 package/libuci/Config.in      | 2 ++
 package/ubus/Config.in        | 2 +-
 package/uhttpd/Config.in      | 2 +-
 package/uqmi/Config.in        | 2 +-
 package/ustream-ssl/Config.in | 4 +++-
 8 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/package/libubox/Config.in b/package/libubox/Config.in
index 1f0b691e13..09d6336706 100644
--- a/package/libubox/Config.in
+++ b/package/libubox/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_LIBUBOX
 	bool "libubox"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	select BR2_PACKAGE_JSON_C
 	help
 	  This library originates from the OpenWrt project to
 	  handle the configuration file infrastructure, but can
@@ -11,3 +13,4 @@ config BR2_PACKAGE_LIBUBOX
 
 comment "libubox needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index eb37d33230..127abf432c 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  df6e1350fd11016ef30242a279cec195d91e6748c11c40e0991593718c46fa52  libubox-3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a-git4.tar.gz
+sha256  c4432d4f902bd0a2974d3fe76620bbb5e04b9d52e55701829aa12507651bc4d9  libubox-ecddb31dc34d89be5c9dc4595a4c58070eb090e4-git4.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 00ae2b0595..8710720287 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 3868f47c8f6c6570e62a3cdf8a7f26ffb1a67e6a
+LIBUBOX_VERSION = ecddb31dc34d89be5c9dc4595a4c58070eb090e4
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
 LIBUBOX_INSTALL_STAGING = YES
-LIBUBOX_DEPENDENCIES = $(if $(BR2_PACKAGE_JSON_C),json-c)
+LIBUBOX_DEPENDENCIES = json-c
 
 ifeq ($(BR2_USE_MMU)$(BR2_PACKAGE_LUA_5_1),yy)
 LIBUBOX_DEPENDENCIES += lua
diff --git a/package/libuci/Config.in b/package/libuci/Config.in
index f94d7dc391..25c248751c 100644
--- a/package/libuci/Config.in
+++ b/package/libuci/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUCI
 	bool "libuci"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	help
 	  This library originates from the OpenWrt project to
@@ -14,3 +15,4 @@ config BR2_PACKAGE_LIBUCI
 
 comment "libuci needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ubus/Config.in b/package/ubus/Config.in
index 391893e808..21b20abaf3 100644
--- a/package/ubus/Config.in
+++ b/package/ubus/Config.in
@@ -4,7 +4,7 @@ comment "ubus needs a toolchain w/ dynamic library"
 
 config BR2_PACKAGE_UBUS
 	bool "ubus"
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libubox -> json-c
 	depends on !BR2_STATIC_LIBS # libubox
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
diff --git a/package/uhttpd/Config.in b/package/uhttpd/Config.in
index eeb169a96d..30101f983d 100644
--- a/package/uhttpd/Config.in
+++ b/package/uhttpd/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_UHTTPD
 	bool "uhttpd"
 	depends on !BR2_STATIC_LIBS # dlopen()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c, libubox -> json-c
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_JSON_C
diff --git a/package/uqmi/Config.in b/package/uqmi/Config.in
index 21f0bd9077..5029a06800 100644
--- a/package/uqmi/Config.in
+++ b/package/uqmi/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_UQMI
 	bool "uqmi"
-	depends on !BR2_STATIC_LIBS # libubox
+	depends on !BR2_STATIC_LIBS # libubox, libubox -> json-c
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBUBOX
diff --git a/package/ustream-ssl/Config.in b/package/ustream-ssl/Config.in
index 540e43689f..c328a6ea12 100644
--- a/package/ustream-ssl/Config.in
+++ b/package/ustream-ssl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USTREAM_SSL
 	bool "ustream-ssl"
-	depends on !BR2_STATIC_LIBS #libubox
+	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	help
@@ -10,3 +11,4 @@ config BR2_PACKAGE_USTREAM_SSL
 
 comment "ustream-ssl needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
