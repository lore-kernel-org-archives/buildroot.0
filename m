From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Fri, 14 Apr 2017 17:45:49 -0400
Subject: [Buildroot] [PATCH 0/2] Add support for rpi3 64bits target
Message-ID: <20170414214551.17986-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Those two patches bring the support for a 64bits image of the RaspberryPi 3.

The first patch makes the rpi-firmware package to be available for aarch64
targets (so it can be used by the second patch).

The second patch adds a minimal defconfig to build a 64bits rpi3 image.

	# uname -a
	Linux buildroot 4.9.13-v8 #1 SMP PREEMPT Fri Apr 14 17:33:30 EDT 2017 aarch64 GNU/Linux

Regards,
Ga?l PORTAY (2):
  rpi-firmware: allow to build for aarch64 targets
  configs: add raspberrypi3 64bits defconfig

 board/raspberrypi/genimage-raspberrypi3-64.cfg | 31 +++++++++++++++++++++
 board/raspberrypi/post-image.sh                | 23 ++++++++++++++++
 configs/raspberrypi3_64_defconfig              | 37 ++++++++++++++++++++++++++
 package/rpi-firmware/Config.in                 |  2 +-
 4 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 create mode 100644 configs/raspberrypi3_64_defconfig

-- 
2.12.1
