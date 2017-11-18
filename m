From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 18 Nov 2017 21:03:04 +0100
Subject: [Buildroot] [git commit] board: bananapi-m1: Fix to use dtb instead
 of dts
Message-ID: <20171118195557.1845180AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4245aef53020ae48c6b2bdeb239b144ce8316f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

boot.cmd using dts file instead of dtb which was
added in below commit, so fix the same.

"board: Add Bananapi M1 support"
(sha1: 5f50fb8d1df51b622537da015f8c3b7b6dcbbc35)

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/bananapi/bananapi-m1/boot.cmd | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/bananapi/bananapi-m1/boot.cmd b/board/bananapi/bananapi-m1/boot.cmd
index fb7de1d..0cf6f4d 100644
--- a/board/bananapi/bananapi-m1/boot.cmd
+++ b/board/bananapi/bananapi-m1/boot.cmd
@@ -2,6 +2,6 @@ setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
 
 mmc dev 0
 fatload mmc 0 $kernel_addr_r zImage
-fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi.dts
+fatload mmc 0 $fdt_addr_r sun7i-a20-bananapi.dtb
 
 bootz $kernel_addr_r - $fdt_addr_r
