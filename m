From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:36:24 +0100
Subject: [Buildroot] [git commit] python-crc16: convert to the Python
	package infrastructure
Message-ID: <20131215130825.AB1E99C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1cc00e1725e2c6b0b88e46d2f7a264ca65ae9f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-crc16/python-crc16.mk |   25 ++-----------------------
 1 files changed, 2 insertions(+), 23 deletions(-)

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
