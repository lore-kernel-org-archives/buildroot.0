From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2012 18:42:48 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2012.02/host-tools
Message-ID: <cover.1327772556.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the third posting of this patch set that allows some host
utilities to be visible in menuconfig, when those host utilities are
not simply build dependencies, but might also be directly interesting
for the user (image creation utilities, device programming utilities,
etc.).

Changes since v2 (posted on December, 28th 2011) :

 * Ensured that the entries are sorted alphabetically

 * Added Acked-by received by Buildroot contributors

 * Rebased on current master

Changes since v1 (posted on October, 1st 2011) :

 * Fix a commit log, as per the comment from Luca Ceresoli

 * Add the SAM-BA utility from Atmel as another host utility. This
   tool can be used from the development machine to reflash a virgin
   AT91-based device, through USB or serial.

Regards,

Thomas

The following changes since commit 5796753b6b4caba703cf23f45f68b7715d1150a4:

  mplayer: add optional vorbis dependency (2012-01-27 11:18:52 +0100)

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
