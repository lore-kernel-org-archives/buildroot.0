From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:21 +0100
Subject: [Buildroot] [PATCH 52/84 RFC] package/openocd: use 'menuconfig'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <a40870aaa7c0925a8317b9943f213ab8cc77b3b0.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openocd has more than 5 options, so use a 'menuconfig' to group the
options in an sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/openocd/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index d84aac1..212ce67 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_OPENOCD
+menuconfig BR2_PACKAGE_OPENOCD
 	bool "openocd"
 	help
 	  OpenOCD - Open On-Chip Debugger
@@ -7,8 +7,6 @@ config BR2_PACKAGE_OPENOCD
 
 if BR2_PACKAGE_OPENOCD
 
-comment "Adapters"
-
 config BR2_PACKAGE_OPENOCD_FTDI
 	bool "MPSSE mode of FTDI based devices"
 	select BR2_PACKAGE_LIBUSB
-- 
1.9.1
