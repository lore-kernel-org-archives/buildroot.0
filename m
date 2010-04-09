From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] target/tar: cleanup
Message-ID: <20100409142127.546AE20E5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d36ca79149b027db4f4fd8d3a347c919f90e23c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove dependency on BR2_HOST_FAKEROOT.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/tar/Config.in  |    1 -
 target/tar/tarroot.mk |    6 ------
 2 files changed, 0 insertions(+), 7 deletions(-)

diff --git a/target/tar/Config.in b/target/tar/Config.in
index 0209654..ae02409 100644
--- a/target/tar/Config.in
+++ b/target/tar/Config.in
@@ -1,6 +1,5 @@
 config BR2_TARGET_ROOTFS_TAR
 	bool "tar the root filesystem"
-	select BR2_HOST_FAKEROOT
 	help
 	  Build a tar archive of the root filesystem
 
diff --git a/target/tar/tarroot.mk b/target/tar/tarroot.mk
index a7e95df..d082672 100644
--- a/target/tar/tarroot.mk
+++ b/target/tar/tarroot.mk
@@ -48,12 +48,6 @@ ifneq ($(ROOTFS_TAR_COPYTO),)
 endif
 	- at rm -f $(BUILD_DIR)/_fakeroot.$(notdir $(TAR_TARGET))
 
-tarroot-source:
-
-tarroot-clean:
-
-tarroot-dirclean:
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.6.3.3
