From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Mar 2019 15:57:57 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] linux: allow
 BR2_LINUX_KERNEL_IMAGE on RISC-V
Message-ID: <20190327145930.AFFB7817E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=427742a029761907ac59b0d100f1826577903f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

We will need to build Image files for OpenSBI so allow that now.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a3a4d4d4d307fd21f19ae43e77ac21b85adad7f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index f17334ae7c..037a2f023e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -257,7 +257,7 @@ config BR2_LINUX_KERNEL_SIMPLEIMAGE
 
 config BR2_LINUX_KERNEL_IMAGE
 	bool "Image"
-	depends on BR2_aarch64
+	depends on BR2_aarch64 || BR2_riscv
 
 config BR2_LINUX_KERNEL_LINUX_BIN
 	bool "linux.bin"
