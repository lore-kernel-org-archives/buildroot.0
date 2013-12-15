From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:37:27 +0100
Subject: [Buildroot] [git commit] python-meld3: convert to the Python
	package infrastructure
Message-ID: <20131215130826.01E0E9C035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9167f5a38fb7a879bc4bd5afd03a553060d5e08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-meld3/python-meld3.mk |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 27da9c8..cb8dec0 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -7,16 +7,8 @@
 PYTHON_MELD3_VERSION = 0.6.8
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
 PYTHON_MELD3_SITE = http://pypi.python.org/packages/source/m/meld3/
-PYTHON_MELD3_DEPENDENCIES = python
 PYTHON_MELD3_LICENSE = ZPLv2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
+PYTHON_MELD3_SETUP_TYPE = distutils
 
-define PYTHON_MELD3_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_MELD3_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
