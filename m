From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 23 Sep 2020 14:11:03 -0500
Subject: [Buildroot] [PATCH 0/2] Support uboot file creation w/o uboot
Message-ID: <20200923191105.34415-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series migrates the support for building uboot env and
script files to be a feature of the uboot-tools package. This enables
a Buildroot defconfig that isn't modifying a system's firmware(uboot /
cpu configuration files / etc) to tailor the uboot environment and
startup behavior.

Matt Weber (2):
  package/uboot-tools: migrate BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
  package/uboot-tools: migrate BR2_TARGET_UBOOT_BOOT_SCRIPT from U-Boot
    pkg

 Config.in.legacy                   | 14 ++++++
 boot/uboot/Config.in               | 59 -------------------------
 boot/uboot/uboot.mk                | 38 ----------------
 package/uboot-tools/Config.in.host | 70 +++++++++++++++++++++++++++++-
 package/uboot-tools/uboot-tools.mk | 45 +++++++++++++++++++
 5 files changed, 127 insertions(+), 99 deletions(-)

-- 
2.17.1
