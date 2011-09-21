From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 21 Sep 2011 08:46:16 +0200
Subject: [Buildroot] [PATCH 2 of 2] linux: make vmlinux target available to
 all architectures
In-Reply-To: <patchbomb.1316587574@localhost6.localdomain6>
References: <patchbomb.1316587574@localhost6.localdomain6>
Message-ID: <154480348720d8530ebf.1316587576@localhost6.localdomain6>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The 'vmlinux' target in the linux build directory is a generic target. It may
not be directly bootable for all architectures, but for projects where a custom
bootloader is used, it can be of value.

Previously, this target was only available for mips architectures. This patch
removes this restriction.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 linux/Config.in |  1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -146,7 +146,6 @@
 
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
-	depends on BR2_mips || BR2_mipsel
 
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
