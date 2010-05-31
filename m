From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:05 +0200
Subject: [Buildroot] [PATCH 19/46] grub: remove GRUB_SUPPORTED_ARCH
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <92e0cbb1e3adc1695bfa528f39e9c15226d151bf.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

grub can already only be selected for x86 and x86_64. No need to check
again for this in grub.mk.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.mk |   19 -------------------
 1 files changed, 0 insertions(+), 19 deletions(-)

diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index 80f9b6d..96b082d 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -1,20 +1,3 @@
-GRUB_SUPPORTED_ARCH=n
-ifeq ($(ARCH),i386)
-GRUB_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i486)
-GRUB_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i586)
-GRUB_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i686)
-GRUB_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),x86_64)
-GRUB_SUPPORTED_ARCH=y
-endif
-ifeq ($(GRUB_SUPPORTED_ARCH),y)
 #############################################################
 #
 # grub
@@ -125,8 +108,6 @@ grub-clean:
 grub-dirclean:
 	rm -rf $(GRUB_DIR)
 
-endif
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.7.0.4
