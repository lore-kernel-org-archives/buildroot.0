From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 7 Jan 2012 20:59:17 +0100
Subject: [Buildroot] [git commit] New package: python-distutilscross
Message-ID: <20120107201230.E2E838FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e64b34e957522c355ed77f6356666862c99a1b96
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../python-distutilscross/python-distutilscross.mk |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
new file mode 100644
index 0000000..9003189
--- /dev/null
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -0,0 +1,21 @@
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
