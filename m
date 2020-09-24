From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 24 Sep 2020 14:29:09 -0500
Subject: [Buildroot] [PATCH v2 0/3] Support uboot file creation w/o uboot
Message-ID: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
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

v2 - Fixes up legecy config handling and covers a case where the
     generation of autobuilder configs would fail as uboot-tools is
     tested vs target uboot is not.

Matt Weber (3):
  package/uboot-tools: migrate BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
  package/uboot-tools: migrate BR2_TARGET_UBOOT_BOOT_SCRIPT from U-Boot
    pkg
  genrandconfig: uboot-tools env/scr creation test files

 Config.in.legacy                   | 63 ++++++++++++++++++++++++++
 boot/uboot/Config.in               | 59 ------------------------
 boot/uboot/uboot.mk                | 38 ----------------
 package/uboot-tools/Config.in.host | 73 +++++++++++++++++++++++++++++-
 package/uboot-tools/uboot-tools.mk | 48 ++++++++++++++++++++
 utils/genrandconfig                | 16 +++++++
 6 files changed, 198 insertions(+), 99 deletions(-)

-- 
2.17.1
