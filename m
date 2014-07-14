From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sun, 13 Jul 2014 22:35:17 -0400
Subject: [Buildroot] [PATCH] python-pyzmq: enable PyZMQ for Python 3
Message-ID: <1405305317-11481-1-git-send-email-eeppeliteloop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The PyZMQ package is currently limited to Python 2; however, its
build system does not require the Python 2 interpreter and will work
as is with Python 3 (tested).

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
---
 package/python-pyzmq/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-pyzmq/Config.in b/package/python-pyzmq/Config.in
index b83c09c..0f868d0 100644
--- a/package/python-pyzmq/Config.in
+++ b/package/python-pyzmq/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYZMQ
 	depends on BR2_USE_WCHAR # zeromq
 	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
-	depends on BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_ZEROMQ
 	help
 	  This package contains the python language binding for zeromq.
-- 
2.0.1
