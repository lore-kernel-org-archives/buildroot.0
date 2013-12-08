From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Dec 2013 23:14:52 +0100
Subject: [Buildroot] [PATCH 23/38] python-distutilscross: convert to the
	Python package infrastructure
In-Reply-To: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386540907-7242-24-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-distutilscross/python-distutilscross.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

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
-- 
1.8.1.2
