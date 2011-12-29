From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 18:40:42 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2012.02/host-tools
Message-ID: <cover.1325178529.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the second posting of this patch set that allows some host
utilities to be visible in menuconfig, when those host utilities are
not simply build dependencies, but might also be directly interesting
for the user (image creation utilities, device programming utilities,
etc.).

A first posting was done on October, 1st 2011, and the general idea
and implementation received positive comments from Luca Ceresoli and
Thomas De Schampheleire.

Changes since v1:

 * Fix a commit log, as per the comment from Luca Ceresoli

 * Add the SAM-BA utility from Atmel as another host utility. This
   tool can be used from the development machine to reflash a virgin
   AT91-based device, through USB or serial.

Regards,

Thomas

The following changes since commit ef3fe1bef6581c66af3858d540343e011cb9fdd6:

  cdrkit: bump to version 1.1.11 and adjust style (2011-12-21 23:02:31 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/host-tools

Thomas Petazzoni (7):
      Add basic config infrastructure for host utilities
      uboot-tools: expose host package in menuconfig
      libftdi: add host variant
      libusb-compat: add host variant
      libusb: add host variant
      openocd: add host variant
      sam-ba: new package with host variant only

 Config.in                              |    2 ++
 package/Config.in.host                 |    7 +++++++
 package/libftdi/libftdi.mk             |    3 +++
 package/libusb-compat/libusb-compat.mk |    4 ++++
 package/libusb/libusb.mk               |    3 +++
 package/openocd/Config.in.host         |    6 ++++++
 package/openocd/openocd.mk             |   10 ++++++++++
 package/sam-ba/Config.in.host          |    6 ++++++
 package/sam-ba/sam-ba.mk               |   23 +++++++++++++++++++++++
 package/uboot-tools/Config.in.host     |    6 ++++++
 10 files changed, 70 insertions(+), 0 deletions(-)
 create mode 100644 package/Config.in.host
 create mode 100644 package/openocd/Config.in.host
 create mode 100644 package/sam-ba/Config.in.host
 create mode 100644 package/sam-ba/sam-ba.mk
 create mode 100644 package/uboot-tools/Config.in.host

Thanks,
-- 
Thomas Petazzoni
