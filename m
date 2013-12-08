From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:42 +0100
Subject: [Buildroot] [PATCH 13/38] python-protobuf: convert to the Python
	package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-protobuf/python-protobuf.mk | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/package/python-protobuf/python-protobuf.mk b/package/python-protobuf/python-protobuf.mk
index dcf67c2..36ab644 100644
--- a/package/python-protobuf/python-protobuf.mk
+++ b/package/python-protobuf/python-protobuf.mk
@@ -9,20 +9,8 @@ PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
 PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
 PYTHON_PROTOBUF_LICENSE = BSD-3c
 PYTHON_PROTOBUF_LICENSE_FILES = COPYING.txt
+PYTHON_PROTOBUF_DEPENDENCIES = host-protobuf
+PYTHON_PROTOBUF_SETUP_TYPE = setuptools
+PYTHON_PROTOBUF_SUBDIR = python
 
-PYTHON_PROTOBUF_DEPENDENCIES = python host-python-setuptools \
-        host-python-distutilscross host-protobuf
-
-define PYTHON_PROTOBUF_BUILD_CMDS
-	(cd $(@D)/python; \
-		PYTHONXCPREFIX="$(STAGING_DIR)/usr/" \
-		PATH=$(HOST_PATH) \
-	$(HOST_DIR)/usr/bin/python setup.py build -x)
-endef
-
-define PYTHON_PROTOBUF_INSTALL_TARGET_CMDS
-	(cd $(@D)/python; PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages \
-	$(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
