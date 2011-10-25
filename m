From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 25 Oct 2011 08:17:10 +0200
Subject: [Buildroot] [git commit] linux: vmlinux target is valid for powerpc
	too
Message-ID: <20111025062902.2BC8A8F0DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c4b0af9885ab6649aa547aa01943cb1ee2d18f09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The vmlinux kernel target is valid for powerpc kernels too.
In fact this broke the qemu sample config.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
