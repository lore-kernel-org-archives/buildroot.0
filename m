From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 16 Dec 2019 21:48:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pathlib2: select
 python-scandir
Message-ID: <20191216194815.5436-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

scandir is a runtime dependency of pathlib2.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pathlib2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pathlib2/Config.in b/package/python-pathlib2/Config.in
index e28de4c12e..ca948c271f 100644
--- a/package/python-pathlib2/Config.in
+++ b/package/python-pathlib2/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PATHLIB2
 	bool "python-pathlib2"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SCANDIR # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Object-oriented filesystem paths.
-- 
2.20.1
