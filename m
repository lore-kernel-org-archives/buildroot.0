From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 11:17:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/poco: PDF needs XML, JSON and Util
Message-ID: <20200229101743.2479442-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PDF needs XML, JSON and Util since version 1.9.0 and
https://github.com/pocoproject/poco/commit/c5acb2ac27a81a429e146780769f965e8284cadc

Fixes:
 - http://autobuild.buildroot.org/results/294b604a0e37aafbe085f0e6f0d1a83ab110c3a4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/poco/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 7e1257146c..f8f921de04 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -54,6 +54,9 @@ config BR2_PACKAGE_POCO_CPP_PARSER
 
 config BR2_PACKAGE_POCO_PDF
 	bool "pdf"
+	select BR2_PACKAGE_POCO_JSON
+	select BR2_PACKAGE_POCO_UTIL
+	select BR2_PACKAGE_POCO_XML
 
 config BR2_PACKAGE_POCO_REDIS
 	bool "redis"
-- 
2.25.0
