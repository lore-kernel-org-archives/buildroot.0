From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Oct 2015 19:01:21 +0100
Subject: [Buildroot] [git commit] linux: Add zImage.epapr target
Message-ID: <20151031180133.DB26B8042D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc3935ea1d3553591438211ec8b6072429ac7e60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in |    4 ++++
 linux/linux.mk  |    2 ++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f52033..8a66866 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -205,6 +205,10 @@ config BR2_LINUX_KERNEL_ZIMAGE
 		   BR2_powerpc64 || BR2_powerpc64le || BR2_sparc || \
 		   BR2_sh || BR2_sh64 || BR2_xtensa
 
+config BR2_LINUX_KERNEL_ZIMAGE_EPAPR
+	bool "zImage.epapr"
+	depends on BR2_powerpc64 || BR2_powerpc64le
+
 config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	bool "zImage with appended DT"
 	depends on BR2_arm || BR2_armeb
diff --git a/linux/linux.mk b/linux/linux.mk
index 6c7ecfc..9507837 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -105,6 +105,8 @@ else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX_IMAGE_NAME = bzImage
 else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE),y)
 LINUX_IMAGE_NAME = zImage
+else ifeq ($(BR2_LINUX_KERNEL_ZIMAGE_EPAPR),y)
+LINUX_IMAGE_NAME = zImage.epapr
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_ZIMAGE),y)
 LINUX_IMAGE_NAME = zImage
 else ifeq ($(BR2_LINUX_KERNEL_CUIMAGE),y)
