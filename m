From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:37:33 +0100
Subject: [Buildroot] [git commit] python-nfc: convert to the Python package
	infrastructure
Message-ID: <20131215130826.0EED29BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=527302e73f0ab19b85c2ddf3ff2fd407dd32957b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-nfc/python-nfc.mk |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

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
