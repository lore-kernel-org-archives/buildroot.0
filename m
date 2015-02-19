From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit] toolchain: Enable the internal toolchain
	for nios2
Message-ID: <20150302222719.D00DB807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee2ccf0d64ba2cf459ed4464826585b5dbdf0c24
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For now we can only support glibc.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/Config.in                     |    1 -
 toolchain/toolchain-buildroot/Config.in |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

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
