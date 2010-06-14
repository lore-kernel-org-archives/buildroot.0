From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] grub2: remove
	GRUB2_ARCH_SUPPORTED
Message-ID: <20100614203438.F074D80E24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=399131e62b658f0ac94e557292f596ced4483409
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub2/grub2.mk |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 119397b..a298ae6 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -1,20 +1,3 @@
-GRUB2_SUPPORTED_ARCH=n
-ifeq ($(ARCH),i386)
-GRUB2_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i486)
-GRUB2_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i586)
-GRUB2_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i686)
-GRUB2_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),x86_64)
-GRUB2_SUPPORTED_ARCH=y
-endif
-ifeq ($(GRUB2_SUPPORTED_ARCH),y)
 #############################################################
 #
 # grub2
@@ -122,8 +105,6 @@ grub2-clean:
 grub2-dirclean:
 	rm -rf $(GRUB2_DIR)
 
-endif
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.7.1
