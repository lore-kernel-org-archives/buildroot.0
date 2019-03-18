From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 18 Mar 2019 22:44:07 +0000
Subject: [Buildroot] [PATCH v3 1/3] linux: Enable BR2_LINUX_KERNEL_IMAGE on
 RISC-V
Message-ID: <20190318224309.11805-1-alistair.francis@wdc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will need to build Image files for OpenSBI so allow that now.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
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
-- 
2.21.0
