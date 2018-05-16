From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 16 May 2018 17:51:58 +0200
Subject: [Buildroot] [PATCH 0/3] imx: add Wayland GPU libs / Weston-imx
 support
Message-ID: <20180516155201.10279-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

This series adds Wayland support for the Vivante GPU libraries used by
i.MX processors.

Adding Wayland configuration to the imx-gpu-viv was pretty
straightforward since there was the x11/fb mechanism in place.

However, to get the Wayland libraries properly used in Weston it
requires to use NXP weston-imx repo, other the gl-renderer isn't used
for the fbdev backend.

This series will be particularly useful for the i.MX8M since the GPU
libraries for this latter only supports Wayland backend (no more FB/X11
options).

The whole series was tested on i.MX6Q Nitrogen6x platform.

Let me know if you have any question.

Regards,
Gary

Gary Bisson (3):
  imx-gpu-viv: add Wayland backend option
  weston: remove dependency on mesa3d to enable egl
  weston: add weston-imx variant when using imx-gpu-viv

 package/freescale-imx/imx-gpu-viv/Config.in      | 10 +++++++++-
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk | 10 ++++++++++
 package/weston/weston.hash                       |  2 ++
 package/weston/weston.mk                         | 10 ++++++++--
 4 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.17.0
