From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Feb 2015 13:26:58 -0300
Subject: [Buildroot] [PATCH 6/6] toolchain: Enable the internal toolchain
	for nios2
In-Reply-To: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1424190418-883-7-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For now we can only support glibc.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 toolchain/Config.in                     | 1 -
 toolchain/toolchain-buildroot/Config.in | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 54b5d17..b039ee2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -43,7 +43,6 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index a69013f..1b9f3a3 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -64,7 +64,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_mips64      || BR2_mips64el || BR2_powerpc || \
 		   BR2_powerpc64   || BR2_powerpc64le || BR2_sh   || \
 		   BR2_sh64        || BR2_sparc    || BR2_x86_64  || \
-		   BR2_microblaze
+		   BR2_microblaze  || BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
-- 
2.3.0
