From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:27 +0100
Subject: [Buildroot] [git commit] python-dialog: convert to the Python
	package infrastructure
Message-ID: <20131215130826.765019C035@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3e65118132968b6575a98431337a5300e38879d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dialog/python-dialog.mk |   14 +++-----------
 1 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/package/python-dialog/python-dialog.mk b/package/python-dialog/python-dialog.mk
index fa496de..e6887c9 100644
--- a/package/python-dialog/python-dialog.mk
+++ b/package/python-dialog/python-dialog.mk
@@ -9,15 +9,7 @@ PYTHON_DIALOG_SOURCE  = python2-pythondialog-$(PYTHON_DIALOG_VERSION).tar.bz2
 PYTHON_DIALOG_SITE    = http://downloads.sourceforge.net/project/pythondialog/pythondialog/$(PYTHON_DIALOG_VERSION)
 PYTHON_DIALOG_LICENSE = LGPLv2.1+
 PYTHON_DIALOG_LICENSE_FILES = COPYING
+PYTHON_DIALOG_SETUP_TYPE = distutils
+PYTHON_DIALOG_DEPENDENCIES = dialog
 
-PYTHON_DIALOG_DEPENDENCIES = python dialog
-
-define PYTHON_DIALOG_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_DIALOG_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
