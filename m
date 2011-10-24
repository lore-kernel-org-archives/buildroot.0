From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Oct 2011 16:42:09 -0300
Subject: [Buildroot] [PATCH 1/6] linux: vmlinux target is valid for powerpc
	too
Message-ID: <1319485334-15790-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The vmlinux kernel target is valid for powerpc kernels too.
In fact this broke the qemu sample config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 linux/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 774aaf8..469fd7c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,7 +146,7 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
-	depends on BR2_mips || BR2_mipsel
+	depends on BR2_mips || BR2_mipsel || BR2_powerpc
 
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
-- 
1.7.3.4
