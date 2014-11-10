From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Nov 2014 20:50:23 +0100
Subject: [Buildroot] [PATCH 0/3] Update armadeus_apf9328_defconfig
Message-ID: <1415649026-30847-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a set of patches updating armadeus_apf9328_defconfig. What
prompted me to do this series is that this defconfig explicitly uses
gcc 4.4.x, but gcc 4.4.x has been marked as deprecated in
Buildroot. Therefore, this defconfig is now constantly failing to
build in our automated Jenkins setup.

In addition to using the default gcc version, two other patches remove
the usage of sstrip, and update the kernel to the latest stable
version.

Note that I don't have the APF9328 platform, so those changes were
only built tested. However, knowing that the platform uses an old
ARMv4 Freescale, I doubt it's still widely used.

Thomas

Thomas Petazzoni (3):
  configs/apf9328: don't use sstrip
  configs/apf9328: use default gcc version
  configs/apf9328: bump to a modern kernel

 ...1.1-0001-fixes_arm_mach-types_for_apf9328.patch | 26 ----------------------
 ...002-add_missing_config_option_for_apf9328.patch | 16 -------------
 configs/armadeus_apf9328_defconfig                 | 12 +++++-----
 3 files changed, 5 insertions(+), 49 deletions(-)
 delete mode 100644 board/armadeus/apf9328/linux-3.1.1-0001-fixes_arm_mach-types_for_apf9328.patch
 delete mode 100644 board/armadeus/apf9328/linux-3.1.1-0002-add_missing_config_option_for_apf9328.patch

-- 
2.0.0
