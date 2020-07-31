From: Eugen Hristev <eugen.hristev@microchip.com>
Date: Fri, 31 Jul 2020 12:02:31 +0300
Subject: [Buildroot] [PATCH] boot/at91bootstrap3: enable for cortexa7
Message-ID: <20200731090231.246132-1-eugen.hristev@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable this bootloader for cortex a7 based SoCs

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---

This is in preparation for our upcoming sama7g5 SoC featuring cortex A7.

 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index faab7635da..bd3873860b 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -1,6 +1,6 @@
 config BR2_TARGET_AT91BOOTSTRAP3
 	bool "AT91 Bootstrap 3"
-	depends on BR2_arm926t || BR2_cortex_a5
+	depends on BR2_arm926t || BR2_cortex_a5 || BR2_cortex_a7
 	help
 	  AT91Bootstrap is a first level bootloader for the Atmel AT91
 	  devices. It integrates algorithms for:
-- 
2.25.1
