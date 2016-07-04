From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:25:15 +0200
Subject: [Buildroot] [PATCH 64/83 v2] package/openocd: use 'menuconfig'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <c405d54173b2708cdd67d0063f5627be0976b28b.1467624132.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openocd has more than 5 options, so use a 'menuconfig' to group the
options in a sub-menu.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openocd/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index 2313671..66d3826 100644
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
2.7.4
