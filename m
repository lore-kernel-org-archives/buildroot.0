From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 May 2013 17:30:56 +0200
Subject: [Buildroot] [git commit] linux: CONFIG_KERNEL_LZO option requires
	host-lzop
Message-ID: <20130514153142.3AB709A1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b273ea860504666cf204eb475421e21cbcac639
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the LZO compression mode is chosen the linux kernel requires
lzop host utility at build time.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/linux.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d375cf0..3877c35 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -34,7 +34,7 @@ endif
 LINUX_PATCHES = $(call qstrip,$(BR2_LINUX_KERNEL_PATCH))
 
 LINUX_INSTALL_IMAGES = YES
-LINUX_DEPENDENCIES  += host-module-init-tools
+LINUX_DEPENDENCIES  += host-module-init-tools host-lzop
 
 ifeq ($(BR2_LINUX_KERNEL_UBOOT_IMAGE),y)
 	LINUX_DEPENDENCIES += host-uboot-tools
