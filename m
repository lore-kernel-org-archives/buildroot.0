From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Aug 2014 21:30:03 +0200
Subject: [Buildroot] [PATCH 24/24 v5] arch: remove no-longer default on
	atomics option
In-Reply-To: <cover.1408303753.git.yann.morin.1998@free.fr>
References: <cover.1408303753.git.yann.morin.1998@free.fr>
Message-ID: <a2b1d4aad5e0611dce67c2bfed7cb724d0b6843a.1408303753.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all architectures explicitly select this option when it makes
sense, there is no need to have a default value.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Anton Kolesov <Anton.Kolesov@synopsys.com>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 6bcafd4..1126d43 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -253,7 +253,6 @@ config BR2_GCC_TARGET_MODE
 # If the architecture has atomic operations, select this:
 config BR2_ARCH_HAS_ATOMICS
 	bool
-	default y if !BR2_arc
 
 # Set up target binary format
 choice
-- 
1.9.1
