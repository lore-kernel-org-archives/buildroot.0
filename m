From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 09:11:27 +0200
Subject: [Buildroot] [git commit] libftdi: add explicit dependencies for
	host variant
Message-ID: <20160703071146.7A4EE7FE29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=667cc3728613534f952aee58e8252b5cb2d7b5df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch also removes an incorrect dependency between host-libftdi and
host-boost when BR2_PACKAGE_LIBTFDI_CPP is set.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libftdi/libftdi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libftdi/libftdi.mk b/package/libftdi/libftdi.mk
index 28f20e3..2364c46 100644
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
