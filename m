From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] Get rid of the code computing
	ROOTFS_SUFFIX
Message-ID: <20100502220951.BCFD68ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d70a3800b264e768ec8656221444c7a0ffd9ac6b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index adc645e..5f7af99 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -95,14 +95,6 @@ TARGET_CXXFLAGS=$(TARGET_CFLAGS)
 TARGET_LDFLAGS=--sysroot $(STAGING_DIR)/
 endif
 #########################################################################
-#ifeq ($(BR2_ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=$(call qstrip,$(BR2_ROOTFS_SUFFIX))
-ifeq ($(ROOTFS_SUFFIX),)
-ROOTFS_SUFFIX:=
-else
-XXXX=xxxx
-ROOTFS_SUFFIX:=-$(BR2_ROOTFS_SUFFIX)
-endif
 
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
 
-- 
1.6.3.3
