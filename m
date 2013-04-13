From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 13 Apr 2013 13:56:49 -0300
Subject: [Buildroot] [PATCH 2/3] python-bottle: bump version and fix shebang
In-Reply-To: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1365872210-20167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1365872210-20167-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 0.11.6
Add the --executable shebang fixup option to the build phase so that the
script ends with a proper #!/usr/bin/python interpeter line set.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/python-bottle/python-bottle.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 370b31b..9df359f 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PYTHON_BOTTLE_VERSION = 0.11.4
+PYTHON_BOTTLE_VERSION = 0.11.6
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
 PYTHON_BOTTLE_DEPENDENCIES = python
@@ -12,7 +12,7 @@ PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
 
 define PYTHON_BOTTLE_BUILD_CMDS
-	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build)
+	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build --executable=/usr/bin/python)
 endef
 
 define PYTHON_BOTTLE_INSTALL_TARGET_CMDS
-- 
1.8.1.5
