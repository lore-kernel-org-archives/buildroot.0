From: imrehg at gmail.com <imrehg@gmail.com>
Date: Fri, 23 Jan 2015 16:02:47 +0800
Subject: [Buildroot] [PATCH 0/1] VIA VAB-820 board
Message-ID: <1422000168-19305-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gergely Imreh <imrehg@gmail.com>

Hi,

I'd like to submit a patch to add support for an ARM dev board.

I'm technical marketing at VIA Embedded, a Taiwan based board maker,
that makes a couple of ARM boards. One of them is a Freescale i.MX6Q
based board VAB-820 (and its system equivalent, called AMOS-820), inspired
by the SABRE Lite design.

These boards unfortunately don't come with a bootable OS image in the BSP,
but with a manual explaining how to get an OS image up based on the relevant
Freescale BSP. I did some development to remedy this and make it easier
for the board's users to get started[0]. I was using Buildroot to make the
toolchain setup easier for the kernel compilation part. Now I managed to add
all the parts and sources that are needed to be able to build the whole
image within Buildroot. I'm submitting this patch to release the development
to the wider community.

Since this is our first contribution, would love to have any kind of feedback.
Most of the changes I've based on other code that is already part of Buildroot,
and kept changes to the absolute minimum.

Comments on the patch:

 * the included u-boot patch is needed to have working system without any manual
   u-boot variable setting in the debug console (thus making the compiled image
   usable right out of factory)
 * the gcc version in the defconfig is set to a value that is known to work (4.7),
   as newer versions seem to result in an uImage that kernel panics during boot

Cheers,
   Greg

[0]: http://www.viaspringboard.com/blog/2014/12/31/ready-go-file-system-vab-820/

Gergely Imreh (1):
  board: add support for the VIA VAB-820 board

 board/via/imx6_vab820/6x_bootscript.txt            |  5 ++
 board/via/imx6_vab820/post-build.sh                |  7 ++
 board/via/imx6_vab820/readme.txt                   | 95 ++++++++++++++++++++++
 .../imx6_vab820/uboot-0001-add-bootscript.patch    | 44 ++++++++++
 configs/via_imx6_vab820_defconfig                  | 38 +++++++++
 5 files changed, 189 insertions(+)
 create mode 100644 board/via/imx6_vab820/6x_bootscript.txt
 create mode 100755 board/via/imx6_vab820/post-build.sh
 create mode 100644 board/via/imx6_vab820/readme.txt
 create mode 100644 board/via/imx6_vab820/uboot-0001-add-bootscript.patch
 create mode 100644 configs/via_imx6_vab820_defconfig

-- 
2.2.2
