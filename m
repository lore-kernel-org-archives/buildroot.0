From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 19:40:45 +0100
Subject: [Buildroot] [PATCH-NEXT 0/4] package/linux-firmware: install into
 images for early loading support
Message-ID: <20210212184049.13202-1-peter@korsgaard.com>
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

Peter Korsgaard (4):
  package/linux-firmware: make target install macros accept a
    destination parameter
  package/linux-firmware.mk: get rid of temporary tarball for file
    installation
  package/linux-firmware: also install into images for early loading
    support
  linux: build after linux-firmware if enabled for early loading support

 linux/linux.mk                           |  3 ++-
 package/linux-firmware/linux-firmware.mk | 26 ++++++++++++++++--------
 2 files changed, 19 insertions(+), 10 deletions(-)

-- 
2.20.1
