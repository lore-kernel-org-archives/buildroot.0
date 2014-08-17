From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:11 +0200
Subject: [Buildroot] [PATCH 19/24 v4] arch/powerpc: always has atomic ops
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <e05c49aed6ef03e400fc2a4a1a238d1d6fa38291.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.powerpc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index e444cb8..239f5dc 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -157,6 +157,9 @@ config BR2_ENDIAN
 	default "BIG"    if BR2_powerpc || BR2_powerpc64
 	default "LITTLE" if BR2_powerpc64le
 
+config BR2_ARCH_HAS_ATOMICS
+	default y
+
 config BR2_GCC_TARGET_TUNE
 	default "401"		if BR2_powerpc_401
 	default "403"		if BR2_powerpc_403
-- 
1.9.1
