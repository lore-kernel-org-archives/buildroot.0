From: Biagio Montaruli <biagio.hkr@gmail.com>
Date: Wed, 10 Aug 2016 13:05:56 +0200
Subject: [Buildroot] [PATCH 00/11] Series of patch to improve Buildroot
	configuration for
In-Reply-To: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
References: <1470827167-9426-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <1470827167-9426-2-git-send-email-biagio.hkr@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

*** BLURB HERE ***

Biagio Montaruli (11):
  Update genimage configuration file for Arietta-G25 in order to build  
      a bootable SD card image named "sdcard.img"
  Add Linux Kernel stable 4.4.16 patch file for Arietta G25
  Add post-build.sh script for Arietta G25
  Add root filesystem overlay files and directories for Arietta G25
  Update and improve default configuration files for Arietta G25    
    (both 128MB and 256MB version)
  Update README file for Arietta G25 named "readme.txt"
  Add Linux Kernel stable v4.4.16 patch file for Aria G25
  Add post-build.sh script for Aria G25
  Update genimage configuration file and add post-image.sh script for   
     Aria G25 in order to build a bootable SD card image named
    "sdcard.img"
  Update and improve default configuration files for Arietta G25    
    (both 128MB and 256MB version)
  Update README file for Aria G25 named "readme.txt"

 board/acmesystems/aria-g25/genimage.cfg            |  29 ++
 .../aria-g25/patches/linux/linux-4.4.16-aria.patch | 388 +++++++++++++++++++
 board/acmesystems/aria-g25/post-build.sh           |  14 +
 board/acmesystems/aria-g25/post-image.sh           |  16 +
 board/acmesystems/aria-g25/readme.txt              |  71 ++--
 board/acmesystems/arietta-g25/genimage.cfg         |  14 +-
 .../patches/linux/linux-4.4.16-arietta.patch       | 409 +++++++++++++++++++++
 board/acmesystems/arietta-g25/post-build.sh        |  14 +
 board/acmesystems/arietta-g25/readme.txt           |  32 +-
 .../rootfs-overlay/etc/network/interfaces          |  10 +
 configs/acmesystems_aria_g25_128mb_defconfig       |  41 ++-
 configs/acmesystems_aria_g25_256mb_defconfig       |  41 ++-
 configs/acmesystems_arietta_g25_128mb_defconfig    |  43 ++-
 configs/acmesystems_arietta_g25_256mb_defconfig    |  43 ++-
 14 files changed, 1065 insertions(+), 100 deletions(-)
 create mode 100644 board/acmesystems/aria-g25/genimage.cfg
 create mode 100644 board/acmesystems/aria-g25/patches/linux/linux-4.4.16-aria.patch
 create mode 100755 board/acmesystems/aria-g25/post-build.sh
 create mode 100755 board/acmesystems/aria-g25/post-image.sh
 create mode 100644 board/acmesystems/arietta-g25/patches/linux/linux-4.4.16-arietta.patch
 create mode 100755 board/acmesystems/arietta-g25/post-build.sh
 create mode 100644 board/acmesystems/arietta-g25/rootfs-overlay/etc/network/interfaces

-- 
2.7.4
