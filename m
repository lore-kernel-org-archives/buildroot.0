From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 26 Sep 2014 10:57:41 +0100
Subject: [Buildroot] [PATCH] Add uImage support for MIPS architecture
Message-ID: <1411725461-16398-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uImage support for MIPS was added in the kernel on 2013-09-03, so we
allow to build uImage for MIPS in Buildroot.

Kernel commit:
  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4defe4559e86e26545ab2f542656a4b966dcde53

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 linux/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 0ad8bce..4a3c064 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -168,7 +168,8 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64 || \
+		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
-- 
1.7.1
