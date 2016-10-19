From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 19 Oct 2016 16:23:06 +0200
Subject: [Buildroot] [PATCH 1/4] imx-kobs: switch to open source version
In-Reply-To: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
References: <20161019142309.15628-1-gary.bisson@boundarydevices.com>
Message-ID: <20161019142309.15628-2-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tools "kobs-ng" will be maintained as a open source project.
The repository location is https://github.com/NXPmicro/imx-kobs

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-freescale/commit/c23736b3

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/imx-kobs/imx-kobs.hash | 2 +-
 package/freescale-imx/imx-kobs/imx-kobs.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-kobs/imx-kobs.hash b/package/freescale-imx/imx-kobs/imx-kobs.hash
index b942bd3..258d08c 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.hash
+++ b/package/freescale-imx/imx-kobs/imx-kobs.hash
@@ -1 +1 @@
-sha256	85171b46068ac47c42fedb8104167bf9afd33dd9527ed127e1ca2eb29d7a86bf  imx-kobs-5.4.tar.gz
+sha256	5b040de6e3db5d47371b311e7068380926827a7a6ef02e45fb2ba08b680d0ec5  imx-kobs-b402243a04e5a6760a860445e5ff6a931d86f794.tar.gz
diff --git a/package/freescale-imx/imx-kobs/imx-kobs.mk b/package/freescale-imx/imx-kobs/imx-kobs.mk
index b80d5bd..8f490c2 100644
--- a/package/freescale-imx/imx-kobs/imx-kobs.mk
+++ b/package/freescale-imx/imx-kobs/imx-kobs.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IMX_KOBS_VERSION = 5.4
-IMX_KOBS_SITE = $(FREESCALE_IMX_SITE)
+IMX_KOBS_VERSION = b402243a04e5a6760a860445e5ff6a931d86f794
+IMX_KOBS_SITE = $(call github,NXPmicro,imx-kobs,$(IMX_KOBS_VERSION))
 IMX_KOBS_LICENSE = GPLv2+
 IMX_KOBS_LICENSE_FILES = COPYING
 
-- 
2.9.3
