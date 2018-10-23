From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Oct 2018 16:35:44 +0200
Subject: [Buildroot] [git commit] python-serial-asyncio: new package
Message-ID: <20181023143419.936CC88636@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=231f5403b76374d18fe14fb8e002fbe9784259a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

asyncio extension package for pyserial

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                                        |  1 +
 package/python-serial-asyncio/Config.in                  |  8 ++++++++
 package/python-serial-asyncio/python-serial-asyncio.hash |  5 +++++
 package/python-serial-asyncio/python-serial-asyncio.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 6d2a73ff1b..710cde6691 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1008,6 +1008,7 @@ menu "External python modules"
 	source "package/python-see/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-serial/Config.in"
+	source "package/python-serial-asyncio/Config.in"
 	source "package/python-service-identity/Config.in"
 	source "package/python-setproctitle/Config.in"
 	source "package/python-setuptools/Config.in"
diff --git a/package/python-serial-asyncio/Config.in b/package/python-serial-asyncio/Config.in
new file mode 100644
index 0000000000..5520b72506
--- /dev/null
+++ b/package/python-serial-asyncio/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_SERIAL_ASYNCIO
+	bool "python-serial-asyncio"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SERIAL
+	help
+	  asyncio extension package for pyserial.
+
+	  https://github.com/pyserial/pyserial-asyncio
diff --git a/package/python-serial-asyncio/python-serial-asyncio.hash b/package/python-serial-asyncio/python-serial-asyncio.hash
new file mode 100644
index 0000000000..268c7d83f5
--- /dev/null
+++ b/package/python-serial-asyncio/python-serial-asyncio.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyserial-asyncio/json
+md5     67244fdc11cc31cf0ebf675c271c71d8  pyserial-asyncio-0.4.tar.gz
+sha256  c40677a8874d8c24d4423a97498746de776f6dbcd0efbb8fa43dcf011a589aee  pyserial-asyncio-0.4.tar.gz
+# Locally computed sha256 checksums
+sha256	f8ded3a7460d3b2850b0cf673e986c70e9d997fd0732d8ab3f3c84f1f191087d  LICENSE.txt
diff --git a/package/python-serial-asyncio/python-serial-asyncio.mk b/package/python-serial-asyncio/python-serial-asyncio.mk
new file mode 100644
index 0000000000..39c3476d9e
--- /dev/null
+++ b/package/python-serial-asyncio/python-serial-asyncio.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-serial-asyncio
+#
+################################################################################
+
+PYTHON_SERIAL_ASYNCIO_VERSION = 0.4
+PYTHON_SERIAL_ASYNCIO_SOURCE = pyserial-asyncio-$(PYTHON_SERIAL_ASYNCIO_VERSION).tar.gz
+PYTHON_SERIAL_ASYNCIO_SITE = https://files.pythonhosted.org/packages/41/3f/e26f71269cbc0890a527a736d9afc5c0d5838a2c188be680558d635b7dc2
+PYTHON_SERIAL_ASYNCIO_LICENSE = BSD-3-Clause
+PYTHON_SERIAL_ASYNCIO_LICENSE_FILES = LICENSE.txt
+PYTHON_SERIAL_ASYNCIO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
