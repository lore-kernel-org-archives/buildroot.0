From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:36:55 +0100
Subject: [Buildroot] [git commit] python-id3: convert to the Python package
	infrastructure
Message-ID: <20131215130825.BA7229C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d26c5bc2e9945f4b2b0b8d130ada6dfa1a7957b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-id3/python-id3.mk |   13 ++-----------
 1 files changed, 2 insertions(+), 11 deletions(-)

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
