From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Aug 2015 08:38:54 +0300
Subject: [Buildroot] [PATCH] lightning: requires share library support
Message-ID: <844c4c9551f38dfbf091150262c1a04d3de2e953.1439271534.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Uses -ldl unconditionally.

Fixes:
http://autobuild.buildroot.net/results/55d/55d30db7212863d9f898bb929f0c75d529036bad/
http://autobuild.buildroot.net/results/6c3/6c37a1cd353b7cac854cc85d29a8232233414c68/
http://autobuild.buildroot.net/results/459/459ab12bc3eeb493f39efa2450bc829a351ee3a3/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lightning/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/lightning/Config.in b/package/lightning/Config.in
index 8caf39f4025b..6750114be2c4 100644
--- a/package/lightning/Config.in
+++ b/package/lightning/Config.in
@@ -1,7 +1,13 @@
+comment "lightning needs a toolchain w/ dynamic library"
+	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
+		BR2_mipsel || BR2_arm || BR2_powerpc
+	depends on BR2_STATIC_LIBS
+
 config BR2_PACKAGE_LIGHTNING
 	bool "lightning"
 	depends on BR2_sparc || BR2_i386 || BR2_x86_64 || BR2_mips || \
 		BR2_mipsel || BR2_arm || BR2_powerpc
+	depends on !BR2_STATIC_LIBS
 	help
 	  GNU lightning is a library that generates
 	  assembly language code at run-time.
-- 
2.5.0
