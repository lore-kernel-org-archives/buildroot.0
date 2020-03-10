From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 10 Mar 2020 12:41:01 +0100
Subject: [Buildroot] [PATCH] package/python-markdown: fix Python version
 dependency
Message-ID: <20200310114101.6726-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

The latest version has dropped Python 2 support.

Fixes:
http://autobuild.buildroot.net/results/6d1e796f6658accb3eafef265935db5e464638fe

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-markdown/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-markdown/Config.in b/package/python-markdown/Config.in
index 6706684142..454c2729bd 100644
--- a/package/python-markdown/Config.in
+++ b/package/python-markdown/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_MARKDOWN
 	bool "python-markdown"
+	depends on BR2_PACKAGE_PYTHON3
 	# runtime dependency on Python's xml module
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
 	help
 	  This is a Python implementation of John Gruber's Markdown
 
-- 
2.17.0
