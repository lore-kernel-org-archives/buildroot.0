From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 25 Dec 2020 23:49:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-pycups: needs python3
Message-ID: <20201225224919.3924742-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As stated in README:

Python 3 or later is required since Python 2 is unsupported since
2020-01-01.

Fixes:
 - http://autobuild.buildroot.org/results/3c8db83a2d1ae094fc718947a508e35e940121ce

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pycups/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycups/Config.in b/package/python-pycups/Config.in
index eeaf70c9e6..61c2ba21d1 100644
--- a/package/python-pycups/Config.in
+++ b/package/python-pycups/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYCUPS
 	bool "python-pycups"
 	depends on BR2_PACKAGE_CUPS
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for libcups.
 
-- 
2.29.2
