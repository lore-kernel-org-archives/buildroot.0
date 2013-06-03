From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jun 2013 22:15:46 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-updates
Message-ID: <cover.1370289131.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a few version bumps related to the Raspberry Pi:
  - rpi_defconfig: bump kernel (many fixes, improvements)
  - linux-firmware: bump (new firmware files for WiFi dongles)
  - rpi-firmware: bump (new codecs, mostly)
  - rpi-firmware: select firmware(s) to install

Also, promote genext2fs as a host-package, too, like we have
for other filesystem generators.


Notes only slightly related to this series:

For the Linux kernel for the RPi, there are a few branches available in
the raspbberypi repository:
  - rpi-3.6.y: that branch seems stable, and I just bump to the latest
               cset in that branch
  - rpi-3.8.y: I've expereienced many MMC errors using that branch
  - rpi-3.9.y: ditto, many MMC errors

However, with a RAM-based rootfs (eg. initramfs) or a network rootfs
(eg. NFS), it might be possible to reliably use those two last branches,
as long as the SDcard is not used.

Booting one of those two branches with the rpi-firmware currently packaged
in Buildroot fails, so it seems we first need to update rpi-firmware before
switching to rpi-3.{8,9}.y.

I'll report back on any improvement in this area.

Regards,
Yann E. MORIN


The following changes since commit 7672b1235d8f786938af66068c1c1da8a766bb38:

  gnutls: wchar only needed for tools (2013-06-03 17:27:00 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to a72081fb5d6b38ae6a661e2777003e4dd109e18c:

  package/rpi-firmware: update (2013-06-03 20:01:21 +0200)

----------------------------------------------------------------
Yann E. MORIN (6):
      package/tvheadend: update to a git snapshot
      package/linux-firmware: bump version for new firmware
      package/genext2fs: add host variant
      boards/rpi: bump kernel
      package/rpi-firmware: add options to select what firmware to install
      package/rpi-firmware: update

 board/raspberrypi/readme.txt                       | 12 ++---
 configs/rpi_defconfig                              |  2 +-
 fs/ext2/Config.in                                  |  1 +
 package/Config.in.host                             |  1 +
 package/genext2fs/Config.in.host                   |  9 ++++
 package/linux-firmware/Config.in                   | 12 ++---
 package/linux-firmware/linux-firmware.mk           | 15 +++---
 package/rpi-firmware/Config.in                     | 55 ++++++++++++++++++++++
 package/rpi-firmware/cmdline.txt                   |  1 +
 package/rpi-firmware/config.txt                    |  1 -
 package/rpi-firmware/rpi-firmware.mk               | 25 ++++++++--
 .../tvheadend-001-no-auto-download-dvbscans.patch  | 13 +++--
 .../tvheadend/tvheadend-002-no-check_config.patch  |  4 +-
 package/tvheadend/tvheadend.mk                     |  4 +-
 14 files changed, 117 insertions(+), 38 deletions(-)
 create mode 100644 package/genext2fs/Config.in.host
 create mode 100644 package/rpi-firmware/cmdline.txt
-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
