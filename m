From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 16:20:53 +0100
Subject: [Buildroot] [git commit] linux: make vmlinux target available to
	all architectures
Message-ID: <20111114153838.00CE08F3AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73d757b714becaa64d3b5d389094369c39524150
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 'vmlinux' target in the linux build directory is a generic target. It may
not be directly bootable for all architectures, but for projects where a custom
bootloader is used, it can be of value.

Previously, this target was only available for mips architectures. This patch
removes this restriction.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 linux/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 67381dc..c304d86 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,7 +146,6 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
-	depends on BR2_mips || BR2_mipsel || BR2_powerpc
 
 config BR2_LINUX_KERNEL_VMLINUZ
 	bool "vmlinuz"
