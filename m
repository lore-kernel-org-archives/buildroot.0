From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 19 Sep 2017 13:03:50 +0200
Subject: [Buildroot] [PATCH 0/4] Add custom linux logo
Message-ID: <1505819034-29610-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to various requests I had, I decided to revamp this patch
I sent a while ago.

The rationale behind is:
* Having a simple way to overwrite the linux logo
* Keeping it simple supporting only modern hardware (no b/w or 16 colours)
* The host package for imagemagick was purposely kept simple to compile
  fast and give only the support needed to convert thw most widespread
  imagefile formats to kernel ppm.

The series adds also a default bootup logo to watermark our defconfigs.

I modified only a defconfig as a sample and included in the series.


Angelo Compagnucci (4):
  package/imagemagick: add host package
  linux: add custom linux logo
  docs/images: adding default buildroot linux logo
  configs: add linux boot logo to raspberrypi3 defconfig

 configs/raspberrypi3_defconfig             |  2 +
 docs/website/images/logo_linux_clut224.ppm | 84 ++++++++++++++++++++++++++++++
 linux/Config.in                            | 27 ++++++++++
 linux/linux.mk                             | 19 +++++++
 package/imagemagick/imagemagick.mk         | 11 ++++
 5 files changed, 143 insertions(+)
 create mode 100644 docs/website/images/logo_linux_clut224.ppm

-- 
2.7.4
