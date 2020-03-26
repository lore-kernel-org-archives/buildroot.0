From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Mar 2020 17:49:41 +0100
Subject: [Buildroot] [PATCH 0/2] imx: fix i.MX8MMini support
Message-ID: <20200326164943.564656-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series fixes some issues with i.MX8MMini:
- This platform uses Hantro VPU just like i.MX8MQ
- It was lacking a platform variable so that VPU package knows when to
  build encoder (or not).
- Updating imx-vpu-hantro to support i.MX8Mini and its encoder

Let me know if you have any questions.

Regards,
Gary

Gary Bisson (2):
  package/freescale-imx: fix i.MX8MMini configuration
  package/freescale-imx/imx-vpu-hantro: bump version to 1.15.0

 package/freescale-imx/Config.in               |  6 +-
 ...on.h-header-inclusion-to-be-standard.patch | 64 ++++++++++++++-----
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +-
 .../imx-vpu-hantro/imx-vpu-hantro.mk          |  5 +-
 4 files changed, 58 insertions(+), 23 deletions(-)

-- 
2.25.1
