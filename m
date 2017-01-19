From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Thu, 19 Jan 2017 10:32:09 -0500
Subject: [Buildroot] [PATCH 0/4] Altera SoCkit board support fixes
Message-ID: <1484839933-17637-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The Altera SoCkit config was broken due to an update of the GCC
version used in buildroot and the kernel being too old to build with
GCC 5+.
See: https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/185616884

This patch series should fix the issue by bumping both the kernel version
and the bootloader.

Since it was lacking, the patch also adds a Genimage configuration
for the system.

Lucas Bajolet (4):
  configs/altera_sockit: bump kernel to 4.7 and u-boot to v2016.11-rc3
  board/altera: changed path contents to support sockit from official
    config
  board/altera: update patch to support new official SoCkit
  board/altera: update README for new scripts and fixed some typos

 board/altera/genimage.cfg                          |  31 +
 board/altera/post-image.sh                         |  29 +-
 board/altera/readme.txt                            |  64 +-
 .../sockit/altera_sockit_config_buildroot.patch    |  35 +
 .../uboot-sockit-preloader-sample-design.patch     | 820 ---------------------
 configs/altera_sockit_defconfig                    |  20 +-
 6 files changed, 136 insertions(+), 863 deletions(-)
 create mode 100644 board/altera/genimage.cfg
 create mode 100644 board/altera/sockit/altera_sockit_config_buildroot.patch
 delete mode 100644 board/altera/sockit/uboot-sockit-preloader-sample-design.patch

-- 
2.7.4
