From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:09 +0200
Subject: [Buildroot] [PATCH 17/24 v4] arch/mips: always has atomic ops
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <a364b4f78cc3262290c5452fb5466d7e5d4c317d.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.mips | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 20951e0..18138de 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -73,6 +73,9 @@ config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG" 	    	if BR2_mips || BR2_mips64
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_ARCH
 	default "mips1"		if BR2_mips_1
 	default "mips2"		if BR2_mips_2
-- 
1.9.1
