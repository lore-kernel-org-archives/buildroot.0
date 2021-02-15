From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Feb 2021 17:05:53 +0100
Subject: [Buildroot] [PATCH-NEXT v2 0/4] package/linux-firmware: install
 into images for early loading support
Message-ID: <20210215160558.19574-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some drivers request their firmware very early when built into the
kernel, even before the initramfs is mounted - So the only way to
provide firmware for those drivers is to include them directly in the
kernel with the CONFIG_EXTRA_FIRMWARE option.

To support this, let linux-firmware install its files into
BINARIES_DIR in addition to TARGET_DIR, similar to how we do it for
intel-microcode.

Peter Korsgaard (3):
  package/linux-firmware: make install logic macro accept a destination
    parameter
  package/linux-firmware: also install into images for early loading
    support
  linux: build after linux-firmware if enabled for early loading support

Yann E. MORIN (1):
  package/linux-firmware: rationalise install step

 linux/linux.mk                           |  3 ++-
 package/linux-firmware/linux-firmware.mk | 34 +++++++++---------------
 2 files changed, 15 insertions(+), 22 deletions(-)

-- 
2.20.1
