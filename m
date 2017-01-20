From: Lucas Bajolet <lucas.bajolet@savoirfairelinux.com>
Date: Fri, 20 Jan 2017 10:12:36 -0500
Subject: [Buildroot] [PATCH v3 0/3] Altera SoCkit board support fixes
Message-ID: <1484925159-25292-1-git-send-email-lucas.bajolet@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Update on the patch series to support the Altera SoCkit 
with modifications suggested by Thomas Petazzoni:

* The patch and config files commits have been merged into one
* The u-boot version has been rebased on a stable one

Thanks for the feedback!

Lucas Bajolet (3):
  configs/altera_sockit: bump kernel to 4.7 and u-boot to v2016.11-rc3
  board/altera: added genimage script to SoCkit
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
