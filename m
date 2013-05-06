From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 09:30:14 +0200
Subject: [Buildroot] [git commit] python-serial: fix shebang
Message-ID: <20130506073609.D9E4D99C35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f40b6ae2b27486af2deb999385e3d7f034e4bd5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the --executable shebang fixup option to the build phase so that the
script ends with a proper #!/usr/bin/python interpeter line set.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-serial/python-serial.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-serial/python-serial.mk b/package/python-serial/python-serial.mk
index fb6b31c..4bfc355 100644
--- a/package/python-serial/python-serial.mk
+++ b/package/python-serial/python-serial.mk
@@ -6,12 +6,12 @@
 
 PYTHON_SERIAL_VERSION = 2.6
 PYTHON_SERIAL_SOURCE  = pyserial-$(PYTHON_SERIAL_VERSION).tar.gz
-PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial/
+PYTHON_SERIAL_SITE    = http://pypi.python.org/packages/source/p/pyserial
 
 PYTHON_SERIAL_DEPENDENCIES = python
 
 define PYTHON_SERIAL_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
 endef
 
 define PYTHON_SERIAL_INSTALL_TARGET_CMDS
