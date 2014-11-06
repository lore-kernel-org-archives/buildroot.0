From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Nov 2014 23:45:31 +0100
Subject: [Buildroot] [git commit] nodejs: use BR2_ARM_CPU_ARM* options
Message-ID: <20141106233446.78DB5B12A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c760a7f6af77d8b52ff2b1397936ecef12114a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust the nodejs Config.in dependencies to use the per ARM
architecture BR2_ARM_CPU_ARM* options instead of the per ARM core
options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 077a043..47e80ec 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4
 	# uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_ZLIB
@@ -19,7 +19,7 @@ config BR2_PACKAGE_NODEJS
 comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
