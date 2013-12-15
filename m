From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:41:25 +0100
Subject: [Buildroot] [git commit] python-distutilscross: convert to the
	Python package infrastructure
Message-ID: <20131215130826.6565F9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8b9ef8934c510dfee7e27951dedcc755e52578c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-distutilscross/python-distutilscross.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
index df12f97..cfe2811 100644
--- a/package/python-distutilscross/python-distutilscross.mk
+++ b/package/python-distutilscross/python-distutilscross.mk
@@ -7,15 +7,6 @@
 PYTHON_DISTUTILSCROSS_VERSION = 0.1
 PYTHON_DISTUTILSCROSS_SOURCE  = distutilscross-$(PYTHON_DISTUTILSCROSS_VERSION).tar.gz
 PYTHON_DISTUTILSCROSS_SITE    = http://pypi.python.org/packages/source/d/distutilscross
+PYTHON_DISTUTILSCROSS_SETUP_TYPE = setuptools
 
-HOST_PYTHON_DISTUTILSCROSS_DEPENDENCIES = host-python host-python-setuptools
-
-define HOST_PYTHON_DISTUTILSCROSS_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define HOST_PYTHON_DISTUTILSCROSS_INSTALL_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(HOST_DIR)/usr)
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-python-package))
