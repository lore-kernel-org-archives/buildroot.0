From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 27 Sep 2010 10:53:36 +0200
Subject: [Buildroot] [PATCH 1/4] Added new menu item to specify a custom
	port for /etc/inittab
In-Reply-To: <4C9C54A9.20803@visionsystems.de>
References: <4C9C54A9.20803@visionsystems.de>
Message-ID: <4CA05B90.30704@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

---
 target/generic/Config.in |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/target/generic/Config.in b/target/generic/Config.in
index 54ff1d6..286b0a3 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -102,8 +102,16 @@ config BR2_TARGET_GENERIC_GETTY_TTYCPM2
 config BR2_TARGET_GENERIC_GETTY_TTYCPM3
 	bool "ttyCPM3"
 	depends on BR2_powerpc
+config BR2_TARGET_GENERIC_GETTY_CUSTOM
+	bool "Select custom port"
+
 endchoice
 
+config BR2_TARGET_GENERIC_GETTY_CUSTOM_PORT
+	string "Port"
+	depends on BR2_TARGET_GENERIC_GETTY_CUSTOM
+	default ""
+
 config BR2_TARGET_GENERIC_GETTY_PORT
 	string
 	default "#ttyS0"	if BR2_TARGET_GENERIC_GETTY_NONE
@@ -134,6 +142,7 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttyCPM1"	if BR2_TARGET_GENERIC_GETTY_TTYCPM1
 	default "ttyCPM2"	if BR2_TARGET_GENERIC_GETTY_TTYCPM2
 	default "ttyCPM3"	if BR2_TARGET_GENERIC_GETTY_TTYCPM3
+	default $(BR2_TARGET_GENERIC_GETTY_CUSTOM_PORT) if BR2_TARGET_GENERIC_GETTY_CUSTOM
 
 choice
 	prompt "Baudrate to use"
