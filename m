From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:49:34 +0200
Subject: [Buildroot] [git commit] package/easyframes: add missing dependency
 on MMU support
Message-ID: <20200907204122.B1E8486CC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20e000161eb53647cd18ed39a2cf561120a79490
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Easyframes uses fork when capturing frames in a pcap file, therefore
add the dependency BR2_USE_MMU.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/easyframes/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/easyframes/Config.in b/package/easyframes/Config.in
index b2c45496b4..b73afe0587 100644
--- a/package/easyframes/Config.in
+++ b/package/easyframes/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_EASYFRAMES
 	bool "easyframes"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBPCAP
 	help
 	  This is a small and simple command-line tool for network
