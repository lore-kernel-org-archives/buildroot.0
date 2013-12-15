From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:38:57 +0100
Subject: [Buildroot] [git commit] python-serial: convert to the Python
	package infrastructure
Message-ID: <20131215130826.3FAAE9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5da217204c5d499541237aa54056d32ab0ed5c95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-serial/python-serial.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index e00577b..a44d799 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -7,15 +7,6 @@
 PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
 PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial
+PYTHON_SERIAL_SETUP_TYPE = distutils
 
-PYTHON_SERIAL_DEPENDENCIES = python
-
-define PYTHON_SERIAL_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
-endef
-
-define PYTHON_SERIAL_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
