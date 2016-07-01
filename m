From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  1 Jul 2016 12:06:19 +0200
Subject: [Buildroot] [PATCH 2/2] python-socketio: new package
In-Reply-To: <1467367579-32207-1-git-send-email-yegorslists@googlemail.com>
References: <1467367579-32207-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1467367579-32207-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/Config.in                            |  1 +
 package/python-socketio/Config.in            |  8 ++++++++
 package/python-socketio/python-socketio.hash |  4 ++++
 package/python-socketio/python-socketio.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-socketio/Config.in
 create mode 100644 package/python-socketio/python-socketio.hash
 create mode 100644 package/python-socketio/python-socketio.mk

diff --git a/package/Config.in b/package/Config.in
index a5eabca..7b48fc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -767,6 +767,7 @@ menu "External python modules"
 	source "package/python-sip/Config.in"
 	source "package/python-six/Config.in"
 	source "package/python-smbus-cffi/Config.in"
+	source "package/python-socketio/Config.in"
 	source "package/python-spidev/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tornado/Config.in"
diff --git a/package/python-socketio/Config.in b/package/python-socketio/Config.in
new file mode 100644
index 0000000..af0f6f3
--- /dev/null
+++ b/package/python-socketio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SOCKETIO
+	bool "python-socketio"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_ENGINEIO # runtime
+	help
+	  Socket.IO server.
+
+	  http://github.com/miguelgrinberg/python-socketio/
diff --git a/package/python-socketio/python-socketio.hash b/package/python-socketio/python-socketio.hash
new file mode 100644
index 0000000..659d4d5
--- /dev/null
+++ b/package/python-socketio/python-socketio.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/python-socketio/json
+md5	44fd24e839dc3102920765f345740646  python-socketio-1.4.1.tar.gz
+# sha256 calculated by scanpypi
+sha256	ebd0984d831d602c8ec6d586ecde4466972cc7ed37dbbfe613192864e8263779  python-socketio-1.4.1.tar.gz
diff --git a/package/python-socketio/python-socketio.mk b/package/python-socketio/python-socketio.mk
new file mode 100644
index 0000000..3bcfed1
--- /dev/null
+++ b/package/python-socketio/python-socketio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-socketio
+#
+################################################################################
+
+PYTHON_SOCKETIO_VERSION = 1.4.1
+PYTHON_SOCKETIO_SOURCE = python-socketio-$(PYTHON_SOCKETIO_VERSION).tar.gz
+PYTHON_SOCKETIO_SITE = https://pypi.python.org/packages/da/00/66103df6a116a2ce3ea662a9c8c80f337d43d7f138caf04e9af6dec24ba7
+PYTHON_SOCKETIO_SETUP_TYPE = setuptools
+PYTHON_SOCKETIO_LICENSE = MIT
+PYTHON_SOCKETIO_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.8.1
