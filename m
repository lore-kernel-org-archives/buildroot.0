From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 31 Mar 2017 22:39:11 +0200
Subject: [Buildroot] [PATCH] package/xenomai: remove sh4 support
Message-ID: <20170331203911.21186-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sh4 target support has been removed since Xenomai 3.x.

Fixes:
http://autobuild.buildroot.net/results/a81/a8125847367de5fd27156e5cba9ec7315c2ccd5d/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 32c5124..b548ee8 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_XENOMAI_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_i386 || BR2_x86_64 || (BR2_arm && !BR2_ARM_CPU_ARMV7M) || \
-		BR2_bfin || BR2_powerpc || BR2_sh4
+		BR2_bfin || BR2_powerpc
 
 comment "xenomai needs an glibc or uClibc toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
-- 
2.9.3
