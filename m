From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:29 +0200
Subject: [Buildroot] [PATCH 17/35] grub2: remove GRUB2_ARCH_SUPPORTED
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6a4c4457c7398b176336c4f8015347812fd2023a.1271170913.git.thomas.petazzoni@free-electrons.com>
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
1.6.3.3
