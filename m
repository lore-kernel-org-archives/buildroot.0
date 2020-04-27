From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 27 Apr 2020 20:39:31 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-pycairo: depend on python3
Message-ID: <20200427173931.332855-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.19.0 pycairo doesn't support Python 2 anymore.

Fixes:
 - http://autobuild.buildroot.net/results/4d47c71f75a61810c5f58a720245bef38b3f3db0

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pycairo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycairo/Config.in b/package/python-pycairo/Config.in
index 0d8de977e1..a44a0421e6 100644
--- a/package/python-pycairo/Config.in
+++ b/package/python-pycairo/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYCAIRO
 	bool "python-pycairo"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_CAIRO
 	help
 	  Python interface for cairo.
-- 
2.26.2
