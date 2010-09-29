From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Sep 2010 12:36:07 +0200
Subject: [Buildroot] [git commit master 1/1] linux: fix uImage location on
	AVR32
Message-ID: <20100929103947.F019E8B769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=96652637ccfd94442224019c54341bf86094366a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On most architectures, the kernel image can be found in
arch/<ARCH>/boot, but on AVR32, it's in arch/<ARCH>/boot/images.

Issue initially reported by Joachim Pihl
<joachim.pihl@sensordevelopments.com>.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 4490023..55dc2bf 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -42,7 +42,11 @@ else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX26_IMAGE_NAME=vmlinux.bin
 endif
 
+ifeq ($(KERNEL_ARCH),avr32)
+LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/images/$(LINUX26_IMAGE_NAME)
+else
 LINUX26_IMAGE_PATH=$(LINUX26_DIR)/arch/$(KERNEL_ARCH)/boot/$(LINUX26_IMAGE_NAME)
+endif
 
 # Download
 $(LINUX26_DIR)/.stamp_downloaded:
-- 
1.7.1
