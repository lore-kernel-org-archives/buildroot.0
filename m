Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BAEEE4992
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8E660BAA;
	Tue, 30 Dec 2025 18:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jVWegdJXtu1; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFF9460B85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118357;
	bh=DRB01+rGs+WiZt6v6mn5fG4nAmPKL906zvhSkq/OeL0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dy082R6Shv/hEdezMYlmvVYYy15dcKtzyH5l7bmzwoEgFBL6VyQ1ixOIFjPFzCgwb
	 E1mErbs2j1ChdfRMOmZ3RdvAI7T+PqmOlIb7mM0sRPNzT1p9dJujXoDryP6k7NBtmb
	 fSOncPX9dhDryGkhxW66oOO+wCZILG8Lbw5PnETIWth8WPhPLWrmF88/MhL1uUBVmX
	 R2KagG/Q1s4lFst6gKU6/ITQlw7OKDqH1xw/X3UuzVY7bWyaVrNnyCUxcycMRMQPrz
	 JC/WRguTEMcOG5EimXXO/YpSmbQMWywML4eEPTv4ARDPMH08hDRhoMKV99ERetF6oS
	 dLd+le2/m8o2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFF9460B85;
	Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8238177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA12D4042E
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XajrSYhdu5X for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22AA403F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F22AA403F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D521487C44; Tue, 30 Dec 2025 18:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3c150c78556d0cae299a28fa2b677821bc82606
X-Git-Newrev: 9f9e324091d195a9b1034c652796d4a2fe7a1a4b
X-Patchwork-Hint: ignore
Message-Id: <20251230181234.D521487C44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sconeserver: remove package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9f9e324091d195a9b1034c652796d4a2fe7a1a4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Analysis of https://github.com/sconemad/sconeserver:
last non-buildroot related commit: Aug 2019
last bug report: 0 open
last pull request: 1 open (buildroot-related)

The package is broken with cmake 4 and no other package depends on it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                     |  6 +++
 DEVELOPERS                           |  1 -
 package/Config.in                    |  1 -
 package/sconeserver/Config.in        | 96 ------------------------------------
 package/sconeserver/sconeserver.hash |  3 --
 package/sconeserver/sconeserver.mk   | 93 ----------------------------------
 6 files changed, 6 insertions(+), 194 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3e402e3161..fc5979c926 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_SCONESERVER
+	bool "sconeserver has been removed"
+	select BR2_LEGACY
+	help
+	  sconeserver is unmaintained and has been removed
+
 config BR2_PACKAGE_QJSON
 	bool "qjson has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index f71fdc7a3a..37b8904751 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3071,7 +3071,6 @@ F:	package/neard/
 F:	package/neardal/
 F:	package/owl-linux/
 F:	package/rapidjson/
-F:	package/sconeserver/
 F:	package/sound-theme-borealis/
 F:	package/sound-theme-freedesktop/
 F:	package/vlc/
diff --git a/package/Config.in b/package/Config.in
index 02f9f00ecd..42ae5aae4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2634,7 +2634,6 @@ endif
 	source "package/s6-dns/Config.in"
 	source "package/s6-networking/Config.in"
 	source "package/samba4/Config.in"
-	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
 	source "package/shadowsocks-libev/Config.in"
 	source "package/shairport-sync/Config.in"
diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
deleted file mode 100644
index d1a8a031be..0000000000
--- a/package/sconeserver/Config.in
+++ /dev/null
@@ -1,96 +0,0 @@
-menuconfig BR2_PACKAGE_SCONESERVER
-	bool "sconeserver"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_STATIC_LIBS # dlopen()
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_PCRE
-	select BR2_PACKAGE_ZLIB
-	help
-	  Sconeserver is a modular, object-orientated and extremely
-	  versatile network server framework for GNU/Linux and
-	  UNIX-like platforms.
-
-	  http://www.sconemad.com/sconeserver/
-
-if BR2_PACKAGE_SCONESERVER
-
-comment "Sconeserver modules"
-
-config BR2_PACKAGE_SCONESERVER_BLUETOOTH
-	bool "bluetooth"
-	depends on BR2_USE_WCHAR # bluez5_utils -> libglib2
-	depends on BR2_USE_MMU # bluez5_utils -> dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez5_utils -> dbus, libglib2
-	depends on !BR2_STATIC_LIBS # bluez5_utils
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
-	select BR2_PACKAGE_BLUEZ5_UTILS
-	help
-	  Bluetooth module for Sconeserver
-
-comment "bluetooth support needs a toolchain w/ wchar, threads, dynamic library, headers >= 3.4"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-
-config BR2_PACKAGE_SCONESERVER_EXAMPLES
-	bool "examples"
-	help
-	  Example modules for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE
-	bool "http::sconesite"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  http::sconesite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_LOCATION
-	bool "location"
-	depends on BR2_USE_MMU # gpsd
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gpsd
-	depends on !BR2_STATIC_LIBS # gpsd
-	select BR2_PACKAGE_GPSD
-	help
-	  Location module for Sconeserver
-
-comment "location support needs a toolchain w/ theads, dynamic library"
-	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
-
-config BR2_PACKAGE_SCONESERVER_MATHS
-	bool "maths"
-	select BR2_PACKAGE_MPFR
-	help
-	  Mathematics module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_MYSQL
-	bool "mysql"
-	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_MARIADB
-	help
-	  MySQL module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_RSS
-	bool "rss"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  RSS module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_SQLITE
-	help
-	  SQLite module for Sconeserver
-
-config BR2_PACKAGE_SCONESERVER_TESTBUILDER
-	bool "testbuilder"
-	help
-	  Testbuilder module for Sconeserver
-
-endif # BR2_PACKAGE_SCONESERVER
-
-comment "sconeserver needs a toolchain with dynamic library, C++, NPTL"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS
diff --git a/package/sconeserver/sconeserver.hash b/package/sconeserver/sconeserver.hash
deleted file mode 100644
index ba86e44ae7..0000000000
--- a/package/sconeserver/sconeserver.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  47552b20579678e49150abe071d9eb55cf23bd13f7f6e4fa085d0612bf6a3431  sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503.tar.gz
-sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
deleted file mode 100644
index bb0da12d4c..0000000000
--- a/package/sconeserver/sconeserver.mk
+++ /dev/null
@@ -1,93 +0,0 @@
-################################################################################
-#
-# sconeserver
-#
-################################################################################
-
-SCONESERVER_VERSION = 8d1935919a2013358993a8e9dfa992cbde56e503
-SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
-SCONESERVER_LICENSE = GPL-2.0+
-SCONESERVER_LICENSE_FILES = COPYING
-SCONESERVER_DEPENDENCIES = \
-	host-pkgconf \
-	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt) \
-	pcre \
-	zlib
-# disable image as it fails to build with ImageMagick
-# disable markdown module because its git submodule cmark
-# https://github.com/sconemad/sconeserver/tree/master/markdown
-# has no cross-compile support provided by the sconeserver build system
-SCONESERVER_CONF_OPTS += \
-	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
-	-DWITH_IMAGE=OFF \
-	-DWITH_MARKDOWN=OFF
-
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
-SCONESERVER_DEPENDENCIES += openssl
-SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SSL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_BLUETOOTH),y)
-SCONESERVER_DEPENDENCIES += bluez5_utils
-SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_BLUETOOTH=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_EXAMPLES),y)
-SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_EXAMPLES=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_HTTP_SCONESITE),y)
-SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SCONESITE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_LOCATION),y)
-SCONESERVER_DEPENDENCIES += gpsd
-SCONESERVER_CONF_OPTS += -DWITH_LOCATION=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_LOCATION=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MATHS),y)
-SCONESERVER_DEPENDENCIES += mpfr
-SCONESERVER_CONF_OPTS += -DWITH_MATHS=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_MATHS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_MYSQL),y)
-SCONESERVER_DEPENDENCIES += mariadb
-SCONESERVER_CONF_OPTS += -DWITH_MYSQL=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_MYSQL=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_RSS),y)
-SCONESERVER_DEPENDENCIES += libxml2
-SCONESERVER_CONF_OPTS += -DWITH_RSS=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_RSS=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_SQLITE),y)
-SCONESERVER_DEPENDENCIES += sqlite
-SCONESERVER_CONF_OPTS += -DWITH_SQLITE=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_SQLITE=OFF
-endif
-
-ifeq ($(BR2_PACKAGE_SCONESERVER_TESTBUILDER),y)
-SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=ON
-else
-SCONESERVER_CONF_OPTS += -DWITH_TESTBUILDER=OFF
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
