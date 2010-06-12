From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Jun 2010 16:21:57 +0200
Subject: [Buildroot] [PATCH 23/49] grub2: remove GRUB2_ARCH_SUPPORTED
In-Reply-To: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
References: <cover.1276352307.git.thomas.petazzoni@free-electrons.com>
Message-ID: <399131e62b658f0ac94e557292f596ced4483409.1276352308.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
