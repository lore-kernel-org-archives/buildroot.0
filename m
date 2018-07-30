From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 30 Jul 2018 15:01:39 +0200
Subject: [Buildroot] [PATCH v3 0/5] imx: update multimedia packages to
 4.9.88_2.0.0_ga
Message-ID: <20180730130144.31110-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This series updates the i.MX multimedia packages to be in line with the
NXP 4.9.88-2.0.0_ga release [1].

The main benefit of this release is that it works for both 32-bit
i.MX6/7 processors as well as 64-bit i.MX8MQ.

That means that new packages had to be added to support the i.MX8MQ VPU
IP (from Hantro).

As discussed in the ML thread [1], since we haven't reached an agreement
on which approach is best (virtual package vs. manual mechanism), this
version of the series is here to show that it would look like without
the virtual package.

I have to admit that reduces the series by 2 patches and makes it easier
to understand. As I've said before, I'm ok either way, just need to pick
the one that looks the best for you.

Changelog v3:
- Remove virtual package (Thomas)
- Update help text to mention i.MX27 (Baruch)
- Add BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO option (Arnout)
- Add missing dependency on linux kernel for imx-vpu-hantro (Arnout)
- Remove dependency on BR2_arm/aarch64 since we have HAS_VPU(_HANTRO)
  (Arnout)
Changelog v2:
- Add BR2_PACKAGE_IMX_VPU to Config.in.legacy (Baruch)
- Name i.MX processors targeted by each package in Config.in help text
  (Baruch)

Regards,
Gary

[1] http://lists.busybox.net/pipermail/buildroot/2018-July/226823.html

Gary Bisson (5):
  imx-vpu-hantro: new package
  imx-vpu: bump version to 5.4.38
  imx-vpuwrap: bump version to 4.3.5
  imx-codec: bump version to 4.3.5
  imx-parser: bump version to 4.3.5

 package/freescale-imx/Config.in               |  5 +++
 .../freescale-imx/imx-codec/imx-codec.hash    |  3 +-
 package/freescale-imx/imx-codec/imx-codec.mk  |  2 +-
 .../freescale-imx/imx-parser/imx-parser.hash  |  3 +-
 .../freescale-imx/imx-parser/imx-parser.mk    |  2 +-
 ...on.h-header-inclusion-to-be-standard.patch | 44 +++++++++++++++++++
 .../freescale-imx/imx-vpu-hantro/Config.in    | 20 +++++++++
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  2 +
 .../imx-vpu-hantro/imx-vpu-hantro.mk          | 42 ++++++++++++++++++
 package/freescale-imx/imx-vpu/Config.in       | 13 +++---
 package/freescale-imx/imx-vpu/imx-vpu.hash    |  3 +-
 package/freescale-imx/imx-vpu/imx-vpu.mk      |  2 +-
 package/freescale-imx/imx-vpuwrap/Config.in   | 11 +++--
 .../imx-vpuwrap/imx-vpuwrap.hash              |  3 +-
 .../freescale-imx/imx-vpuwrap/imx-vpuwrap.mk  | 11 ++++-
 15 files changed, 143 insertions(+), 23 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
 create mode 100644 package/freescale-imx/imx-vpu-hantro/Config.in
 create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
 create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk

-- 
2.18.0
