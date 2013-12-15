From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:36:35 +0100
Subject: [Buildroot] [git commit] python-dpkt: convert to the Python package
	infrastructure
Message-ID: <20131215130825.B2A959C037@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6c20a3524513c39dfb2d47251c2cccd384b5b8f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-dpkt/python-dpkt.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 314415c..0b3dc11 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -7,15 +7,6 @@
 PYTHON_DPKT_VERSION = 1.7
 PYTHON_DPKT_SOURCE  = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
 PYTHON_DPKT_SITE    = http://dpkt.googlecode.com/files
+PYTHON_DPKT_SETUP_TYPE = distutils
 
-PYTHON_DPKT_DEPENDENCIES = python
-
-define PYTHON_DPKT_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
-endef
-
-define PYTHON_DPKT_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
