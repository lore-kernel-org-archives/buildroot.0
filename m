From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 13:24:09 +0100
Subject: [Buildroot] [PATCH 5/5] python-serial: Convert package to be used
	with python2 or python3
In-Reply-To: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360671849-7621-6-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-serial/Config.in        |    2 +-
 package/python-serial/python-serial.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-serial/Config.in b/package/python-serial/Config.in
index ea090bd..db6a4b1 100644
--- a/package/python-serial/Config.in
+++ b/package/python-serial/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_SERIAL
 	bool "python-serial"
-	depends on BR2_PACKAGE_PYTHON
+	depends on (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
 	help
 	  python-serial is a Python library to access serial ports.
 
diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index fb6b31c..6f2bb85 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -8,7 +8,7 @@ PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial/
 
-PYTHON_SERIAL_DEPENDENCIES = python
+PYTHON_SERIAL_DEPENDENCIES = $(PYTHON_GENERIC_DEPENDENCIES)
 
 define PYTHON_SERIAL_BUILD_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-- 
1.7.10.4
