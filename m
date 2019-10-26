From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Oct 2019 10:46:00 +0200
Subject: [Buildroot] [PATCH 8/9] arc/riscv: get rid of immediate-assignment
In-Reply-To: <cover.1572079551.git.yann.morin.1998@free.fr>
References: <cover.1572079551.git.yann.morin.1998@free.fr>
Message-ID: <8c8a8e347af178efed41f86218b07936f12e42bf.1572079551.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/arch.mk.riscv | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..da2188706c 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -5,26 +5,26 @@
 
 ifeq ($(BR2_riscv),y)
 
-ifeq ($(BR2_RISCV_64),y)
-GCC_TARGET_ARCH := rv64i
-else
-GCC_TARGET_ARCH := rv32i
-endif
-
 ifeq ($(BR2_RISCV_ISA_RVM),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)m
+GCC_TARGET_ARCH_SUFFIX += m
 endif
 ifeq ($(BR2_RISCV_ISA_RVA),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)a
+GCC_TARGET_ARCH_SUFFIX += a
 endif
 ifeq ($(BR2_RISCV_ISA_RVF),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)f
+GCC_TARGET_ARCH_SUFFIX += f
 endif
 ifeq ($(BR2_RISCV_ISA_RVD),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)d
+GCC_TARGET_ARCH_SUFFIX += d
 endif
 ifeq ($(BR2_RISCV_ISA_RVC),y)
-GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
+GCC_TARGET_ARCH_SUFFIX += c
+endif
+
+ifeq ($(BR2_RISCV_64),y)
+GCC_TARGET_ARCH = rv64i$(subst $(space),,$(GCC_TARGET_ARCH_SUFFIX))
+else
+GCC_TARGET_ARCH = rv32i$(subst $(space),,$(GCC_TARGET_ARCH_SUFFIX))
 endif
 
 endif
-- 
2.20.1
