From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Apr 2014 21:48:59 +0200
Subject: [Buildroot] [git commit] pyrex: new package
Message-ID: <20140411200233.38F629C721@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d26482762ca75f04cf4cde3f5e7195d810bac9f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pyrex is a language that allows you to mix python and C code in a
single .pyx description file.  This file is then rendered into C
code by the pyrexc host tool.  That C file then can be used within
an application build or as part of the normal distutils build
process used to build a Python extension module.

Signed-off-by: Matt Weber <mlweber1@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyrex/python-pyrex.mk |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/package/python-pyrex/python-pyrex.mk b/package/python-pyrex/python-pyrex.mk
new file mode 100644
index 0000000..73cb163
--- /dev/null
+++ b/package/python-pyrex/python-pyrex.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-pyrex
+#
+################################################################################
+
+PYTHON_PYREX_VERSION = 0.9.9
+PYTHON_PYREX_SOURCE = Pyrex-$(PYTHON_PYREX_VERSION).tar.gz
+PYTHON_PYREX_SITE = http://www.cosc.canterbury.ac.nz/greg.ewing/python/Pyrex/
+PYTHON_PYREX_DEPENDENCIES = host-python
+PYTHON_PYREX_LICENSE = Apache-v2
+PYTHON_PYREX_LICENSE_FILES = LICENSE.txt
+PYTHON_PYREX_SETUP_TYPE = distutils
+
+$(eval $(host-python-package))
