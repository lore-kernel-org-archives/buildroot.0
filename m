From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:45 +0100
Subject: [Buildroot] [PATCHv2 10/36] python-nfc: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-11-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-nfc/python-nfc.mk | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/python-nfc/python-nfc.mk b/package/python-nfc/python-nfc.mk
index f406e2a..5f486d9 100644
--- a/package/python-nfc/python-nfc.mk
+++ b/package/python-nfc/python-nfc.mk
@@ -7,14 +7,7 @@
 PYTHON_NFC_VERSION = 142
 PYTHON_NFC_SITE = https://launchpad.net/nfcpy
 PYTHON_NFC_SITE_METHOD = bzr
-PYTHON_NFC_DEPENDENCIES = python libusb libusb-compat
+PYTHON_NFC_DEPENDENCIES = libusb libusb-compat
+PYTHON_NFC_SETUP_TYPE = distutils
 
-define PYTHON_NFC_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_NFC_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
