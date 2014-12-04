From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu,  4 Dec 2014 22:36:57 +0100
Subject: [Buildroot] [PATCH] python-webpy: depend on Python 2.x only
Message-ID: <1417729017-6395-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

webpy is still not ported to Python 3, so enable only
for Python 2.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-webpy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-webpy/Config.in b/package/python-webpy/Config.in
index 1e90892..e9a5121 100644
--- a/package/python-webpy/Config.in
+++ b/package/python-webpy/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBPY
 	bool "python-webpy"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  web.py is a web framework for Python that is as simple as it is
 	  powerful.
-- 
1.8.3.2
