From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Sun, 29 Sep 2013 15:54:54 -0700
Subject: [Buildroot] [PATCH 0/4] i.MX: Refactor and update library versions
Message-ID: <1380495298-22823-1-git-send-email-eric.nelson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch set restructures several libraries to share common
Makefile fragments in package/freescale-imx and bumps the 
library versions to match the Freescale 3.0.35_4.1.0 release
for i.MX6.

This series essentially replaces and improves upon patch 4/4
sent on 2013-09-25:
	http://lists.busybox.net/pipermail/buildroot/2013-September/thread.html#78989

Eric Nelson (4):
  i.MX: move Freescale i.MX packages into freescale-imx/
  i.MX: Use FREESCALE_IMX_MIRROR_SITE for newly-moved packages
  i.MX6: Use canonical site for Freescale packages
  i.MX: Bump library versions to latest release (3.0.35-4.1.0)

 package/Config.in                                  |  3 --
 package/freescale-imx/Config.in                    |  3 ++
 package/freescale-imx/firmware-imx/firmware-imx.mk |  2 +-
 package/freescale-imx/freescale-imx.mk             |  6 ++--
 .../gpu-viv-bin-mx6q/gpu-viv-bin-mx6q.mk           |  8 +++--
 package/freescale-imx/imx-lib/imx-lib.mk           | 18 ++++++++--
 package/freescale-imx/libfslcodec/Config.in        |  8 +++++
 package/freescale-imx/libfslcodec/libfslcodec.mk   | 39 ++++++++++++++++++++
 package/freescale-imx/libfslparser/Config.in       |  8 +++++
 package/freescale-imx/libfslparser/libfslparser.mk | 41 ++++++++++++++++++++++
 package/freescale-imx/libfslvpuwrap/Config.in      | 13 +++++++
 .../freescale-imx/libfslvpuwrap/libfslvpuwrap.mk   | 35 ++++++++++++++++++
 package/libfslcodec/Config.in                      |  8 -----
 package/libfslcodec/libfslcodec.mk                 | 40 ---------------------
 package/libfslparser/Config.in                     |  8 -----
 package/libfslparser/libfslparser.mk               | 40 ---------------------
 package/libfslvpuwrap/Config.in                    | 13 -------
 package/libfslvpuwrap/libfslvpuwrap.mk             | 18 ----------
 18 files changed, 172 insertions(+), 139 deletions(-)
 create mode 100644 package/freescale-imx/libfslcodec/Config.in
 create mode 100644 package/freescale-imx/libfslcodec/libfslcodec.mk
 create mode 100644 package/freescale-imx/libfslparser/Config.in
 create mode 100644 package/freescale-imx/libfslparser/libfslparser.mk
 create mode 100644 package/freescale-imx/libfslvpuwrap/Config.in
 create mode 100644 package/freescale-imx/libfslvpuwrap/libfslvpuwrap.mk
 delete mode 100644 package/libfslcodec/Config.in
 delete mode 100644 package/libfslcodec/libfslcodec.mk
 delete mode 100644 package/libfslparser/Config.in
 delete mode 100644 package/libfslparser/libfslparser.mk
 delete mode 100644 package/libfslvpuwrap/Config.in
 delete mode 100644 package/libfslvpuwrap/libfslvpuwrap.mk

-- 
1.8.1.2
