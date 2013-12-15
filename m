From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:39:31 +0100
Subject: [Buildroot] [git commit] python-setuptools: convert to the Python
	package infrastructure
Message-ID: <20131215130826.484A29BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3fcb28e7a15eb6dd3e768528fac5c9293b11e0a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-setuptools/python-setuptools.mk |   28 ++---------------------
 1 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index 73c819f..13df448 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -12,29 +12,7 @@
 PYTHON_SETUPTOOLS_VERSION = 0.6.36
 PYTHON_SETUPTOOLS_SOURCE  = distribute-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
 PYTHON_SETUPTOOLS_SITE    = http://pypi.python.org/packages/source/d/distribute
-PYTHON_SETUPTOOLS_DEPENDENCIES = python
+PYTHON_SETUPTOOLS_SETUP_TYPE = setuptools
 
-define HOST_PYTHON_SETUPTOOLS_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_SETUPTOOLS_BUILD_CMDS
-	(cd $(@D); \
-	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
-	$(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define HOST_PYTHON_SETUPTOOLS_INSTALL_CMDS
-	(cd $(@D); \
-	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
-endef
-
-define PYTHON_SETUPTOOLS_INSTALL_TARGET_CMDS
-	(cd $(@D); \
-	PYTHONPATH="$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
-	$(HOST_DIR)/usr/bin/python setup.py install --executable=/usr/bin/python \
-	--single-version-externally-managed --root=/ --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
-$(eval $(host-generic-package))
+$(eval $(python-package))
+$(eval $(host-python-package))
