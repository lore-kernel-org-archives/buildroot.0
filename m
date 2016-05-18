From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 18 May 2016 15:35:03 +0200
Subject: [Buildroot] [PATCH/next 1/2] python-backports-abc: depend on Python
	2.x
Message-ID: <1463578504-1257-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This package is a backport from Python 3.5, so it is not needed
for Python 3.5.x environment.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-backports-abc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-backports-abc/Config.in b/package/python-backports-abc/Config.in
index 26d8cfd..4356627 100644
--- a/package/python-backports-abc/Config.in
+++ b/package/python-backports-abc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BACKPORTS_ABC
 	bool "python-backports-abc"
+	depends on BR2_PACKAGE_PYTHON
 	help
 	  A backport of recent additions to the 'collections.abc'
 	  module.
-- 
2.8.1
