From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 20:18:29 +0200
Subject: [Buildroot] [git commit] package/gcc: properly order properties of
 BR2_GCC_SUPPORTS_DLANG
Message-ID: <20191025181206.ADA9B88102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53796ade0fb2a8fc2b77dd0f48f1b4167a96e242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/gcc/Config.in.host:84: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index aeea21c0fb..5c1bee076d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -79,8 +79,6 @@ config BR2_GCC_SUPPORTS_LIBCILKRTS
 
 config BR2_GCC_SUPPORTS_DLANG
 	bool
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	default y if BR2_aarch64
 	default y if BR2_arm
 	default y if BR2_i386
@@ -89,6 +87,8 @@ config BR2_GCC_SUPPORTS_DLANG
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_x86_64
 	default y if BR2_riscv && !BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_GCC_VERSION
 	string
