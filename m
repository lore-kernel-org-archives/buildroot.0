From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 22 Nov 2012 01:18:05 +0100
Subject: [Buildroot] [PATCH 15/33] scons: force to use python2 on the host
In-Reply-To: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1353543503-8952-16-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Scons is not yet python2/python3 compliant.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/scons/scons.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 7cc234e..45f2e1e 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -1,13 +1,14 @@
 SCONS_VERSION = 2.0.1
 SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
+HOST_SCONS_DEPENDENCIES = $(NEED_PYTHON2)
 
 define HOST_SCONS_BUILD_CMDS
-	(cd $(@D); python setup.py build)
+	(cd $(@D); $(PYTHON2) setup.py build)
 endef
 
 define HOST_SCONS_INSTALL_CMDS
-	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr \
+	(cd $(@D); $(PYTHON2) setup.py install --prefix=$(HOST_DIR)/usr \
 		--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))
 endef
 
-- 
1.8.0
