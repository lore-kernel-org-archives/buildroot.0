From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Fri, 15 Feb 2013 11:00:12 +0100
Subject: [Buildroot] [PATCH v4 5/5] python-serial: Convert package to be
	used with python2 or python3
In-Reply-To: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
References: <1360922412-32559-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360922412-32559-6-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-serial/Config.in        |    1 -
 package/python-serial/python-serial.mk |    6 +++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index ea090bd..55a9cc1 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index fb6b31c..6528a6b 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -8,14 +8,14 @@ PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial/
 
-PYTHON_SERIAL_DEPENDENCIES = python
+PYTHON_SERIAL_DEPENDENCIES = $(PYTHON)
 
 define PYTHON_SERIAL_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+	(cd $(@D); $(HOST_DIR)/usr/bin/$(PYTHON) setup.py build)
 endef
 
 define PYTHON_SERIAL_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+	(cd $(@D); $(HOST_DIR)/usr/bin/$(PYTHON) setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
