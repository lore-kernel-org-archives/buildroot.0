Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076D0F483EA
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCA0260831;
	Mon, 23 Mar 2026 19:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IhBO_DNZBZni; Mon, 23 Mar 2026 19:48:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1DF8608EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295296;
	bh=rvwCu7jYiTJ8FjjedTTW36EPAPMPCcFCeMFwTJoqzto=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jSJxeyglHYctUO0ujXgivb45NPj8xWxBeLFeF3gv7CK6zGhh2dZ/uDrZawyRfIC/Y
	 9a4LS51oX4673Qc2tVMgi/pZz3GIsjGU5tHVyawUlfaKsXOuj4X+wpxy8S1NTfJBN8
	 350lC7+N8nVoK/OqxGRrkUV/IB/ITkOyysOYB3vTuyqTUMS31gMG14t9ohtacHbPNr
	 +lT31vXIi3v6fQc8W9aYC5RwOJANh2i/pEgFusQSMduZ7pe8j9XNEQi/YvU//exuTB
	 Lq2zD2sPBG6hg1zhwrq6WsoP5Ows+IKFDwxaz3fOFX08hjXQBkYblSCi7OEtfecPdX
	 2g4wviGGaThBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1DF8608EB;
	Mon, 23 Mar 2026 19:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71733F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF5540262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x52QjNJUYZrG for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64A514027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64A514027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8645680D9F; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 21:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 114861915662d63b2f9aac28409d128a95482f14
X-Git-Newrev: 17fb6420f7cdd524a24ef7d24cdfa592e1ea738c
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.8645680D9F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzippp: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/17fb6420f7cdd524a24ef7d24cdfa592e1ea738c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package will be used as an optional dependency by the upcoming
gerbera bump.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/libzippp/Config.in     | 13 +++++++++++++
 package/libzippp/libzippp.hash |  3 +++
 package/libzippp/libzippp.mk   | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0c51a1db03..4fdbf5fa44 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -457,6 +457,7 @@ F:	package/libvorbis/
 F:	package/libvpl/
 F:	package/libvpx/
 F:	package/libyuv/
+F:	package/libzippp/
 F:	package/linux-firmware/
 F:	package/mc/
 F:	package/mesa3d/
diff --git a/package/Config.in b/package/Config.in
index b98a89abdb..a98b6d23d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1603,6 +1603,7 @@ menu "Compression and decompression"
 	source "package/libmspack/Config.in"
 	source "package/libsquish/Config.in"
 	source "package/libzip/Config.in"
+	source "package/libzippp/Config.in"
 	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
diff --git a/package/libzippp/Config.in b/package/libzippp/Config.in
new file mode 100644
index 0000000000..71b9fed776
--- /dev/null
+++ b/package/libzippp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBZIPPP
+	bool "libzippp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # libzip
+	select BR2_PACKAGE_LIBZIP
+	select BR2_PACKAGE_ZLIB
+	help
+	  C++ wrapper for libzip
+
+	  https://github.com/ctabin/libzippp
+
+comment "libzippp needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
diff --git a/package/libzippp/libzippp.hash b/package/libzippp/libzippp.hash
new file mode 100644
index 0000000000..9d2f81a787
--- /dev/null
+++ b/package/libzippp/libzippp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  9ded3c4b5641e65d2b3a3dd0cbc4106209ee17c17df70e5187e7171420752546  libzippp-v7.1-1.10.1.tar.gz
+sha256  184f3ecf3d8cf4affad2b322ede037fb79a14e8b5b20c38ccbb66e33c23180d9  LICENCE
diff --git a/package/libzippp/libzippp.mk b/package/libzippp/libzippp.mk
new file mode 100644
index 0000000000..d07dfc44a0
--- /dev/null
+++ b/package/libzippp/libzippp.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# libzip
+#
+################################################################################
+
+LIBZIPPP_VERSION = 7.1-1.10.1
+LIBZIPPP_SOURCE = libzippp-v$(LIBZIPPP_VERSION).tar.gz
+LIBZIPPP_SITE = https://github.com/ctabin/libzippp/archive/refs/tags
+LIBZIPPP_LICENSE = BSD-3-Clause
+LIBZIPPP_LICENSE_FILES = LICENCE
+LIBZIPPP_INSTALL_STAGING = YES
+LIBZIPPP_DEPENDENCIES = libzip zlib
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+LIBZIPPP_DEPENDENCIES += bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+LIBZIPPP_DEPENDENCIES += gnutls
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBZIPPP_DEPENDENCIES += openssl
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+LIBZIPPP_DEPENDENCIES += xz
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBZIPPP_DEPENDENCIES += zstd
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
