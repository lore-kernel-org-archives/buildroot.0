From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 May 2016 10:44:43 +0200
Subject: [Buildroot] [PATCH] python-singledispatch: add missing runtime
	dependency
Message-ID: <1462351483-24003-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

setup.py mentions python-six as required.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-singledispatch/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-singledispatch/Config.in b/package/python-singledispatch/Config.in
index 192e516..4abc219 100644
--- a/package/python-singledispatch/Config.in
+++ b/package/python-singledispatch/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_SINGLEDISPATCH
 	bool "python-singledispatch"
 	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  This library brings functools.singledispatch from
 	  Python 3.4 to Python 2.6-3.3
-- 
2.8.1
