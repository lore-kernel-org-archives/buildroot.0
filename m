From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  5 Feb 2016 09:37:36 +0100
Subject: [Buildroot] [PATCH v2 1/3] python-setuptools: enable Python 3.x
	support
Message-ID: <1454661458-18746-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add missing XML dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-setuptools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 63c2b01..c72c59f 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -1,7 +1,9 @@
 config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Download, build, install, upgrade, and uninstall Python packages.
 
-- 
2.7.0
