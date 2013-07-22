From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jul 2013 17:22:33 +0200
Subject: [Buildroot] [git commit] package/python-pyro: adding Pyro 3.14
Message-ID: <20130722152246.0514B9A943@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=79309d94423738e6832f08cafab0cd71f65af355
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix LICENSE_FILES tag, adjust upstream URL]
Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                  |    1 +
 package/python-pyro/Config.in      |    9 +++++++++
 package/python-pyro/python-pyro.mk |   18 ++++++++++++++++++
 3 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7730317..9e1c0ae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -358,6 +358,7 @@ source "package/python-nfc/Config.in"
 source "package/python-protobuf/Config.in"
 source "package/python-pygame/Config.in"
 source "package/python-pyparsing/Config.in"
+source "package/python-pyro/Config.in"
 source "package/python-serial/Config.in"
 source "package/python-setuptools/Config.in"
 source "package/python-thrift/Config.in"
diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
new file mode 100644
index 0000000..eb998c3
--- /dev/null
+++ b/package/python-pyro/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYRO
+	bool "python-pyro"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-pyro is a Python library stands for PYthon Remote Objects.
+	  It is an advanced and powerful Distributed Object Technology system
+	  written entirely in Python, that is designed to be very easy to use..
+
+	  https://pypi.python.org/pypi/Pyro/
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
new file mode 100644
index 0000000..67aabc6
--- /dev/null
+++ b/package/python-pyro/python-pyro.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# python-pyro
+#
+################################################################################
+
+PYTHON_PYRO_VERSION = 3.14
+PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
+PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
+PYTHON_PYRO_LICENSE = MIT
+PYTHON_PYRO_LICENSE_FILES = LICENSE
+PYTHON_PYRO_DEPENDENCIES = python
+
+define PYTHON_PYRO_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
