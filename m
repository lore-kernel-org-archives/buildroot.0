From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain targets: fix up c3
	and winchip i386 variants, add c3-2
Message-ID: <20101129201622.1ADA18CA48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=273c2accca3bbe9ce0314a981f3e3cd0bb0e1a4c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/Config.in.arch |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 6236439..0774d55 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -263,11 +263,13 @@ config BR2_x86_barcelona
 config BR2_x86_geode
 	bool "geode"
 config BR2_x86_c3
-	bool "cyrix 3 (MMX + 3dNOW!)"
+	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
+config BR2_x86_c32
+	bool "Via C3-2 (Nehemiah cores)"
 config BR2_x86_winchip_c6
-	bool "IDT winchip C6 (i486 + slow MMX)"
+	bool "IDT Winchip C6"
 config BR2_x86_winchip2
-	bool "IDT winchip2 (i486 +MMX +SSE)"
+	bool "IDT Winchip 2"
 endchoice
 
 choice
@@ -447,6 +449,10 @@ config BR2_ARCH
 	default "i586"		if BR2_x86_i586
 	default "i586"		if BR2_x86_pentium_mmx
 	default "i586"		if BR2_x86_geode
+	default "i586"		if BR2_x86_c3
+	default "i686"		if BR2_x86_c32
+	default "i586"		if BR2_x86_winchip_c6
+	default "i586"		if BR2_x86_winchip2
 	default "i686"		if BR2_x86_i686
 	default "i686"		if BR2_x86_pentium2
 	default "i686"		if BR2_x86_pentium3
@@ -510,6 +516,7 @@ config BR2_GCC_TARGET_TUNE
 	default winchip-c6	if BR2_x86_winchip_c6
 	default winchip2	if BR2_x86_winchip2
 	default c3		if BR2_x86_c3
+	default c3-2		if BR2_x86_c32
 	default geode		if BR2_x86_geode
 	default generic		if BR2_x86_64_generic
 	default nocona		if BR2_x86_64_nocona
@@ -623,6 +630,7 @@ config BR2_GCC_TARGET_ARCH
 	default winchip-c6	if BR2_x86_winchip_c6
 	default winchip2	if BR2_x86_winchip2
 	default c3		if BR2_x86_c3
+	default c3-2		if BR2_x86_c32
 	default geode		if BR2_x86_geode
 	default armv4t		if BR2_arm7tdmi
 	default armv3		if BR2_arm610
-- 
1.7.2.2
