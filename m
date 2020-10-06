From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 23:41:30 +0200
Subject: [Buildroot] [git commit] package/uclibc: use simpler BR2_RISCV_{32,
 64} variables
Message-ID: <20201006213051.0764588C73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad5865f94e6114fc75cf66a51b5793acee0fa73b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uclibc/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 918c5813f2..494758bd9d 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -106,8 +106,8 @@ config BR2_UCLIBC_TARGET_ARCH
 	default "xtensa"   if BR2_xtensa
 	default "i386"	   if BR2_i386
 	default "x86_64"   if BR2_x86_64
-	default "riscv64"  if BR2_riscv && BR2_ARCH_IS_64
-	default "riscv32"  if BR2_riscv && !BR2_ARCH_IS_64
+	default "riscv64"  if BR2_RISCV_64
+	default "riscv32"  if BR2_RISCV_32
 
 config BR2_UCLIBC_MIPS_ABI
 	string
