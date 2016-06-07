From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 7 Jun 2016 04:45:22 +0200
Subject: [Buildroot] [PATCH] m68k: remove BR2_GCC_TARGET_ARCH
Message-ID: <20160607024522.GA31074@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Setting BR2_GCC_TARGET_ARCH is possible, but breaks
external toolchain users. m68k/cf defconfigs just
working without it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in.m68k | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index da06c3a..ced871f 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -35,7 +35,3 @@ endchoice
 config BR2_GCC_TARGET_CPU
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
-
-config BR2_GCC_TARGET_ARCH
-	default "m68k"		if BR2_m68k_m68k
-	default "cf"		if BR2_m68k_cf
-- 
2.1.4
