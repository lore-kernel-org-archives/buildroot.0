From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:48 +0100
Subject: [Buildroot] [PATCH 19/38] python-setuptools: convert to the Python
	package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-setuptools/python-setuptools.mk | 28 +++-----------------------
 1 file changed, 3 insertions(+), 25 deletions(-)

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
-- 
1.8.1.2
