From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:40 +0100
Subject: [Buildroot] [PATCHv2 05/36] python-id3: convert to the Python
	package infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-6-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-id3/python-id3.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/python-id3/python-id3.mk b/package/python-id3/python-id3.mk
index 9328a0f..5957f64 100644
--- a/package/python-id3/python-id3.mk
+++ b/package/python-id3/python-id3.mk
@@ -7,15 +7,6 @@
 PYTHON_ID3_VERSION = 1.2
 PYTHON_ID3_SOURCE = id3-py_$(PYTHON_ID3_VERSION).tar.gz
 PYTHON_ID3_SITE = http://downloads.sourceforge.net/project/id3-py/id3-py/$(PYTHON_ID3_VERSION)
+PYTHON_ID3_SETUP_TYPE = distutils
 
-PYTHON_ID3_DEPENDENCIES = python
-
-define PYTHON_ID3_BUILD_CMDS
-    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_ID3_INSTALL_TARGET_CMDS
-    (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
-- 
1.8.1.2
