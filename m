From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 14:49:14 +0200
Subject: [Buildroot] [PATCH 22/24 v4] arch/x86: all x86 but i386 has atomics
	operations
In-Reply-To: <cover.1408279142.git.yann.morin.1998@free.fr>
References: <cover.1408279142.git.yann.morin.1998@free.fr>
Message-ID: <ed177394a493ac6cb531d6aa6586748497c3619e.1408279142.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.x86 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 327aff0..9aa4ea2 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -202,6 +202,9 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"
 
+config BR2_ARCH_HAS_ATOMICS
+	default y if !BR2_x86_i386
+
 config BR2_GCC_TARGET_TUNE
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
-- 
1.9.1
