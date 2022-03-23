Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A240C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:27:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0507661364;
	Wed, 23 Mar 2022 20:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwPeRNIJgCdG; Wed, 23 Mar 2022 20:27:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15BC960FF2;
	Wed, 23 Mar 2022 20:27:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 182D01BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06B4961042
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRJsAPzg_ajA for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072EE60B68
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3AEF8854C9; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:08:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae1deebb9e78b5338f5f30fe4765e3eb9e5be3d7
X-Git-Newrev: 39c3ad67401fadf8ebcb7d591649d821dc02411a
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.3AEF8854C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: reorder options
 alphabetically
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=39c3ad67401fadf8ebcb7d591649d821dc02411a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit reorders dependencies and Kconfig package options
alphabetically for better maintainability.

This commit does not change anything else.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/poco/Config.in | 82 +++++++++++++++++++++++++-------------------------
 package/poco/poco.mk   | 28 ++++++++---------
 2 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index dd87ee36bb..df3d3cbc66 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -28,41 +28,50 @@ if BR2_PACKAGE_POCO
 
 comment "poco components"
 
+config BR2_PACKAGE_POCO_CPP_PARSER
+	bool "cpp_parser"
+
+config BR2_PACKAGE_POCO_CRYPTO
+	bool "crypto"
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_OPENSSL
+
+config BR2_PACKAGE_POCO_DATA
+	bool
+
+config BR2_PACKAGE_POCO_DATA_MYSQL
+	bool "mysql"
+	depends on BR2_USE_MMU # mysql
+	select BR2_PACKAGE_MYSQL
+	select BR2_PACKAGE_POCO_DATA
+
+config BR2_PACKAGE_POCO_DATA_SQLITE
+	bool "sqlite"
+	select BR2_PACKAGE_POCO_DATA
+	select BR2_PACKAGE_SQLITE
+
 config BR2_PACKAGE_POCO_JSON
 	bool "json"
 
-config BR2_PACKAGE_POCO_XML
-	bool "xml"
-	select BR2_PACKAGE_EXPAT
+config BR2_PACKAGE_POCO_JWT
+	bool "jwt"
+	select BR2_PACKAGE_POCO_CRYPTO
+	select BR2_PACKAGE_POCO_JSON
 
-config BR2_PACKAGE_POCO_UTIL
-	bool "util"
-	select BR2_PACKAGE_POCO_XML
+config BR2_PACKAGE_POCO_MONGODB
+	bool "mongodb"
+	select BR2_PACKAGE_POCO_NET
 
 config BR2_PACKAGE_POCO_NET
 	bool "net"
 
-config BR2_PACKAGE_POCO_CRYPTO
-	bool "crypto"
-	select BR2_PACKAGE_OPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
-
 config BR2_PACKAGE_POCO_NETSSL_OPENSSL
 	bool "netssl_openssl"
-	select BR2_PACKAGE_POCO_NET
-	select BR2_PACKAGE_POCO_CRYPTO
-	select BR2_PACKAGE_POCO_UTIL
 	select BR2_PACKAGE_OPENSSL
-
-config BR2_PACKAGE_POCO_ZIP
-	bool "zip"
-	select BR2_PACKAGE_POCO_XML
+	select BR2_PACKAGE_POCO_CRYPTO
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_UTIL
 
-config BR2_PACKAGE_POCO_CPP_PARSER
-	bool "cpp_parser"
-
 config BR2_PACKAGE_POCO_PDF
 	bool "pdf"
 	select BR2_PACKAGE_POCO_JSON
@@ -73,28 +82,19 @@ config BR2_PACKAGE_POCO_REDIS
 	bool "redis"
 	select BR2_PACKAGE_POCO_NET
 
-config BR2_PACKAGE_POCO_MONGODB
-	bool "mongodb"
-	select BR2_PACKAGE_POCO_NET
-
-config BR2_PACKAGE_POCO_DATA
-	bool
-
-config BR2_PACKAGE_POCO_DATA_SQLITE
-	bool "sqlite"
-	select BR2_PACKAGE_POCO_DATA
-	select BR2_PACKAGE_SQLITE
+config BR2_PACKAGE_POCO_UTIL
+	bool "util"
+	select BR2_PACKAGE_POCO_XML
 
-config BR2_PACKAGE_POCO_DATA_MYSQL
-	bool "mysql"
-	depends on BR2_USE_MMU # mysql
-	select BR2_PACKAGE_POCO_DATA
-	select BR2_PACKAGE_MYSQL
+config BR2_PACKAGE_POCO_XML
+	bool "xml"
+	select BR2_PACKAGE_EXPAT
 
-config BR2_PACKAGE_POCO_JWT
-	bool "jwt"
-	select BR2_PACKAGE_POCO_JSON
-	select BR2_PACKAGE_POCO_CRYPTO
+config BR2_PACKAGE_POCO_ZIP
+	bool "zip"
+	select BR2_PACKAGE_POCO_NET
+	select BR2_PACKAGE_POCO_UTIL
+	select BR2_PACKAGE_POCO_XML
 
 endif # BR2_PACKAGE_POCO
 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 857f215e3a..81409ffec4 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -11,29 +11,29 @@ POCO_LICENSE_FILES = LICENSE
 POCO_CPE_ID_VENDOR = pocoproject
 POCO_INSTALL_STAGING = YES
 
-POCO_DEPENDENCIES = zlib pcre \
-	$(if $(BR2_PACKAGE_POCO_XML),expat) \
+POCO_DEPENDENCIES = pcre zlib \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),openssl) \
-	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),sqlite) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
+	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),openssl) \
+	$(if $(BR2_PACKAGE_POCO_XML),expat)
 
 POCO_OMIT = Data/ODBC PageCompiler \
+	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
+	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
+	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
+	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
+	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
 	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
-	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
-	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
+	$(if $(BR2_PACKAGE_POCO_JWT),,JWT) \
+	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
 	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
-	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
-	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
-	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
 	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
 	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
-	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
-	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
-	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
-	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite) \
-	$(if $(BR2_PACKAGE_POCO_JWT),,JWT)
+	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
+	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
+	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip)
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 POCO_CONF_OPTS += --no-fpenvironment --no-wstring
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
