From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed,  4 Jan 2012 12:30:04 +0100
Subject: [Buildroot] [PATCH v5 5/6] New package: python-distutilscross
In-Reply-To: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
References: <1325676605-31194-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1325676605-31194-6-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../python-distutilscross/python-distutilscross.mk |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/python-distutilscross/python-distutilscross.mk

diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
new file mode 100644
index 0000000..41def71
--- /dev/null
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# python-distutilscross
+#
+#############################################################
+
+PYTHON_DISTUTILSCROSS_VERSION = 0.1
+PYTHON_DISTUTILSCROSS_SOURCE  = distutilscross-$(PYTHON_DISTUTILSCROSS_VERSION).tar.gz
+PYTHON_DISTUTILSCROSS_SITE    = http://pypi.python.org/packages/source/d/distutilscross
+
+HOST_PYTHON_DISTUTILSCROSS_DEPENDENCIES = host-python host-python-setuptools
+
+define HOST_PYTHON_DISTUTILSCROSS_BUILD_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+endef
+
+define HOST_PYTHON_DISTUTILSCROSS_INSTALL_CMDS
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS,host))
+
-- 
1.7.1.1
