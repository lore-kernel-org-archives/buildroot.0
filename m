From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 23 Sep 2015 15:39:25 +0200
Subject: [Buildroot] [PATCH v2 0/2] Add imx-kobs package
Message-ID: <1443015567-4040-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series adds the up to date imx-kobs package and deperecate the old
kobs-ng.

It also includes a patch to allow building this tool on musl as suggested
by Thomas:
http://lists.busybox.net/pipermail/buildroot/2015-September/139899.html

This patch will be submitted to the yocto mailing list (soone) to hopefully
get the attention of the actual imx-kobs package maintainer but I have little
to no hope that they will merge it into their code base as most Freescale
packages require glibc. I'll respond to this e-mail once the patch has been
submitted.

Changelog:
v1->v2:
- removed condition around the stddef.h inclusion as suggested by Arnout

Regards,
Gary

Gary Bisson (2):
  imx-kobs: add new package
  kobs-ng: remove obsolete package

 Config.in.legacy                                   |  8 +++
 package/Config.in                                  |  1 -
 package/freescale-imx/Config.in                    |  1 +
 .../imx-kobs/0001-Fix-musl-build.patch             | 39 ++++++++++++
 package/freescale-imx/imx-kobs/Config.in           | 10 +++
 package/freescale-imx/imx-kobs/imx-kobs.hash       |  2 +
 package/freescale-imx/imx-kobs/imx-kobs.mk         | 12 ++++
 package/kobs-ng/0001-fix-mtd-defines.patch         | 73 ----------------------
 package/kobs-ng/Config.in                          |  9 ---
 package/kobs-ng/kobs-ng.hash                       |  2 -
 package/kobs-ng/kobs-ng.mk                         | 13 ----
 11 files changed, 72 insertions(+), 98 deletions(-)
 create mode 100644 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch
 create mode 100644 package/freescale-imx/imx-kobs/Config.in
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.hash
 create mode 100644 package/freescale-imx/imx-kobs/imx-kobs.mk
 delete mode 100644 package/kobs-ng/0001-fix-mtd-defines.patch
 delete mode 100644 package/kobs-ng/Config.in
 delete mode 100644 package/kobs-ng/kobs-ng.hash
 delete mode 100644 package/kobs-ng/kobs-ng.mk

-- 
2.5.1
