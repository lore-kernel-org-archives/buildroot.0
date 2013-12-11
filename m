From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:41 +0100
Subject: [Buildroot] [PATCHv2 06/36] python-ipy: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-ipy/python-ipy.mk | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/package/python-ipy/python-ipy.mk b/package/python-ipy/python-ipy.mk
index c03f91f..6e05ee9 100644
--- a/package/python-ipy/python-ipy.mk
+++ b/package/python-ipy/python-ipy.mk
@@ -6,21 +6,8 @@
 
 PYTHON_IPY_VERSION = IPy-0.75
 PYTHON_IPY_SITE    = $(call github,haypo,python-ipy,$(PYTHON_IPY_VERSION))
-PYTHON_IPY_DEPENDENCIES = host-python python
 PYTHON_IPY_LICENSE = BSD-3c
 PYTHON_IPY_LICENSE_FILES = COPYING
+PYTHON_IPY_SETUP_TYPE = distutils
 
-define PYTHON_IPY_BUILD_CMDS
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(HOST_DIR)/usr/bin/python setup.py build_ext \
-		--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR) \
-	)
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_IPY_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
