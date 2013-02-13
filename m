From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Wed, 13 Feb 2013 10:20:36 +0100
Subject: [Buildroot] [PATCH v3 4/5] python-bottle: Convert package to be
	used with python2 or python3
In-Reply-To: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
References: <1360747237-30048-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360747237-30048-5-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-bottle/python-bottle.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 370b31b..b8a1847 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -7,16 +7,16 @@
 PYTHON_BOTTLE_VERSION = 0.11.4
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
-PYTHON_BOTTLE_DEPENDENCIES = python
+PYTHON_BOTTLE_DEPENDENCIES = $(PYTHON)
 PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
 
 define PYTHON_BOTTLE_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+	(cd $(@D); $(HOST_DIR)/usr/bin/$(PYTHON) setup.py build)
 endef
 
 define PYTHON_BOTTLE_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
+	(cd $(@D); $(HOST_DIR)/usr/bin/$(PYTHON) setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
 $(eval $(generic-package))
-- 
1.7.9.5
