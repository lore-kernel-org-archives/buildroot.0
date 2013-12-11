From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Dec 2013 21:26:53 +0100
Subject: [Buildroot] [PATCHv2 18/36] scons: convert to the Python package
	infrastructure
In-Reply-To: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386793631-14026-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1386793631-14026-19-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/scons/scons.mk | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index a7747d5..e3fad1b 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -8,17 +8,12 @@ SCONS_VERSION = 2.3.0
 SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
 SCONS_LICENSE = MIT
 SCONS_LICENSE_FILES = LICENSE.txt
+SCONS_SETUP_TYPE = distutils
 
-define HOST_SCONS_BUILD_CMDS
-	(cd $(@D); python setup.py build)
-endef
+HOST_SCONS_INSTALL_OPT = \
+	--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION)
 
-define HOST_SCONS_INSTALL_CMDS
-	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr \
-		--install-lib=$(HOST_DIR)/usr/lib/scons-$(SCONS_VERSION))
-endef
-
-$(eval $(host-generic-package))
+$(eval $(host-python-package))
 
 # variables used by other packages
 SCONS = $(HOST_DIR)/usr/bin/scons
-- 
1.8.1.2
