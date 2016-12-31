From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 31 Dec 2016 17:30:37 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: AIGLX
	Extension removed in 1.19.0
Message-ID: <20161231163037.13818-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://cgit.freedesktop.org/xorg/xserver/commit/?id=501d8e2beb337e072c93c9310fcd927a099b9c3b

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index b7f2b3e..1ee1f0b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -132,6 +132,8 @@ endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
 	bool "Enable AIGLX Extension"
+	# AIGLX Extension removed in 1.19.0
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 || BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	help
 	  Enable/Use AIGLX extension.
 
-- 
2.9.3
