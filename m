From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 21:59:09 +0100
Subject: [Buildroot] [git commit] eigen: fix indentation
Message-ID: <20151228205927.4F3F882531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d5ea5bd9161960dc9c2243725307fe003b80bcd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use tabs consistently for indentation.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eigen/eigen.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eigen/eigen.mk b/package/eigen/eigen.mk
index 3eb858a..730bb5f 100644
--- a/package/eigen/eigen.mk
+++ b/package/eigen/eigen.mk
@@ -23,8 +23,8 @@ endif
 # Generate the .pc file at build time
 define EIGEN_BUILD_CMDS
 	sed -r -e 's,^Version: .*,Version: $(EIGEN_VERSION),' \
-	       -e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
-	       $(@D)/eigen3.pc.in >$(@D)/eigen3.pc
+		-e 's,^Cflags: .*,Cflags: -I$(EIGEN_DEST_DIR),' \
+		$(@D)/eigen3.pc.in >$(@D)/eigen3.pc
 endef
 
 # This package only consists of headers that need to be
@@ -35,7 +35,7 @@ define EIGEN_INSTALL_STAGING_CMDS
 	cp -a $(@D)/Eigen $(EIGEN_DEST_DIR)
 	$(EIGEN_INSTALL_UNSUPPORTED_MODULES_CMDS)
 	$(INSTALL) -D -m 0644 $(@D)/eigen3.pc \
-			      $(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
+		$(STAGING_DIR)/usr/lib/pkgconfig/eigen3.pc
 endef
 
 $(eval $(generic-package))
