From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 02 Dec 2019 08:47:50 -0000
Subject: [Buildroot] [git commit] package/python-dnspython: new package
Message-ID: <20191202083932.291F47F901@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5c877eb01f4c64bbd15d62fb016e9dabf22d9f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-dnspython/Config.in             |  6 ++++++
 package/python-dnspython/python-dnspython.hash |  5 +++++
 package/python-dnspython/python-dnspython.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 342df993aa..b006ba6999 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1393,6 +1393,7 @@ F:	package/ti-sgx-um/
 N:	Louis Aussedat <aussedat.louis@gmail.com>
 F:	board/friendlyarm/nanopi-neo-plus2/
 F:	configs/friendlyarm_nanopi_neo_plus2_defconfig
+F:	package/python-dnspython/
 F:	package/python-tqdm/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
diff --git a/package/Config.in b/package/Config.in
index a9742ba953..ae396256f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -891,6 +891,7 @@ menu "External python modules"
 	source "package/python-dicttoxml/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
+	source "package/python-dnspython/Config.in"
 	source "package/python-docker/Config.in"
 	source "package/python-docker-pycreds/Config.in"
 	source "package/python-dockerpty/Config.in"
diff --git a/package/python-dnspython/Config.in b/package/python-dnspython/Config.in
new file mode 100644
index 0000000000..99fd6a9a5f
--- /dev/null
+++ b/package/python-dnspython/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_DNSPYTHON
+	bool "python-dnspython"
+	help
+	  A powerful DNS toolkit for python.
+
+	  http://www.dnspython.org
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
new file mode 100644
index 0000000000..af09d51cd5
--- /dev/null
+++ b/package/python-dnspython/python-dnspython.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dnspython/json
+md5	bc9ca3b3a82164667d5730ec6d5248a2  dnspython-1.16.0.zip
+sha256	36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01  dnspython-1.16.0.zip
+# Locally computed sha256 checksums
+sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
new file mode 100644
index 0000000000..18d98efd72
--- /dev/null
+++ b/package/python-dnspython/python-dnspython.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# python-dnspython
+#
+################################################################################
+
+PYTHON_DNSPYTHON_VERSION = 1.16.0
+PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).zip
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed
+PYTHON_DNSPYTHON_LICENSE = ISC
+PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
+PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
+
+define PYTHON_DNSPYTHON_EXTRACT_CMDS
+	$(UNZIP) -d $(@D) $(PYTHON_DNSPYTHON_DL_DIR)/$(PYTHON_DNSPYTHON_SOURCE)
+	mv $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)/* $(@D)
+	$(RM) -r $(@D)/dnspython-$(PYTHON_DNSPYTHON_VERSION)
+endef
+
+$(eval $(python-package))
