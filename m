From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Mar 2019 22:06:15 +0100
Subject: [Buildroot] [git commit] linux: allow BR2_LINUX_KERNEL_IMAGE on
 RISC-V
Message-ID: <20190319210308.A58267FBD7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a3a4d4d4d307fd21f19ae43e77ac21b85adad7f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will need to build Image files for OpenSBI so allow that now.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 818b94e1c0..dc10238053 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -258,7 +258,7 @@ config BR2_LINUX_KERNEL_SIMPLEIMAGE
 
 config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
-	depends on BR2_aarch64
+	depends on BR2_aarch64 || BR2_riscv
 
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
