From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Aug 2020 14:36:36 +0200
Subject: [Buildroot] [git commit] boot/at91bootstrap3: enable for cortexa7
Message-ID: <20200805123217.22C298153B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=33003a47c505ba38b58f7f58c34b7a7c50879b24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable this bootloader for cortex a7 based SoCs: support for the
sama7g5 SoC is now in upstream at91bootstrap3, and it is a Cortex-A7
based SoC.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index ccbb531833..5492ace8fb 100644
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
