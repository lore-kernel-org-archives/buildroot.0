From: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
Date: Fri,  3 Aug 2007 07:56:05 +0200
Subject: [Buildroot] [PATCH 1/1] uClibc: fix variable type in ARM mmap fix
	which fails to build on AVR32
Message-ID: <11861205653813-git-send-email-hcegtvedt@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Hans-Christian Egtvedt <hcegtvedt@atmel.com>
---
 toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch b/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
index af38be3..4775e8c 100644
--- a/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
+++ b/toolchain/uClibc/uClibc-0.9.29-001-fix-mmap.patch
@@ -84,7 +84,7 @@
 +                         fd,((__u_quad_t)offset >> MMAP2_PAGE_SHIFT));
 +#else
 +   return __syscall_mmap2(addr, len, prot, flags,
-+                          fd,((__ulong_t)offset >> MMAP2_PAGE_SHIFT));
++                          fd,((__u_long)offset >> MMAP2_PAGE_SHIFT));
 +#endif
  }
  
-- 
1.5.2.3
