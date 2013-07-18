From: Fabien Marteau <fabien.marteau@armadeus.com>
Date: Thu, 18 Jul 2013 09:50:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyro: adding Pyro 3.14
In-Reply-To: <1374133806-9162-1-git-send-email-fabien.marteau@armadeus.com>
References: <1374133806-9162-1-git-send-email-fabien.marteau@armadeus.com>
Message-ID: <1374133806-9162-2-git-send-email-fabien.marteau@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Fabien Marteau <fabien.marteau@armadeus.com>
---
 package/python-pyro/Config.in      |    9 +++++++++
 package/python-pyro/python-pyro.mk |   17 +++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 package/python-pyro/Config.in
 create mode 100644 package/python-pyro/python-pyro.mk

diff --git a/package/python-pyro/Config.in b/package/python-pyro/Config.in
new file mode 100644
index 0000000..b744c1c
--- /dev/null
+++ b/package/python-pyro/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_PYRO
+	bool "python-pyro"
+	depends on BR2_PACKAGE_PYTHON
+	help
+	  python-pyro is a Python library stands for PYthon Remote Objects.
+		It is an advanced and powerful Distributed Object Technology system
+		written entirely in Python, that is designed to be very easy to use..
+
+	  https://pypi.python.org/pypi/Pyro/3.14
diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
new file mode 100644
index 0000000..1b3b904
--- /dev/null
+++ b/package/python-pyro/python-pyro.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# python-pyro
+#
+#############################################################
+
+PYTHON_PYRO_VERSION = 3.14
+PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
+PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
+
+PYTHON_PYRO_DEPENDENCIES = python
+
+define PYTHON_PYRO_INSTALL_TARGET_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
