From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Mon, 7 Sep 2020 22:27:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/easyframes: fix missing dependency
Message-ID: <20200907202756.1516192-1-horatiu.vultur@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Easyframes uses fork when capturing frames in a pcap file, therefore add
the dependency BR2_USE_MMU.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 package/easyframes/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
index b2c45496b4..b2307fbf59 100644
--- a/package/easyframes/Config.in
+++ b/package/easyframes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EASYFRAMES
 	bool "easyframes"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  This is a small and simple command-line tool for network
@@ -8,3 +9,6 @@ config BR2_PACKAGE_EASYFRAMES
 	  received.
 
 	  https://github.com/microchip-ung/easyframes
+
+comment "easyframe needs a toolchain w/ MMU"
+	depends on !BR2_USE_MMU
-- 
2.27.0
