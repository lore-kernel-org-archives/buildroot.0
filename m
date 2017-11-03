From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  3 Nov 2017 15:25:33 -0700
Subject: [Buildroot] [PATCH 1/1] python-websockets: new package
Message-ID: <20171103222533.19410-1-joseph.kogut@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 DEVELOPERS                                       |  3 +++
 package/Config.in                                |  1 +
 package/python-websockets/Config.in              | 10 ++++++++++
 package/python-websockets/python-websockets.hash |  2 ++
 package/python-websockets/python-websockets.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/python-websockets/Config.in
 create mode 100644 package/python-websockets/python-websockets.hash
 create mode 100644 package/python-websockets/python-websockets.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 49fa789c1d..c651bf26fa 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -787,6 +787,9 @@ F:	package/pdbg/
 F:	board/qemu/ppc64le-pseries/
 F:	configs/qemu_ppc64le_pseries_defconfig
 
+N:	Joseph Kogut <joseph.kogut@gmail.com>
+F:	package/python-websockets/
+
 N:	Johan Derycke <johanderycke@gmail.com>
 F:	package/python-libconfig/
 
diff --git a/package/Config.in b/package/Config.in
index 28444f64de..fe5ccc434e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -920,6 +920,7 @@ menu "External python modules"
 	source "package/python-wcwidth/Config.in"
 	source "package/python-web2py/Config.in"
 	source "package/python-webpy/Config.in"
+	source "package/python-websockets/Config.in"
 	source "package/python-werkzeug/Config.in"
 	source "package/python-whoosh/Config.in"
 	source "package/python-ws4py/Config.in"
diff --git a/package/python-websockets/Config.in b/package/python-websockets/Config.in
new file mode 100644
index 0000000000..dea02e2bfd
--- /dev/null
+++ b/package/python-websockets/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_WEBSOCKETS
+	bool "python-websockets"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON3_SSL
+
+	help
+	  An implementation of the WebSocket Protocol (RFC 6455)
+
+	  https://github.com/aaugustin/websockets
diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
new file mode 100644
index 0000000000..fbd746d7bb
--- /dev/null
+++ b/package/python-websockets/python-websockets.hash
@@ -0,0 +1,2 @@
+md5	9e8c6b3c70def4146d75fbb0f52bdfc7  websockets-4.0.1.tar.gz
+sha256	da4d4fbe059b0453e726d6d993760065d69b823a27efc3040402a6fcfe6a1ed9  websockets-4.0.1.tar.gz
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
new file mode 100644
index 0000000000..64af1dcc43
--- /dev/null
+++ b/package/python-websockets/python-websockets.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-websockets
+#
+################################################################################
+
+PYTHON_WEBSOCKETS_VERSION = 4.0.1
+PYTHON_WEBSOCKETS_SOURCE = websockets-${PYTHON_WEBSOCKETS_VERSION}.tar.gz
+PYTHON_WEBSOCKETS_SITE = https://pypi.python.org/packages/b6/12/6194aac840c65253e45a38912e318f9ac548f9ba86d75bdb8fe66841b335
+PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
+PYTHON_WEBSOCKETS_LICENSE = BSD-3
+PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.15.0
