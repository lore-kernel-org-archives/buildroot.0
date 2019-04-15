From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 15 Apr 2019 17:14:27 -0400
Subject: [Buildroot] [PATCH 1/1] package/openjdk: remove mips support
Message-ID: <20190415211428.25961-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

The mips-port project has been abandoned for some time.
https://mail.openjdk.java.net/pipermail/mips-port/2018-August/000082.html

Fixes:
http://autobuild.buildroot.net/results/1059026c9b5f503684fe1589cd43d25a8484290b/build-end.log
Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openjdk/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 1363587ed5..de0efcc86b 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_m68k
-	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_sh
 	default y if BR2_sparc || BR2_sparc64
-- 
2.20.1
