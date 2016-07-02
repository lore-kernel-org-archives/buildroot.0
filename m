From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:51 +0200
Subject: [Buildroot] [PATCH 22/69] libftdi: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-23-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also removes an incorrect dependency between host-libftdi and
host-boost when BR2_PACKAGE_LIBTFDI_CPP is set.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libftdi/libftdi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 28f20e354731..2364c4625f2e 100644
--- a/package/libftdi/libftdi.mk
+++ b/package/libftdi/libftdi.mk
@@ -7,6 +7,7 @@
 LIBFTDI_VERSION = 0.20
 LIBFTDI_SITE = http://www.intra2net.com/en/developer/libftdi/download
 LIBFTDI_DEPENDENCIES = libusb-compat libusb
+HOST_LIBFTDI_DEPENDENCIES = host-libusb-compat host-libusb
 LIBFTDI_INSTALL_STAGING = YES
 LIBFTDI_CONFIG_SCRIPTS = libftdi-config
 LIBFTDI_AUTORECONF = YES
-- 
2.1.0
