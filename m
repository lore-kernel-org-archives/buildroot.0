From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:14 +0200
Subject: [Buildroot] [PATCH 28/46] syslinux: remove the unnecessary
	SYSLINUX_SUPPORTED_ARCH check
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <26325d90038b8e986f817e27035b6a5a62fd51fe.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/syslinux/syslinux.mk |   20 --------------------
 1 files changed, 0 insertions(+), 20 deletions(-)

diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
index 46b41f2..966d0c2 100644
--- a/boot/syslinux/syslinux.mk
+++ b/boot/syslinux/syslinux.mk
@@ -1,21 +1,3 @@
-SYSLINUX_SUPPORTED_ARCH=n
-ifeq ($(ARCH),i386)
-SYSLINUX_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i486)
-SYSLINUX_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i586)
-SYSLINUX_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),i686)
-SYSLINUX_SUPPORTED_ARCH=y
-endif
-ifeq ($(ARCH),x86_64)
-SYSLINUX_SUPPORTED_ARCH=y
-endif
-ifeq ($(SYSLINUX_SUPPORTED_ARCH),y)
-
 #############################################################
 #
 # syslinux to make target msdos/iso9660 filesystems bootable
@@ -59,8 +41,6 @@ pxelinux-clean syslinux-clean:
 pxelinux-dirclean syslinux-dirclean:
 	rm -rf $(SYSLINUX_DIR)
 
-endif
-
 #############################################################
 #
 # Toplevel Makefile options
-- 
1.7.0.4
