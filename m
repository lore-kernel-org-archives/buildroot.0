From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:34 +0100
Subject: [Buildroot] [PATCH 05/38] python-crc16: convert to the Python
	package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-crc16/python-crc16.mk | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index adfdcc6..9dd09ae 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -9,27 +9,6 @@ PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
 PYTHON_CRC16_SITE = http://pycrc16.googlecode.com/files/
 PYTHON_CRC16_LICENSE = LGPLv3+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
-PYTHON_CRC16_DEPENDENCIES = python host-python
+PYTHON_CRC16_SETUP_TYPE = distutils
 
-PYTHON_CRC16_PARAMS = CC="$(TARGET_CC)" \
-		CFLAGS="$(TARGET_CFLAGS)" \
-		LDSHARED="$(TARGET_CC) -shared" \
-		LDFLAGS="$(TARGET_LDFLAGS) -L$(STAGING_DIR)/usr/lib" \
-		CROSS_COMPILING=yes \
-		_python_sysroot=$(STAGING_DIR) \
-		_python_srcdir=$(PYTHON_DIR) \
-		_python_prefix=/usr \
-		_python_exec_prefix=/usr
-
-define PYTHON_CRC16_BUILD_CMDS
-	(cd $(@D); $(PYTHON_CRC16_PARAMS) \
-		$(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_CRC16_INSTALL_TARGET_CMDS
-	(cd $(@D); $(PYTHON_CRC16_PARAMS) \
-		$(HOST_DIR)/usr/bin/python setup.py install \
-		--prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
