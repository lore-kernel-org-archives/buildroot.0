From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 12:02:13 +0200
Subject: [Buildroot] [git commit] eigen: follow default installation scheme
Message-ID: <20140330100447.86AAB9C422@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3afdd6621fb5b8e0b955182a9024afe365887693
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

eigen's build-system (cmake), by default, installs the header files
in /usr/include/eigen3

Signed-off-by: Davide Viti <d.viti@infosolution.it>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eigen/eigen.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 5abd464..9a5ce7d 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -12,12 +12,14 @@ EIGEN_LICENSE = MPL2, BSD-3c, LGPLv2.1
 EIGEN_LICENSE_FILES = COPYING.MPL2 COPYING.BSD COPYING.LGPL COPYING.README
 EIGEN_INSTALL_STAGING = YES
 EIGEN_INSTALL_TARGET = NO
+EIGEN_DEST_DIR = $(STAGING_DIR)/usr/include/eigen3
 
 # This package only consists of headers that need to be
 # copied over to the sysroot for compile time use
 define EIGEN_INSTALL_STAGING_CMDS
-	$(RM) -r $(STAGING_DIR)/usr/include/Eigen
-	cp -a $(@D)/Eigen $(STAGING_DIR)/usr/include/
+	$(RM) -r $(EIGEN_DEST_DIR)
+	mkdir -p $(EIGEN_DEST_DIR)
+	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
 endef
 
 $(eval $(generic-package))
