From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:37:39 +0100
Subject: [Buildroot] [git commit] python-protobuf: convert to the Python
	package infrastructure
Message-ID: <20131215130826.1834C9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=033e218c34398afc1c52c7d30216e13bf5242582
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-protobuf/python-protobuf.mk |   20 ++++----------------
 1 files changed, 4 insertions(+), 16 deletions(-)

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
