Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419E7CCD195
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 10:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E67D060B55;
	Fri, 17 Oct 2025 10:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NPdA9zxmPzre; Fri, 17 Oct 2025 10:41:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A3B060BB4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A3B060BB4;
	Fri, 17 Oct 2025 10:41:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 23C17EC
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2123240090
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0CR0U_Z5BIU for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 10:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1948340078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1948340078
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1948340078
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 10:41:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 1ED1131E0A93; Fri, 17 Oct 2025 12:41:22 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:41:22 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aPIdUmM7-mXwZvou@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.43+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1760697683; bh=fm3vTyrLzefPrrK0JueTaxncVMxxtR4SpE1DfST1ulc=;
 h=Date:From:To:Subject:From;
 b=vCYfOpqUGwgoSQdCEPQ1AZRTg3b6UrNwE5E9/gVixpcxMjDJ8nUJgOIptITiwe977
 0ns9ciGI1I6OxpvWmyP+ebcqFnPp+TW74mXgbzA8KB+gbSbrfkfGqUP+IleOZOVHD4
 iRhdTXRh5cdNv4npxbH2NhdbzsW14p6DtdlZi8CZZ1c+AXGSl3LGUHXG4EjF0OClnL
 AyQcAEHOipxVEqcv2EEec6OgFtr9qUeiO2PaAZr/aOiCZOiytgJbgU++PTpEEgnXoL
 BFJaOSdumf4GZRf03B76Eq9edrb6zEr5S8ufoU/r3gKSwtlSHLpQEQwyj4STvzIdB3
 LWz3wx4d/V9Ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=openadk.org header.i=@openadk.org
 header.a=rsa-sha256 header.s=2022 header.b=vCYfOpqU
Subject: [Buildroot] [PATCH v2 6/6] package/thunderbird: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Popular mail client.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/thunderbird/Config.in        | 54 +++++++++++++++++
 package/thunderbird/thunderbird.hash |  3 +
 package/thunderbird/thunderbird.mk   | 88 ++++++++++++++++++++++++++++
 5 files changed, 147 insertions(+)
 create mode 100644 package/thunderbird/Config.in
 create mode 100644 package/thunderbird/thunderbird.hash
 create mode 100644 package/thunderbird/thunderbird.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0b257748f3..bad3289f6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3406,6 +3406,7 @@ F:	package/libaom/
 F:	package/libjwt/
 F:	package/mksh/
 F:	package/ruby/
+F:	package/thunderbird/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
 F:	package/zabbix/
diff --git a/package/Config.in b/package/Config.in
index 7528d6d891..269be56971 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2386,6 +2386,7 @@ menu "Mail"
 	source "package/libesmtp/Config.in"
 	source "package/msmtp/Config.in"
 	source "package/mutt/Config.in"
+	source "package/thunderbird/Config.in"
 endmenu
 
 menu "Miscellaneous"
diff --git a/package/thunderbird/Config.in b/package/thunderbird/Config.in
new file mode 100644
index 0000000000..c4efafbf65
--- /dev/null
+++ b/package/thunderbird/Config.in
@@ -0,0 +1,54 @@
+config BR2_PACKAGE_THUNDERBIRD
+	bool "thunderbird"
+	depends on BR2_aarch64 || BR2_x86_64
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_INSTALL_LIBSTDCPP # pango
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_PACKAGE_HAS_LIBGL
+	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_DAV1D
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_FONTCONFIG
+	select BR2_PACKAGE_HARFBUZZ
+	select BR2_PACKAGE_HOST_NODEJS
+	select BR2_PACKAGE_HOST_NODEJS_SRC
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	select BR2_PACKAGE_HOST_PYTHON3_CURSES
+	select BR2_PACKAGE_HOST_PYTHON3_SQLITE
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBAOM
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBNSPR
+	select BR2_PACKAGE_LIBNSS
+	select BR2_PACKAGE_LIBVPX
+	select BR2_PACKAGE_PANGO
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
+	select BR2_PACKAGE_XLIB_LIBXCURSOR
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBICE
+	select BR2_PACKAGE_XLIB_LIBSM
+	help
+	  Popular mail client.
+
+	  https://www.thunderbird.net
+
+comment "thunderbird needs a toolchain w/ wchar, threads, C++"
+	depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
+comment "thunderbird needs an OpenGL (GLX) provider"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_PACKAGE_HAS_LIBGL
diff --git a/package/thunderbird/thunderbird.hash b/package/thunderbird/thunderbird.hash
new file mode 100644
index 0000000000..05c5d12f4c
--- /dev/null
+++ b/package/thunderbird/thunderbird.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  b0eb946d9e6d4b2adbfad0893a5c79caa11203a3906b0b5f26f0ccc4c9b28ff0  thunderbird-140.4.0esr.source.tar.xz
+sha256  d10965daab0b819bef778c629a94cdd094ffb4ede37239b3d263884a574352c0  toolkit/content/license.html
diff --git a/package/thunderbird/thunderbird.mk b/package/thunderbird/thunderbird.mk
new file mode 100644
index 0000000000..2567b0865d
--- /dev/null
+++ b/package/thunderbird/thunderbird.mk
@@ -0,0 +1,88 @@
+################################################################################
+#
+# thunderbird
+#
+################################################################################
+
+THUNDERBIRD_VERSION = 140.4.0esr
+THUNDERBIRD_SOURCE = thunderbird-$(THUNDERBIRD_VERSION).source.tar.xz
+THUNDERBIRD_SITE = https://ftp.mozilla.org/pub/thunderbird/releases/$(THUNDERBIRD_VERSION)/source
+THUNDERBIRD_LICENSE = MPL-2.0
+THUNDERBIRD_LICENSE_FILES = toolkit/content/license.html
+THUNDERBIRD_DEPENDENCIES = \
+	host-nodejs \
+	host-cbindgen \
+	host-clang \
+	host-nasm \
+	alsa-lib \
+	dbus-glib \
+	fontconfig \
+	harfbuzz \
+	jpeg \
+	libgtk3 \
+	libnspr \
+	libnss \
+	libvpx \
+	pango \
+	pixman \
+	zlib \
+	xlib_libXcomposite \
+	xlib_libXcursor \
+	xlib_libXdamage \
+	xlib_libXrandr \
+	xlib_libICE \
+	xlib_libSM
+
+THUNDERBIRD_CONF_OPTS = \
+	--enable-application=comm/mail \
+      	--enable-official-branding \
+	--enable-hardening \
+	--disable-audio-backends \
+	--disable-webrtc \
+	--disable-printing \
+	--without-wasm-sandboxed-libraries \
+	--disable-profiling \
+	--disable-pulseaudio \
+	--disable-crashreporter \
+	--disable-tests \
+	--with-system-ffi \
+	--with-system-icu \
+	--with-system-jpeg \
+	--with-system-libvpx \
+	--with-system-nspr \
+	--with-system-nss \
+	--with-system-pixman \
+	--with-system-zlib \
+	--with-clang-path=$(HOST_DIR)/bin/clang
+
+# build directory can't be the directory where configure are there, so..
+define THUNDERBIRD_CONFIGURE_CMDS
+	(mkdir -p $(@D)/build; cd $(@D)/build; rm -rf config.cache; \
+		PATH=$(BR_PATH) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		CROSS_COMPILE=1 \
+		../configure \
+		--target=$(GNU_TARGET_NAME) \
+		--with-toolchain-prefix=$(GNU_TARGET_NAME)- \
+		--prefix=/usr \
+		$(THUNDERBIRD_CONF_OPTS) \
+	)
+endef
+
+define THUNDERBIRD_BUILD_CMDS
+	$(MAKE) -C $(@D)/build \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		all
+endef
+
+define THUNDERBIRD_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D)/build \
+		DESTDIR=$(TARGET_DIR) \
+		CC="$(TARGET_CC)" \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
