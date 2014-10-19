From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 22:07:46 +0200
Subject: [Buildroot] [PATCH 12/31] nodejs: use BR2_ARM_CPU_ARM* options
In-Reply-To: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413749285-1108-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1413749285-1108-13-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjust the nodejs Config.in dependencies to use the per ARM
architecture BR2_ARM_CPU_ARM* options instead of the per ARM core
options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nodejs/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 077a043..cb8fb47 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV4T
 	# uses fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_ZLIB
@@ -19,7 +19,7 @@ config BR2_PACKAGE_NODEJS
 comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV4T
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
-- 
2.0.0
