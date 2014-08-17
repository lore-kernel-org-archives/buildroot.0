From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:54 +0200
Subject: [Buildroot] [PATCH 15/24 v5] arch/m68k: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <093e6bbf55deed236bf99eab845fb1699f2b00ec.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.m68k | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index ba6cedf..6b79307 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -4,6 +4,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "BIG"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "68000"		if BR2_m68k_68000
 	default "68010"		if BR2_m68k_68010
-- 
1.9.1
