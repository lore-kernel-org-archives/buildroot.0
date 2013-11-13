From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 13 Nov 2013 15:28:48 -0600
Subject: [Buildroot] [PATCH v3 5/7] toolchain: enable microblaze toolchain
In-Reply-To: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
References: <1384378130-8599-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1384378130-8599-6-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 toolchain/Config.in                     |    2 +-
 toolchain/toolchain-buildroot/Config.in |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3980d79..bbfd367 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -35,7 +35,7 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_microblaze && !BR2_aarch64 && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_nios2
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 
 config BR2_TOOLCHAIN_EXTERNAL
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8b37127..1529004 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -21,7 +21,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64
+		   BR2_x86_64 || BR2_microblaze
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
@@ -42,7 +42,7 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64
+		   BR2_x86_64 || BR2_microblaze
 	select BR2_TOOLCHAIN_USES_GLIBC
 	depends on !BR2_PREFER_STATIC_LIB
 	# our glibc.mk enables RPC support
-- 
1.7.1
