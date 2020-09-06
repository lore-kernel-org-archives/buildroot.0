From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 14:42:46 +0200
Subject: [Buildroot] [git commit] package/python-pluggy: new package
Message-ID: <20200906123833.A35828104D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=abce8e3c43ee893f5496f8746101a8355354ea80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-pluggy/Config.in          |  7 +++++++
 package/python-pluggy/python-pluggy.hash |  5 +++++
 package/python-pluggy/python-pluggy.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ca76b1be0..98abde4aea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1626,6 +1626,7 @@ F:	package/murata-cyw-fw/
 F:	package/netdata/
 F:	package/python-ansicolors/
 F:	package/python-packaging/
+F:	package/python-pluggy/
 F:	package/rs485conf/
 F:	package/turbolua/
 F:	support/testing/tests/package/test_netdata.py
diff --git a/package/Config.in b/package/Config.in
index 164248e608..65e8e103b8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1065,6 +1065,7 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
 	source "package/python-posix-ipc/Config.in"
diff --git a/package/python-pluggy/Config.in b/package/python-pluggy/Config.in
new file mode 100644
index 0000000000..7179bc427c
--- /dev/null
+++ b/package/python-pluggy/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PLUGGY
+	bool "python-pluggy"
+	depends on BR2_PACKAGE_PYTHON3
+	help
+	  plugin and hook calling mechanisms for python.
+
+	  https://github.com/pytest-dev/pluggy
diff --git a/package/python-pluggy/python-pluggy.hash b/package/python-pluggy/python-pluggy.hash
new file mode 100644
index 0000000000..24e207bfad
--- /dev/null
+++ b/package/python-pluggy/python-pluggy.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pluggy/json
+md5  7f610e28b8b34487336b585a3dfb803d  pluggy-0.13.1.tar.gz
+sha256  15b2acde666561e1298d71b523007ed7364de07029219b604cf808bfa1c765b0  pluggy-0.13.1.tar.gz
+# Locally computed sha256 checksums
+sha256  d6b65e6c213a5d0b577911d34d6e5949b9f59d76c238c5071a2f3fc16cfb2606  LICENSE
diff --git a/package/python-pluggy/python-pluggy.mk b/package/python-pluggy/python-pluggy.mk
new file mode 100644
index 0000000000..03cdecf4b9
--- /dev/null
+++ b/package/python-pluggy/python-pluggy.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pluggy
+#
+################################################################################
+
+PYTHON_PLUGGY_VERSION = 0.13.1
+PYTHON_PLUGGY_SOURCE = pluggy-$(PYTHON_PLUGGY_VERSION).tar.gz
+PYTHON_PLUGGY_SITE = https://files.pythonhosted.org/packages/f8/04/7a8542bed4b16a65c2714bf76cf5a0b026157da7f75e87cc88774aa10b14
+PYTHON_PLUGGY_SETUP_TYPE = setuptools
+PYTHON_PLUGGY_LICENSE = MIT
+PYTHON_PLUGGY_LICENSE_FILES = LICENSE
+PYTHON_PLUGGY_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
