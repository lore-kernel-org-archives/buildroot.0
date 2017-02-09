From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Thu,  9 Feb 2017 18:47:56 +0100
Subject: [Buildroot] [PATCH 3/6] arch/arm: mark ARMv{4,
	5} as affected by GCC PR libstdc++/64735
In-Reply-To: <20170209174759.15819-1-joerg.krause@embedded.rocks>
References: <20170209174759.15819-1-joerg.krause@embedded.rocks>
Message-ID: <20170209174759.15819-4-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARMv4 and ARMv5 does not support always lock-free atomic ints.
Therefore, exception_ptr, nested_exception, and future from libstdc++
are not available before GCC 7.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 arch/Config.in.arm | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 2617976f1..0cf1ef5cd 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -46,9 +46,11 @@ config BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_CPU_ARMV4
 	bool
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_ARM_CPU_ARMV5
 	bool
+	select BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
 config BR2_ARM_CPU_ARMV6
 	bool
-- 
2.11.1
