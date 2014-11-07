From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 17:03:20 +0100
Subject: [Buildroot] [PATCH 0/7] Better handling of freescale
	self-extractible binaries
Message-ID: <1415376207-23292-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie introduce an helper fonction for freescale self-extractible
binaries. 

Obviously, last 3 patches of this serie apply on top of my previous 
series: "Add Xorg support for imx6" and "Add support for iMX5 GPU"


J?r?me Pouiller (7):
  freescale-imx: Add helper to extract self-extractible binaries
  firmware-imx: Use self-extractible helper
  imx-vpu: Use self-extractible helper
  libfsl*: Use self-extractible helper
  gpu-viv-bin-mx6q: Use self-extractible helper
  libz160: Use self-extractible helper
  gpu-amd-bin-mx51: Use self-extractible helper

 package/freescale-imx/firmware-imx/firmware-imx.mk | 16 ++++---------
 package/freescale-imx/freescale-imx.mk             | 21 +++++++++++++++++
 .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           | 27 ++++++++--------------
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           | 22 ++++--------------
 package/freescale-imx/imx-vpu/imx-vpu.mk           | 22 +++++-------------
 package/freescale-imx/libz160/libz160.mk           | 19 ++++-----------
 package/libfslcodec/libfslcodec.mk                 | 23 ++++--------------
 package/libfslparser/libfslparser.mk               | 23 ++++--------------
 package/libfslvpuwrap/libfslvpuwrap.mk             | 24 ++++---------------
 9 files changed, 62 insertions(+), 135 deletions(-)

-- 
1.9.1
