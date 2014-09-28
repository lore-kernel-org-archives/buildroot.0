From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Sep 2014 22:59:56 +0200
Subject: [Buildroot] [git commit] linux: Add uImage support for MIPS
	architecture
Message-ID: <20140928212210.2B1599D76C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c51c31de78d3b3721dd7c7d11c4f0bce3a43206
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uImage support for MIPS was added in the kernel on 2013-09-03, so we
allow to build uImage for MIPS in Buildroot.

Kernel commit:
  http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=4defe4559e86e26545ab2f542656a4b966dcde53

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
