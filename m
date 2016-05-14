From: Troy Dack <troy@dack.com.au>
Date: Sun, 15 May 2016 09:33:07 +1000
Subject: [Buildroot] [PATCH 0/3] OrangePi Plus: Add support
Message-ID: <1463268790-1076-1-git-send-email-troy@dack.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add support for the OrangePi Plus board.

Generates a self-extracting fel-boot.bsx file that can boot an OrangePi Plus
connected via USB-OTG. Root filesystem is loaded via initrd.

Also generates a bootable SD card image.

Signed-off-by: Troy Dack <troy@dack.com.au>

---
Troy Dack (3):
  OrangePi Plus rootfs-overlay files
  OrangePi Plus files required to generate SD card image and a self    
    extracting fel-boot command for booting from RAM using USB-OTG and  
      sunxi-fel
  Default config for OrangePi Plus.     Generates kernel using
    sunxi/for-next branch of git.kernel.org/git/mripard     U-boot built
    from git tag v2016.05-rc3

 board/orangepi/orangepi_plus/boot-fel.cmd          |  4 ++
 board/orangepi/orangepi_plus/boot-sdcard.cmd       |  8 +++
 board/orangepi/orangepi_plus/boot.cmd              |  4 ++
 board/orangepi/orangepi_plus/decompress            | 21 +++++++
 board/orangepi/orangepi_plus/genimage.cfg          | 35 ++++++++++++
 board/orangepi/orangepi_plus/payload.sh            | 21 +++++++
 board/orangepi/orangepi_plus/post-build.sh         | 15 +++++
 board/orangepi/orangepi_plus/post-image.sh         | 54 ++++++++++++++++++
 board/orangepi/orangepi_plus/readme.txt            | 35 ++++++++++++
 .../orangepi_plus/rootfs-overlay/etc/profile       | 21 +++++++
 configs/orangepi_plus_defconfig                    | 64 ++++++++++++++++++++++
 11 files changed, 282 insertions(+)
 create mode 100644 board/orangepi/orangepi_plus/boot-fel.cmd
 create mode 100644 board/orangepi/orangepi_plus/boot-sdcard.cmd
 create mode 100644 board/orangepi/orangepi_plus/boot.cmd
 create mode 100644 board/orangepi/orangepi_plus/decompress
 create mode 100644 board/orangepi/orangepi_plus/genimage.cfg
 create mode 100644 board/orangepi/orangepi_plus/payload.sh
 create mode 100755 board/orangepi/orangepi_plus/post-build.sh
 create mode 100755 board/orangepi/orangepi_plus/post-image.sh
 create mode 100644 board/orangepi/orangepi_plus/readme.txt
 create mode 100644 board/orangepi/orangepi_plus/rootfs-overlay/etc/profile
 create mode 100644 configs/orangepi_plus_defconfig

-- 
2.7.4
