Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B99C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A72BA6FB2B;
	Fri, 28 Feb 2025 17:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_VFKPgWf5dA; Fri, 28 Feb 2025 17:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B0D5706A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B0D5706A2;
	Fri, 28 Feb 2025 17:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 260731DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDDD042E34
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B4Wl7kQqV3qv for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 603C042E31
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 603C042E31
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5704F85E08; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 21:00:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2c94ed37fb4d20d3a8e485e972ccdc2aef43e59a
X-Git-Newrev: f7bb2765dc6dfd5df296499b1ffd574a932b6755
X-Patchwork-Hint: ignore
Message-Id: <20250228163014.5704F85E08@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lighttpd: add more
 compile options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f7bb2765dc6dfd5df296499b1ffd574a932b6755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added dbi, gnutls, libev, libunwind, mbedtls, nettle, and wolfssl.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lighttpd/Config.in   | 46 ++++++++++++++++++++++++++++++++++++
 package/lighttpd/lighttpd.mk | 56 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 7 deletions(-)

diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 5311f37ae1..1a9a9a277d 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -34,6 +34,23 @@ config BR2_PACKAGE_LIGHTTPD_BZIP2
 	help
 	  Enable bzip2 support for lighttpd mod_deflate.
 
+config BR2_PACKAGE_LIGHTTPD_DBI
+	bool "dbi support"
+	select BR2_PACKAGE_LIBDBI
+	help
+	  Enable dbi support for lighttpd mod_auth mod_vhostdb_dbi.
+
+config BR2_PACKAGE_LIGHTTPD_GNUTLS
+	bool "gnutls support"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GNUTLS
+	help
+	  Enable gnutls support for lighttpd mod_auth.
+
+comment "gnutls support needs a toolchain w/ wchar, dynamic library"
+	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIGHTTPD_KRB5
 	bool "krb5 support"
 	select BR2_PACKAGE_LIBKRB5
@@ -50,6 +67,12 @@ config BR2_PACKAGE_LIGHTTPD_LDAP
 comment "ldap support needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_LIGHTTPD_LIBEV
+	bool "libev support"
+	select BR2_PACKAGE_LIBEV
+	help
+	  Enable libev support for lighttpd fdevent handlers.
+
 config BR2_PACKAGE_LIGHTTPD_LUA
 	bool "lua support"
 	depends on BR2_PACKAGE_LUA
@@ -62,6 +85,12 @@ config BR2_PACKAGE_LIGHTTPD_MAXMINDDB
 	help
 	  Enable MaxMind GeoIP2 support. Needed to support mod_maxminddb
 
+config BR2_PACKAGE_LIGHTTPD_MBEDTLS
+	bool "mbedtls support"
+	select BR2_PACKAGE_MBEDTLS
+	help
+	  Enable mbedtls support for lighttpd mod_auth.
+
 config BR2_PACKAGE_LIGHTTPD_MYSQL
 	bool "mysql support"
 	depends on BR2_PACKAGE_MARIADB
@@ -71,6 +100,12 @@ config BR2_PACKAGE_LIGHTTPD_MYSQL
 comment "mysql support needs mariadb"
 	depends on !BR2_PACKAGE_MARIADB
 
+config BR2_PACKAGE_LIGHTTPD_NETTLE
+	bool "nettle support"
+	select BR2_PACKAGE_NETTLE
+	help
+	  Enable nettle support for lighttpd.
+
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "openssl support"
 	select BR2_PACKAGE_OPENSSL
@@ -116,6 +151,17 @@ config BR2_PACKAGE_LIGHTTPD_WEBDAV
 	help
 	  Enable webdav support. Needed to support mod_webdav
 
+config BR2_PACKAGE_LIGHTTPD_WOLFSSL
+	bool "wolfssl support"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_WOLFSSL
+	select BR2_PACKAGE_WOLFSSL_ALL
+	help
+	  Enable wolfssl support for lighttpd mod_auth.
+
+comment "wolfssl support needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LIGHTTPD_ZLIB
 	bool "zlib support"
 	select BR2_PACKAGE_ZLIB
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 3f97e84585..985b9ca513 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,17 +13,10 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_dbi=disabled \
 	-Dwith_fam=disabled \
-	-Dwith_gnutls=false \
-	-Dwith_libev=disabled \
-	-Dwith_libunwind=disabled \
-	-Dwith_mbedtls=false \
-	-Dwith_nettle=false \
 	-Dwith_nss=false \
 	-Dwith_pcre=disabled \
 	-Dwith_sasl=disabled \
-	-Dwith_wolfssl=false \
 	-Dwith_xattr=false \
 	-Dwith_xxhash=enabled \
 	-Dbuild_extra_warnings=false \
@@ -34,6 +27,13 @@ ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
 LIGHTTPD_DEPENDENCIES += libxcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+LIGHTTPD_DEPENDENCIES += libunwind
+LIGHTTPD_CONF_OPTS += -Dwith_libunwind=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_libunwind=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
 LIGHTTPD_DEPENDENCIES += brotli
 LIGHTTPD_CONF_OPTS += -Dwith_brotli=enabled
@@ -48,6 +48,20 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_DBI),y)
+LIGHTTPD_DEPENDENCIES += libdbi
+LIGHTTPD_CONF_OPTS += -Dwith_dbi=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_dbi=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_LIGHTTPD_GNUTLS),y)
+LIGHTTPD_DEPENDENCIES += gnutls
+LIGHTTPD_CONF_OPTS += -Dwith_gnutls=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_gnutls=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_KRB5),y)
 LIGHTTPD_DEPENDENCIES += libkrb5
 LIGHTTPD_CONF_OPTS += -Dwith_krb5=enabled
@@ -62,6 +76,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_ldap=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_LIBEV),y)
+LIGHTTPD_DEPENDENCIES += libev
+LIGHTTPD_CONF_OPTS += -Dwith_libev=enabled
+else
+LIGHTTPD_CONF_OPTS += -Dwith_libev=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_LUA),y)
 LIGHTTPD_DEPENDENCIES += lua
 LIGHTTPD_CONF_OPTS += -Dwith_lua=true
@@ -76,6 +97,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_maxminddb=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_MBEDTLS),y)
+LIGHTTPD_DEPENDENCIES += mbedtls
+LIGHTTPD_CONF_OPTS += -Dwith_mbedtls=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_mbedtls=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_MYSQL),y)
 LIGHTTPD_DEPENDENCIES += mariadb
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=enabled
@@ -83,6 +111,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_mysql=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_NETTLE),y)
+LIGHTTPD_DEPENDENCIES += nettle
+LIGHTTPD_CONF_OPTS += -Dwith_nettle=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_nettle=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_OPENSSL),y)
 LIGHTTPD_DEPENDENCIES += openssl
 LIGHTTPD_CONF_OPTS += -Dwith_openssl=true
@@ -124,6 +159,13 @@ else
 LIGHTTPD_CONF_OPTS += -Dwith_webdav_props=disabled -Dwith_webdav_locks=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_WOLFSSL),y)
+LIGHTTPD_DEPENDENCIES += wolfssl
+LIGHTTPD_CONF_OPTS += -Dwith_wolfssl=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_wolfssl=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_ZLIB),y)
 LIGHTTPD_DEPENDENCIES += zlib
 LIGHTTPD_CONF_OPTS += -Dwith_zlib=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
