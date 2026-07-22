Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F53C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E9F80DDF;
	Wed, 22 Jul 2026 20:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Y-DG54cgf14; Wed, 22 Jul 2026 20:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C74DF80DAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751633;
	bh=OvnWecw7VMT4OAHcBpL8uYrcB0Lhserdq86U3waUR1c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ewPGxWQ889TS/ftaYptYC0r6695cg5Go5qVqIEJG9+pkIKVH831qd+B6FKu4ztPqg
	 IwkV0IQN2ZUF1oYSvRNfedy5FaQKqa9FDZYILAQaYam/XRC6HTBcFTSQtZcDLi4zqw
	 BrJDs2tDVoK1O4Du+DVRpFXXnJog/s3AzhCP4N6dlQVs3xGhwLJIjduQ6P6SgnKKlV
	 ytwAyP1X+FD74c5qltK8diFsi6jStQ0v/b6vwiDbzftJIqQh4Sn7ESdLTdhDSAf37A
	 a53jbqIzRY+sDNuqPW804SeT0NYqvgjiTSatARuxSQfyqMB25NGMbsqKl9dImuYHlF
	 mkJ2eFb7GXQvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74DF80DAF;
	Wed, 22 Jul 2026 20:20:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C0C51B8
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2220480DC5
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J73qq3oEM4Jz for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 513E480DAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 513E480DAF
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:20:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B78E8A2F3; Wed, 22 Jul 2026 20:19:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 21:58:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e17aba6b6ba757a61c1e9814dce0947bf010e48
X-Git-Newrev: b34c1454eacc8a9d98e9b73b586c3312538b549c
X-Patchwork-Hint: ignore
Message-Id: <20260722201952.7B78E8A2F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcppconnman: add new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b34c1454eacc8a9d98e9b73b586c3312538b549c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libcppconnman is a C++ library that provides an easy-to-use API
to communicate with ConnMan over D-Bus using GDBus.

https://github.com/amarula/libcppconnman

Also add myself to DEVELOPERS for this package.

Signed-off-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/libcppconnman/Config.in          | 29 +++++++++++++++++++++++++++++
 package/libcppconnman/libcppconnman.hash |  3 +++
 package/libcppconnman/libcppconnman.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 59 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75fcdbef2e..f2713c7239 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -186,6 +186,7 @@ F:	package/wine/
 
 N:	Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
 F:	package/cutekeyboard/
+F:	package/libcppconnman/
 
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
diff --git a/package/Config.in b/package/Config.in
index 015f635ad1..fc1e57d30d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2007,6 +2007,7 @@ menu "Networking"
 	source "package/ibrdtn/Config.in"
 	source "package/libcgicc/Config.in"
 	source "package/libcoap/Config.in"
+	source "package/libcppconnman/Config.in"
 	source "package/libcpprestsdk/Config.in"
 	source "package/libcurl/Config.in"
 	source "package/libdnet/Config.in"
diff --git a/package/libcppconnman/Config.in b/package/libcppconnman/Config.in
new file mode 100644
index 0000000000..9a51c8bd44
--- /dev/null
+++ b/package/libcppconnman/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_LIBCPPCONNMAN
+	bool "libcppconnman"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libcppconnman provide easy to use C++ API to communicate
+	  with ConnMan via the DBus using GDBus.
+
+	  https://amarula.github.io/libcppconnman/
+
+comment "libcppconnman needs a toolchain w/ C++20, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+
+if BR2_PACKAGE_LIBCPPCONNMAN
+
+config BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE
+	bool "libcppconnman example"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # std::atomic<bool>
+	select BR2_PACKAGE_READLINE
+	help
+	  Compile CLI example.
+
+endif
diff --git a/package/libcppconnman/libcppconnman.hash b/package/libcppconnman/libcppconnman.hash
new file mode 100644
index 0000000000..70960d4a17
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5eb38232c3f9fcf2136c6508472841f6ee88d7155c384f4e6f2f3de1cd2fba62  libcppconnman-2.0.0.tar.gz
+sha256  7ffe1954587c77dfba1cf8eb9b2ea743671fa6e63f9e7a2f258119d42e14eefe  LICENSE
diff --git a/package/libcppconnman/libcppconnman.mk b/package/libcppconnman/libcppconnman.mk
new file mode 100644
index 0000000000..1b41db3a0c
--- /dev/null
+++ b/package/libcppconnman/libcppconnman.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# libcppconnman
+#
+################################################################################
+
+LIBCPPCONNMAN_VERSION = 2.0.0
+LIBCPPCONNMAN_SITE = $(call github,amarula,libcppconnman,v$(LIBCPPCONNMAN_VERSION))
+LIBCPPCONNMAN_LICENSE = LGPL-2.1-or-later
+LIBCPPCONNMAN_LICENSE_FILES = LICENSE
+
+LIBCPPCONNMAN_INSTALL_STAGING = YES
+
+LIBCPPCONNMAN_DEPENDENCIES = host-pkgconf libglib2
+
+LIBCPPCONNMAN_CONF_OPTS = -DBUILD_CONNMAN=ON
+
+ifeq ($(BR2_PACKAGE_LIBCPPCONNMAN_EXAMPLE),y)
+LIBCPPCONNMAN_DEPENDENCIES += readline
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=ON
+else
+LIBCPPCONNMAN_CONF_OPTS += -DBUILD_EXAMPLES=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
