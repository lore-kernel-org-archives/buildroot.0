From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 15 Dec 2015 08:16:50 +0100
Subject: [Buildroot] [PATCH] python-pyroute2: bump to 0.3.15
Message-ID: <1450163810-5839-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add a hash file.

Change download location to pypi and remove a pre-configure
hook as the package now provides a stand-alone setup.py.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyroute2/python-pyroute2.hash |  3 +++
 package/python-pyroute2/python-pyroute2.mk   | 13 +++----------
 2 files changed, 6 insertions(+), 10 deletions(-)
 create mode 100644 package/python-pyroute2/python-pyroute2.hash

diff --git a/package/python-pyroute2/python-pyroute2.hash b/package/python-pyroute2/python-pyroute2.hash
new file mode 100644
index 0000000..9784927
--- /dev/null
+++ b/package/python-pyroute2/python-pyroute2.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=09cf70377ddf45ffc27b4ad56bcdf52e, sha256 locally computed
+md5     09cf70377ddf45ffc27b4ad56bcdf52e  pyroute2-0.3.15.tar.gz
+sha256  f5b7116fd97f73f97adc3b9c040a4ddbe61f18bb02f47e1c8399567c8791d270  pyroute2-0.3.15.tar.gz
diff --git a/package/python-pyroute2/python-pyroute2.mk b/package/python-pyroute2/python-pyroute2.mk
index 61de195..fffd556 100644
--- a/package/python-pyroute2/python-pyroute2.mk
+++ b/package/python-pyroute2/python-pyroute2.mk
@@ -4,18 +4,11 @@
 #
 #############################################################
 
-PYTHON_PYROUTE2_VERSION = 16a8aced82c65b94eb9e15a7d773a3256763d155
-PYTHON_PYROUTE2_SITE = $(call github,svinota,pyroute2,$(PYTHON_PYROUTE2_VERSION))
+PYTHON_PYROUTE2_VERSION = 0.3.15
+PYTHON_PYROUTE2_SOURCE = pyroute2-$(PYTHON_PYROUTE2_VERSION).tar.gz
+PYTHON_PYROUTE2_SITE = https://pypi.python.org/packages/source/p/pyroute2
 PYTHON_PYROUTE2_LICENSE = Apache-2.0 or GPLv2+
 PYTHON_PYROUTE2_LICENSE_FILES = LICENSE.Apache.v2 LICENSE.GPL.v2 README.license.md
 PYTHON_PYROUTE2_SETUP_TYPE = distutils
-PYTHON_PYROUTE2_DEPENDENCIES = host-gawk
-
-# this hook is needed to create setup.py from setup.py.in
-define PYTHON_PYROUTE2_CREATE_SETUP_PY
-	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) update-version
-endef
-
-PYTHON_PYROUTE2_PRE_CONFIGURE_HOOKS += PYTHON_PYROUTE2_CREATE_SETUP_PY
 
 $(eval $(python-package))
-- 
2.1.4
