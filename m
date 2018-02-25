From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:22:14 +0100
Subject: [Buildroot] [git commit] package/zlib: zlib-ng only available on
 some archs
Message-ID: <20180225222242.15EB98822B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b170210c9bfa70c6c1eae9cc2bc65b03ec9dd6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream has code only for those architectures, with no fallback
generic code, so we must restrict zlib-ng to only those four archs...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Stefan Fr??berg <stefan.froberg@petroprogram.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Thomas: fix typoes in the Config.in option name.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 87abc2bdd5..0f6179f537 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -1,3 +1,10 @@
+config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
+	bool
+	default y if BR2_arm
+	default y if BR2_aarch64
+	default y if BR2_i386
+	default y if BR2_x86_64
+
 config BR2_PACKAGE_ZLIB
 	bool "zlib support"
 	help
@@ -22,6 +29,7 @@ config BR2_PACKAGE_LIBZLIB
 
 config BR2_PACKAGE_ZLIB_NG
 	bool "zlib-ng"
+	depends on BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	select BR2_PACKAGE_HAS_ZLIB
 	help
 	  Zlib replacement with optimizations for
