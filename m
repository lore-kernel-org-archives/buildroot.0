From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Nov 2018 15:30:10 +0200
Subject: [Buildroot] [PATCH next 5/5] board: macchiatobin: update readme.txt
In-Reply-To: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
References: <fb495883400fc9180b163358cf5c17d2f2c2e7d5.1542720610.git.baruch@tkos.co.il>
Message-ID: <1ce4f3c6c2f28b313d32deb1dc81f43277b8c6c6.1542720610.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the kernel and U-Boot versions to the actual versions in use.
Update the description of supported hardware features.

Add a note that the stale SPI flash environment issue only affects the
vendor BSP.

Cc: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 board/solidrun/macchiatobin/readme.txt | 30 +++++++++++++++-----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/board/solidrun/macchiatobin/readme.txt b/board/solidrun/macchiatobin/readme.txt
index dfbd6e793b06..dc5d6c794d45 100644
--- a/board/solidrun/macchiatobin/readme.txt
+++ b/board/solidrun/macchiatobin/readme.txt
@@ -15,19 +15,20 @@ How to build
 There are two build options: mainline support and vendor support.
 
 For the mainline BSP, we use:
- - Linux v4.15
- - U-Boot v2018.01
+ - Linux v4.19.2
+ - U-Boot v2018.11
 
 For the vendor BSP, we use the sources available from Marvell Github
 page at https://github.com/MarvellEmbeddedProcessors, which uses:
- - Linux v4.4.52
- - U-Boot v2017.03
+ - Linux v4.4.120
+ - U-Boot v2018.03
 
-At the moment mainline support for the board is a work in progress.
-Mainline kernel 4.15 enables eth2 in 1Gb (RJ45 connector J5) and
-eth0 in 10Gb (SFP connector CON15 and RJ45 connector CON16).
-The vendor BSP enables more hardware features out of the box,
-e.g. all the network interfaces.
+At the moment mainline support for the board is a work in
+progress. Mainline kernel 4.19 enables eth2 in 1Gb (RJ45 connector J5),
+copper 10Gb interfaces, and automatic configuration of select SFP
+modules on the SFP cages. The vendor BSP enables more hardware features
+out of the box, but lacks support for SFP detection and automatic
+configuration.
 
 To use the mainline BSP run the following commands:
 
@@ -73,10 +74,13 @@ Insert the micro SDcard in the MacchiatoBin board and power it up.
 The serial console is accessible at the micro-USB Type-B connector
 marked CON9. The serial line settings are 115200 8N1.
 
-By default U-Boot will load its environment from the SPI flash. On the
-first boot SPI flash may be empty or it may contain a legacy
-environment incompatible with up-to-date mainline U-Boot and
-kernel. Then the following commands can be used to boot the board:
+Note: the following text only applies to the vendor BSP from
+solidrun_macchiatobin_marvell_defconfig.
+
+By default Marvell provided U-Boot will load its environment from the
+SPI flash. On the first boot SPI flash may be empty or it may contain a
+legacy environment that prevents proper boot. Then the following
+commands can be used to boot the board:
 
 => ext4load mmc 1:1 0x01700000 /boot/uEnv-example.txt
 => env import -t 0x01700000 $filesize
-- 
2.19.1
