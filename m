From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Aug 2012 20:03:32 +0200
Subject: [Buildroot] [git commit] linux: Rename blackfin kernel Image file
	from vmImage back to uImage
Message-ID: <20120811180400.C344497164@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f299105e7a82f7b1f76bdff15fd0413e6fac4fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Consist with other architectures.

Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 5365d5f..c4bdf90 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -69,12 +69,7 @@ ifeq ($(BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM),y)
 LINUX_IMAGE_NAME=$(call qstrip,$(BR2_LINUX_KERNEL_IMAGE_TARGET_NAME))
 else
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
-ifeq ($(KERNEL_ARCH),blackfin)
-# a uImage, but with a different file name
-LINUX_IMAGE_NAME=vmImage
-else
 LINUX_IMAGE_NAME=uImage
-endif
 else ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
 LINUX_IMAGE_NAME=uImage
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
