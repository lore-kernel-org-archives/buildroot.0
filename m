Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABAC44508
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 15:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 192A240738;
	Tue, 14 Jul 2026 15:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBLWDsoq1BUx; Tue, 14 Jul 2026 15:19:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25624409BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784042363;
	bh=WQXV1JoGPpDgi4Xn7wciJIW6CvS7byjqzIuOrnj3ivg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W3FlGk5tLaM5Dnl196Xl4mTBt7Yq2mx9lEqEiAuDTb5Nd8+JXJeDVzoRQhAiqhrl1
	 kmum3YWsW9a1lZ/gqCWdPZO1+HlNLuNFlfPMpb/jrQXYa3XR/Wa9A16Cfdfpfl0dje
	 QkhaHhwgxZGuK7c2I6mvpNGX1McMq7y4GvcKKBfSSxDdT8FivHe6udTClu8Dis5LZa
	 G4YbiiUzzVUFSh2aveCGfKMSKj+4SmdkpxTzr2n3mkhFFssOQJcc0ug472qTc8uZHr
	 QtZWmlDn8D2RjJ4AVMAsYth+DMyDhk4rA6pJEaD/lTOEhhp6QT4v8mbrZv4Pv6p+tQ
	 JpifpgmKhRBxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25624409BE;
	Tue, 14 Jul 2026 15:19:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BA7D270
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8156F404C5
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YhgmP-QUGbiR for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 15:19:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDAC40086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEDAC40086
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 15:19:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE8BB888B8; Tue, 14 Jul 2026 15:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jul 2026 16:41:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 09ea72e44c944cefaa60071b0e037b1c8f20327c
X-Git-Newrev: c912c6b4a52761ff98251251ec14b10cc4907bc8
X-Patchwork-Hint: ignore
Message-Id: <20260714151846.DE8BB888B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wget2: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c912c6b4a52761ff98251251ec14b10cc4907bc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |   1 +
 package/Config.in        |   1 +
 package/wget2/Config.in  |  15 +++++++
 package/wget2/wget2.hash |   4 ++
 package/wget2/wget2.mk   | 100 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 121 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fdfab8b489..1601e6b408 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -533,6 +533,7 @@ F:	package/unixodbc/
 F:	package/utfcpp/
 F:	package/vlc/
 F:	package/wget/
+F:	package/wget2/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
 F:	package/x264/
diff --git a/package/Config.in b/package/Config.in
index b6f23308af..015f635ad1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2665,6 +2665,7 @@ endif
 	source "package/vtun/Config.in"
 	source "package/wavemon/Config.in"
 	source "package/wget/Config.in"
+	source "package/wget2/Config.in"
 	source "package/whois/Config.in"
 	source "package/wireguard-linux-compat/Config.in"
 	source "package/wireguard-tools/Config.in"
diff --git a/package/wget2/Config.in b/package/wget2/Config.in
new file mode 100644
index 0000000000..9be8971489
--- /dev/null
+++ b/package/wget2/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_WGET2
+	bool "wget2"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
+	help
+	  GNU Wget2 is the successor of GNU Wget, a file and recursive
+	  website downloader.
+
+	  https://gitlab.com/gnuwget/wget2
+
+comment "wget2 needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
diff --git a/package/wget2/wget2.hash b/package/wget2/wget2.hash
new file mode 100644
index 0000000000..0e5742aed4
--- /dev/null
+++ b/package/wget2/wget2.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  d7544b13e37f18e601244fce5f5f40688ac1d6ab9541e0fbb01a32ee1fb447b4  wget2-2.2.1.tar.gz
+sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/wget2/wget2.mk b/package/wget2/wget2.mk
new file mode 100644
index 0000000000..21005bd708
--- /dev/null
+++ b/package/wget2/wget2.mk
@@ -0,0 +1,100 @@
+################################################################################
+#
+# wget2
+#
+################################################################################
+
+WGET2_VERSION = 2.2.1
+WGET2_SITE = $(BR2_GNU_MIRROR)/wget
+WGET2_DEPENDENCIES = host-pkgconf
+WGET2_LICENSE = GPL-3.0+, LGPL-3.0+
+WGET2_LICENSE_FILES = COPYING COPYING.LESSER
+WGET2_CPE_ID_VENDOR = gnu
+
+WGET2_CONF_OPTS = \
+	--without-libhsts \
+	--without-libmicrohttpd \
+	--without-lzip
+
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+WGET2_CONF_OPTS += --with-brotlidec
+WGET2_DEPENDENCIES += brotli
+else
+WGET2_CONF_OPTS += --without-brotlidec
+endif
+
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+WGET2_CONF_OPTS += --with-bzip2
+WGET2_DEPENDENCIES += bzip2
+else
+WGET2_CONF_OPTS += --without-bzip2
+endif
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+WGET2_CONF_OPTS += --with-ssl=gnutls
+WGET2_DEPENDENCIES += gnutls
+else ifeq ($(BR2_PACKAGE_OPENSSL),y)
+WGET2_CONF_OPTS += --with-ssl=openssl
+WGET2_DEPENDENCIES += openssl
+else
+WGET2_CONF_OPTS += --without-ssl
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGPGME),y)
+WGET2_CONF_OPTS += --with-gpgme
+WGET2_DEPENDENCIES += libgpgme
+else
+WGET2_CONF_OPTS += --without-gpgme
+endif
+
+# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
+ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
+WGET2_CONF_OPTS += --with-libidn2
+WGET2_DEPENDENCIES += libidn2
+else
+WGET2_CONF_OPTS += --without-libidn2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPSL),y)
+WGET2_CONF_OPTS += --with-libpsl
+WGET2_DEPENDENCIES += libpsl
+else
+WGET2_CONF_OPTS += --without-libpsl
+endif
+
+ifeq ($(BR2_PACKAGE_NGHTTP2),y)
+WGET2_CONF_OPTS += --with-libnghttp2
+WGET2_DEPENDENCIES += nghttp2
+else
+WGET2_CONF_OPTS += --without-libnghttp2
+endif
+
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+WGET2_CONF_OPTS += --with-libpcre2
+WGET2_DEPENDENCIES += pcre2
+else
+WGET2_CONF_OPTS += --without-libpcre2
+endif
+
+ifeq ($(BR2_PACKAGE_XZ),y)
+WGET2_CONF_OPTS += --with-lzma
+WGET2_DEPENDENCIES += xz
+else
+WGET2_CONF_OPTS += --without-lzma
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+WGET2_CONF_OPTS += --with-zlib
+WGET2_DEPENDENCIES += zlib
+else
+WGET2_CONF_OPTS += --without-zlib
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+WGET2_CONF_OPTS += --with-zstd
+WGET2_DEPENDENCIES += zstd
+else
+WGET2_CONF_OPTS += --without-zstd
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
