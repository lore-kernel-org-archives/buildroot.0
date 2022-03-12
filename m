Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C02C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 20:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B26CE60E7D;
	Sat, 12 Mar 2022 20:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gaj8n5ziRo5v; Sat, 12 Mar 2022 20:16:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B57F760E67;
	Sat, 12 Mar 2022 20:16:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7871C1BF3DD
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6530440488
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 20:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FLr9iSXdK0x for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 20:16:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27A5A40486
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 20:16:48 +0000 (UTC)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:8763:f5a3:4adf:bb86])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AEF6BB0037C;
 Sat, 12 Mar 2022 21:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647116205;
 bh=pXyM0pt159xRJe3PrKrgrkc0bEEniDkbHdd4Zj6Hm3A=;
 h=From:To:Cc:Subject:Date:From;
 b=QvjyfBWlQwn9EsYvQbDhjJATrnnzpOxWX1Lhq+24Ng6yJewewA2h8ApWPQCA52d78
 IQOLdlxsIzzuIpMREPQJMNvERzbKvcc50rj9In//9RyMoxwb0BejjxodPNlxT2VCtX
 +6414zTpviQKKMlW7HHdfnxNCknvD/kYg/+GwC0jD9QVv3Hn25mWzN4LnnG9wl+tPF
 Eqh537JOCeiz41mV2poqODPLdy/Utx+3vnUNoKkyKcxoX1GjTu2qkQXqj4RmEZspNR
 qFE8CrM21ikySyVcMVJ1/MqnhC4Ng5O/RQVJtQUUSWe3OrBm3cl9jOBadtozh8O6pL
 MlrvEaVEtaDsA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 21:16:24 +0100
Message-Id: <20220312201627.690544-1-ju.o@free.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/4] package/poco: reorder options alphabetically
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit reorders dependencies and Kconfig package options
alphabetically for better maintainability.

This commit does not change anything else.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/poco/Config.in | 82 +++++++++++++++++++++---------------------
 package/poco/poco.mk   | 28 +++++++--------
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
