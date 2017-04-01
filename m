From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 13:57:54 +0200
Subject: [Buildroot] [git commit] package/xenomai: remove sh4 support
Message-ID: <20170401115809.296EE8211F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a001d00dc352d6f0759f2850c8b1079cabe24838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sh4 target support has been removed since Xenomai 3.x.

Fixes:
http://autobuild.buildroot.net/results/a81/a8125847367de5fd27156e5cba9ec7315c2ccd5d/build-end.log

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
