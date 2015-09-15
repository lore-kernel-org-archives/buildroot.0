From: jpinto <Joao.Pinto@synopsys.com>
Date: Tue, 15 Sep 2015 14:21:14 +0100
Subject: [Buildroot] [PATCH] Enable mplayer to be built in arm64
	architectures
Message-ID: <6130a3068f57c9a23499f06ba5ab168c1fd4b38b.1442322610.git.jpinto@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables the mplayer application to be built for a arm64 based
system. It was tested in a ARM Juno r1 (ARMv8 development board).

Signed-off-by: jpinto <jpinto@synopsys.com>
Tested-by: jpinto <jpinto@synopsys.com>
---
 package/mplayer/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index 79ff3b1..7a8b03f 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_MPLAYER_ARCH_SUPPORTS
 	default y
 	# Those architectures are not supported by MPlayer
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
-		|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
+		|| BR2_microblaze || BR2_nios2)
 	# Broken support for <ARMv5
 	depends on !BR2_ARM_CPU_ARMV4
 
-- 
1.8.1.5
