From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 13:38:37 +0100
Subject: [Buildroot] [git commit] python-pyro: convert to the Python package
	infrastructure
Message-ID: <20131215130826.3164B9C025@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fac776c8ccc41dc030345d5c5286485b47b17c9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyro/python-pyro.mk |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/python-pyro/python-pyro.mk b/package/python-pyro/python-pyro.mk
index 67aabc6..6f118ba 100644
--- a/package/python-pyro/python-pyro.mk
+++ b/package/python-pyro/python-pyro.mk
@@ -9,10 +9,6 @@ PYTHON_PYRO_SOURCE  = Pyro-$(PYTHON_PYRO_VERSION).tar.gz
 PYTHON_PYRO_SITE    = https://pypi.python.org/packages/source/P/Pyro/
 PYTHON_PYRO_LICENSE = MIT
 PYTHON_PYRO_LICENSE_FILES = LICENSE
-PYTHON_PYRO_DEPENDENCIES = python
+PYTHON_PYRO_SETUP_TYPE = distutils
 
-define PYTHON_PYRO_INSTALL_TARGET_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
-endef
-
-$(eval $(generic-package))
+$(eval $(python-package))
