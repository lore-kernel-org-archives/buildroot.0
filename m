From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 13:11:59 +0200
Subject: [Buildroot] [git commit] m68k: remove BR2_GCC_TARGET_ARCH
Message-ID: <20160607111203.9B78A80225@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eda11417beaf360d48ae5e1d294cf3298b28ef36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Setting BR2_GCC_TARGET_ARCH is possible, but breaks
external toolchain users. m68k/cf defconfigs just
working without it.

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
