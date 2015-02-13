From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Feb 2015 10:05:47 +0100
Subject: [Buildroot] [PATCH] package/python: enable xml libraries
Message-ID: <1423818347-3390-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the option to include xml libraries in python.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/python/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python/Config.in b/package/python/Config.in
index 87defad..682a324 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -114,6 +114,12 @@ config BR2_PACKAGE_PYTHON_SQLITE
 	help
 	  SQLite database support
 
+config BR2_PACKAGE_PYTHON_XML
+	bool "xml module"
+	select BR2_PACKAGE_PYTHON_PYEXPAT
+	help
+	  Xml libraries for Python
+
 config BR2_PACKAGE_PYTHON_ZLIB
 	bool "zlib module"
 	select BR2_PACKAGE_ZLIB
-- 
1.9.1
