From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 29 Apr 2016 09:56:57 +0200
Subject: [Buildroot] [PATCH 0/3] package/swupdate: bump to version 2016.04
Message-ID: <1461916620-5170-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bumping swupdate to version 2016.04 requires some changes to the packages mtd
and uboot-tools. Before the new version swupdate bundled the header files from
mtd and the environment sources from u-boot. To keep in sync with those packages
swupdate dropped the bundled headers and sources and needs them available on
the target system.

To satisfy the build dependency the patch set installs the necessary header
files from the package mtd and the static library libubootenv from the package
uboot-tools to the staging directory.

J?rg Krause (3):
  mtd: install header files to staging directory
  uboot-tools: install libubootenv to staging
  swupdate: bump to version 2016.04

 package/mtd/mtd.mk                 |  3 +++
 package/swupdate/Config.in         | 18 ++++++++++--------
 package/swupdate/swupdate.config   | 36 +++++++++++++++++++++++++++++++++++-
 package/swupdate/swupdate.hash     |  5 ++---
 package/swupdate/swupdate.mk       | 27 ++++++++++++++++++++-------
 package/uboot-tools/uboot-tools.mk |  8 ++++++++
 6 files changed, 78 insertions(+), 19 deletions(-)

-- 
2.8.0
