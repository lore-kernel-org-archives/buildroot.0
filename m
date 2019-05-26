From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 May 2019 17:52:23 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-matplotlib: depends on
 BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
Message-ID: <20190526155223.26168-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/038d50784ec80b35e3daff1966df07a1b52780b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-matplotlib/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index 7f775ea2fc..13a5c74ec4 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB
 	bool "python-matplotlib"
 	depends on !BR2_PACKAGE_PYTHON
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
 	select BR2_PACKAGE_FREETYPE # runtime
 	select BR2_PACKAGE_LIBPNG # runtime
 	select BR2_PACKAGE_PYTHON_CYCLER
-- 
2.20.1
