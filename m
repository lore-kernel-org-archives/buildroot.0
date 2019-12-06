From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  6 Dec 2019 11:39:22 -0800
Subject: [Buildroot] [PATCH 1/3] toolchain,
 glibc: Allow ARC big endian glibc builds
In-Reply-To: <20191206193924.18777-1-vgupta@synopsys.com>
References: <20191206193924.18777-1-vgupta@synopsys.com>
Message-ID: <20191206193924.18777-2-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

Apparently big endian glibc builds just work, if we let the endian
header allow that (which prev was #error).

The current ARC glibc version in buildroot arc-2019.09-rc1 already
contains that fix.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 toolchain/toolchain-buildroot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 95d513004aa0..a980f766ac14 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,7 +48,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_riscv       || BR2_sh         || BR2_sparc64     || \
 		   BR2_x86_64      || BR2_microblaze || BR2_nios2       || \
-		   (BR2_arcle && BR2_ARC_ATOMIC_EXT) || BR2_csky
+		   (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
-- 
2.20.1
