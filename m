From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 24 Sep 2014 18:14:25 +0200
Subject: [Buildroot] [PATCH 0/2] i.MX6 SABRESD improvements (using a
	Freescale kernel)
Message-ID: <1411575267-1569-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here are 2 little improvements to the i.MX6 SABRESD board support in Buildroot,
both suggested by Thomas Petazzoni in [1].

This differs from the patchest I sent earlier today [2] in the kernel origin:
keep using git.freescale.com instead of switching to a mainline kernel, as
per the discussion in [2].

Nothing huge, just see the changelog below.

Built and run on an i.MX6DL SABRESD board.

Vincent, it would be nice if you could test it on a Quad-based board.

Luca Ceresoli (2):
  freescale/imx6-sabresd: use global patch dir for U-Boot patches
  freescale/imx6-sabresd: lock down kernel headers to the kernel version

 ...01-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch | 0
 configs/freescale_imx6dlsabresd_defconfig                        | 9 ++++++++-
 configs/freescale_imx6qsabresd_defconfig                         | 9 ++++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)
 rename board/freescale/imx6sabresd/{ => patches/uboot}/uboot-0001-mx6qsabre_common-boot-Linux-to-init-in-mfgtools-mode.patch (100%)

[1] http://lists.busybox.net/pipermail/buildroot/2014-September/106704.html
[2] http://lists.busybox.net/pipermail/buildroot/2014-September/106972.html

-- 
Luca

-- 
1.9.1
