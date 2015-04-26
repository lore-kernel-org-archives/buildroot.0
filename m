From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/xserver_xorg-server: add blind
	options to specify driver ABI
Message-ID: <20150426202424.E6D13818B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f353fbd2bf97bd970ea35ae90ff52e1442543f08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upcoming NVidia Tegra2/3 binary blobs only work with a certain
VIDEODRV ABI (namely up to 14), so we must have a way to represent that
ABI so that such packages can not be enabled with a too recent/old ABI.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 48ccf51..c578528 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -56,11 +56,19 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	bool
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
+	int
+	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+
 choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	bool "1.17.1"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 
 endchoice
 
