From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:52:18 +0100
Subject: [Buildroot] [git commit] system: simplify
	BR2_ROOTFS_SKELETON_DEFAULT handling
Message-ID: <20130106205645.881B49A630@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b2a40b6d7d6ce9a892c6230e3b41e8e0b252896
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 system/system.mk |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/system/system.mk b/system/system.mk
index 4e131b0..44a33ae 100644
--- a/system/system.mk
+++ b/system/system.mk
@@ -50,15 +50,9 @@ endif
 
 ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 TARGETS += target-root-passwd
-endif
 
 ifneq ($(TARGET_GENERIC_GETTY),)
-ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
-TARGETS += target-generic-getty-sysvinit
-else
-TARGETS += target-generic-getty-busybox
-endif
+TARGETS += target-generic-getty-$(if $(BR2_PACKAGE_SYSVINIT),sysvinit,busybox)
 endif
 
 ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
