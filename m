From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Jan 2018 15:21:18 +0100
Subject: [Buildroot] [git commit] imx-lib: bump to version
 imx_4.9.11_1.0.0_ga
Message-ID: <20180107144905.CA5A3802F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bbddba402a565dc29b027b57cbd7e06d879b332
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also switching to git repository as done in Yocto recipe [1].

[1] https://github.com/Freescale/meta-freescale/blob/rocko/recipes-bsp/imx-lib/imx-lib_git.bb

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freescale-imx/imx-lib/imx-lib.hash | 2 +-
 package/freescale-imx/imx-lib/imx-lib.mk   | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/freescale-imx/imx-lib/imx-lib.hash b/package/freescale-imx/imx-lib/imx-lib.hash
index 76dcb23..b3fce59 100644
--- a/package/freescale-imx/imx-lib/imx-lib.hash
+++ b/package/freescale-imx/imx-lib/imx-lib.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256 8d12c4a0a44d29569f1ead3a36adc28402b9c4036b53e11dd3ebf2295e3ce1d0  imx-lib-5.4.tar.gz
+sha256 245ace9b2c50d6c13a804d9c4492a5a850c626e7537f0d0bad81670b2824892f  imx-lib-rel_imx_4.9.x_1.0.0_ga.tar.gz
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
index 3e0f7d8..e823685 100644
--- a/package/freescale-imx/imx-lib/imx-lib.mk
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-IMX_LIB_VERSION = 5.4
-IMX_LIB_SITE = $(FREESCALE_IMX_SITE)
+IMX_LIB_VERSION = rel_imx_4.9.x_1.0.0_ga
+IMX_LIB_SITE = https://source.codeaurora.org/external/imx/imx-lib
+IMX_LIB_SITE_METHOD = git
 IMX_LIB_LICENSE = LGPL-2.1+
 IMX_LIB_LICENSE_FILES = COPYING-LGPL-2.1
 
@@ -14,8 +15,6 @@ IMX_LIB_INSTALL_STAGING = YES
 # imx-lib needs access to imx-specific kernel headers
 IMX_LIB_DEPENDENCIES += linux
 IMX_LIB_INCLUDE = \
-	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
-	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
 	-idirafter $(LINUX_DIR)/include/uapi
 
 IMX_LIB_MAKE_ENV = \
