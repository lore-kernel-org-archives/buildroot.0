From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 12 Jun 2018 17:02:17 +0200
Subject: [Buildroot] [PATCH 0/4] imx: graphics packages update to 6.2.4.p1.2
Message-ID: <20180612150221.31792-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series bumps the version of the i.MX graphics packages.

This version is the first one that applies to both 32-bit and 64-bit
i.MX processors so aarch64 support was added.

As explained in the second commit, i.MX8 platforms only have Wayland as
possible graphical back-end (no more fb or x11) so a new variable was
created to hide those options. Not sure if it is the most elegant option
but it does the job for now.

And yes, g2d is only available for 32-bit platforms right now.

Let me know if you have any question/remark.

Regards,
Gary

Gary Bisson (4):
  imx-gpu-viv: bump to version 6.2.4.p1.2
  imx-gpu-viv: enable package for 64-bit i.MX processors
  imx-gpu-g2d: bump to version 6.2.4.p1.2
  kernel-module-imx-gpu-viv: bump to version 6.2.4.p1.2

 package/freescale-imx/Config.in                        |  7 ++++++-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash     |  2 +-
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk       |  2 +-
 package/freescale-imx/imx-gpu-viv/Config.in            | 10 +++++++++-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash     |  3 ++-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk       |  6 +++++-
 .../kernel-module-imx-gpu-viv.hash                     |  2 +-
 .../kernel-module-imx-gpu-viv.mk                       |  2 +-
 8 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.17.1
