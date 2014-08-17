From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:29:59 +0200
Subject: [Buildroot] [PATCH 20/24 v5] arch/sh: always has atomic ops
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <f3375f9950d4e4eca2af52fb752fcf34ab4b3e1b.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 1bdea37..9f8f79c 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -28,3 +28,6 @@ config BR2_ARCH
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a || BR2_sh64
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
+
+config BR2_ARCH_HAS_ATOMICS
+	default y
-- 
1.9.1
