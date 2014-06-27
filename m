From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:49 -0700
Subject: [Buildroot] [PATCH v2 06/11] libfslvpuwrap: bump to version 1.0.46
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-7-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

as VPU code is no longer in imx-lib, this package now depends on imx-vpu
package.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/libfslvpuwrap/Config.in        | 2 +-
 package/libfslvpuwrap/libfslvpuwrap.mk | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libfslvpuwrap/Config.in b/package/libfslvpuwrap/Config.in
index 9cf7633..fa85ce5 100644
--- a/package/libfslvpuwrap/Config.in
+++ b/package/libfslvpuwrap/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBFSLVPUWRAP
 	bool "libfslvpuwrap"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	select BR2_PACKAGE_IMX_LIB
+	select BR2_PACKAGE_IMX_VPU
 	help
 	  Wrapper library for the vpu library, giving it a different API.
 
diff --git a/package/libfslvpuwrap/libfslvpuwrap.mk b/package/libfslvpuwrap/libfslvpuwrap.mk
index 2299032..c3a5c1c 100644
--- a/package/libfslvpuwrap/libfslvpuwrap.mk
+++ b/package/libfslvpuwrap/libfslvpuwrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFSLVPUWRAP_VERSION = 3.5.7-1.0.0
+LIBFSLVPUWRAP_VERSION = 1.0.46
 LIBFSLVPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 LIBFSLVPUWRAP_SOURCE = libfslvpuwrap-$(LIBFSLVPUWRAP_VERSION).bin
 LIBFSLVPUWRAP_LICENSE = Freescale Semiconductor Software License Agreement
@@ -14,7 +14,7 @@ LIBFSLVPUWRAP_REDISTRIBUTE = NO
 
 LIBFSLVPUWRAP_INSTALL_STAGING = YES
 
-LIBFSLVPUWRAP_DEPENDENCIES += imx-lib
+LIBFSLVPUWRAP_DEPENDENCIES += imx-vpu
 
 # The archive is a shell-self-extractor of a bzipped tar. It happens
 # to extract in the correct directory (libfslvpuwrap-x.y.z)
-- 
2.0.0
