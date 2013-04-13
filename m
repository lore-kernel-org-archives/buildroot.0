From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 13:56:50 -0300
Subject: [Buildroot] [PATCH 3/3] python-serial: fix shebang
In-Reply-To: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365872210-20167-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the --executable shebang fixup option to the build phase so that the
script ends with a proper #!/usr/bin/python interpeter line set.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-serial/python-serial.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.8.1.5
