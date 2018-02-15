From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 15 Feb 2018 14:32:35 +0100
Subject: [Buildroot] [PATCH-next] poco: add new options
Message-ID: <1518701555-16065-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

New options allow to build following components:

* Redis
* MongoDB
* CppParser
* PDF

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/poco/Config.in | 17 +++++++++++++++++
 package/poco/poco.mk   |  5 +++++
 2 files changed, 22 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 9199b54..b908ea2 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -18,6 +18,9 @@ if BR2_PACKAGE_POCO
 
 comment "poco components"
 
+config BR2_PACKAGE_POCO_JSON
+	bool "json"
+
 config BR2_PACKAGE_POCO_XML
 	bool "xml"
 	select BR2_PACKAGE_EXPAT
@@ -46,6 +49,20 @@ config BR2_PACKAGE_POCO_ZIP
 	select BR2_PACKAGE_POCO_NET
 	select BR2_PACKAGE_POCO_UTIL
 
+config BR2_PACKAGE_POCO_CPP_PARSER
+	bool "cpp_parser"
+
+config BR2_PACKAGE_POCO_PDF
+	bool "pdf"
+
+config BR2_PACKAGE_POCO_REDIS
+	bool "redis"
+	select BR2_PACKAGE_POCO_NET
+
+config BR2_PACKAGE_POCO_MONGODB
+	bool "mongodb"
+	select BR2_PACKAGE_POCO_NET
+
 config BR2_PACKAGE_POCO_DATA
 	bool
 
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3dddb43..018344d 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -18,12 +18,17 @@ POCO_DEPENDENCIES = zlib pcre \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),mysql)
 
 POCO_OMIT = Data/ODBC PageCompiler \
+	$(if $(BR2_PACKAGE_POCO_JSON),,JSON) \
 	$(if $(BR2_PACKAGE_POCO_XML),,XML) \
 	$(if $(BR2_PACKAGE_POCO_UTIL),,Util) \
 	$(if $(BR2_PACKAGE_POCO_NET),,Net) \
 	$(if $(BR2_PACKAGE_POCO_NETSSL_OPENSSL),,NetSSL_OpenSSL) \
 	$(if $(BR2_PACKAGE_POCO_CRYPTO),,Crypto) \
 	$(if $(BR2_PACKAGE_POCO_ZIP),,Zip) \
+	$(if $(BR2_PACKAGE_POCO_CPP_PARSER),,CppParser) \
+	$(if $(BR2_PACKAGE_POCO_PDF),,PDF) \
+	$(if $(BR2_PACKAGE_POCO_REDIS),,Redis) \
+	$(if $(BR2_PACKAGE_POCO_MONGODB),,MongoDB) \
 	$(if $(BR2_PACKAGE_POCO_DATA),,Data) \
 	$(if $(BR2_PACKAGE_POCO_DATA_MYSQL),,Data/MySQL) \
 	$(if $(BR2_PACKAGE_POCO_DATA_SQLITE),,Data/SQLite)
-- 
2.1.4
