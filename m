From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 18:11:25 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-asgiref: drop Python 2
 support
Message-ID: <20191020151126.2468-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Asgiref doesn't support Python 2 since version 2.0.0.
All the recursive reverse dependencies already support Python 3 only.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-asgiref/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-asgiref/Config.in b/package/python-asgiref/Config.in
index d0b816c369..71069bf48b 100644
--- a/package/python-asgiref/Config.in
+++ b/package/python-asgiref/Config.in
@@ -1,4 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASGIREF
+	depends on BR2_PACKAGE_PYTHON3
 	bool "python-asgiref"
 	help
 	  ASGI is a standard for Python asynchronous web apps and
-- 
2.20.1
