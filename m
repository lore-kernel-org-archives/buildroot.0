From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 6 May 2013 09:30:08 +0200
Subject: [Buildroot] [git commit] python-bottle: bump version and fix shebang
Message-ID: <20130506073609.9654A99C35@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=378ceef8c9ad36a93cc835e617ce3583affba06b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 0.11.6
Add the --executable shebang fixup option to the build phase so that the
script ends with a proper #!/usr/bin/python interpeter line set.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python-bottle/python-bottle.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

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
