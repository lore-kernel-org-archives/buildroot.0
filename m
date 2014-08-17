From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:04 +0200
Subject: [Buildroot] [PATCH 12/24 v4] arch/arm: always has atomic ops
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <2503d78b90256ff7c74113d81e2119378f8d6fad.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

armv6 and above all have one sort of atomic ops or another. For armv5
and below, they are emulated, either as a kernel trap, a kernel VDSO,
or compiler intrinsics.

Aarch64 is just armv8, so make it a single commit. ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.aarch64 | 3 +++
 arch/Config.in.arm     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
index 4c68a37..2e79870 100644
--- a/arch/Config.in.aarch64
+++ b/arch/Config.in.aarch64
@@ -3,3 +3,6 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	default "LITTLE"
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4cc41f1..e404a50 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -340,6 +340,9 @@ config BR2_ENDIAN
 	default "LITTLE" if BR2_arm
 	default "BIG"	 if BR2_armeb
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_CPU
 	default "arm920"	if BR2_arm920
 	default "arm920t"	if BR2_arm920t
-- 
1.9.1
