From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 15:44:52 +0100
Subject: [Buildroot] [git commit master] toolchain/gcc: simplify
	BR2_GCC_SUPPORTS_* logic
Message-ID: <20091029152013.76B66763A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1eb391c50011abbbf0a3b04ca1cd0db739bc2020
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index dbc5645..ba068c3 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -72,12 +72,10 @@ config BR2_GCC_IS_SNAP
 
 config BR2_GCC_SUPPORTS_SYSROOT
 	bool
-	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2
 	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2
 
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
-	default n if BR2_GCC_VERSION_3_4_6 || BR2_GCC_VERSION_4_0_4 || BR2_GCC_VERSION_4_1_2 || BR2_GCC_VERSION_4_2_1 || BR2_GCC_VERSION_4_2_2 || BR2_GCC_VERSION_4_2_3 || BR2_GCC_VERSION_4_2_4
 	default y if !BR2_GCC_VERSION_3_4_6 && !BR2_GCC_VERSION_4_0_4 && !BR2_GCC_VERSION_4_1_2 && !BR2_GCC_VERSION_4_2_1 && !BR2_GCC_VERSION_4_2_2 && !BR2_GCC_VERSION_4_2_3 && !BR2_GCC_VERSION_4_2_4
 
 config BR2_GCC_SNAP_DATE
-- 
1.6.3.3
