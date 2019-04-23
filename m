From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Apr 2019 19:05:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: needs PCRE with UTF support
Message-ID: <20190423170526.26577-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mongodb needs PCRE with UTF-8 support, see:
https://docs.mongodb.com/manual/reference/operator/query/regex/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mongodb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 7df502add6..9c5dba8347 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -20,6 +20,7 @@ config BR2_PACKAGE_MONGODB
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_PCRE_UTF # runtime
 	select BR2_PACKAGE_SNAPPY
 	select BR2_PACKAGE_SQLITE
 	select BR2_PACKAGE_YAML_CPP
-- 
2.20.1
