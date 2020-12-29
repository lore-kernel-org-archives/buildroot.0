From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:15:26 +0100
Subject: [Buildroot] [git commit] toolchain/toolchain-buildroot: glibc 2.32
 for ARC needs linux-headers >= 5.1.0
Message-ID: <20201229205801.B570B82AA6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a9bce7339de3d5f11d22440234488a38c9dac0e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ARC support has been merged into glibc 2.32 but it requires
linux-headers >= 5.1.0 [1].

Fixes:
https://gitlab.com/kubu93/toolchains-builder/-/jobs/895774971

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0be8ae3679570ff9a193615a035fc8074a8c704f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 019495accf..f6f1bcc75d 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -56,6 +56,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1 || !BR2_arc
 	depends on !BR2_powerpc_SPE
 	depends on BR2_RISCV_ISA_RVA || !BR2_riscv
 	select BR2_TOOLCHAIN_USES_GLIBC
