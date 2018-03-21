From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Mar 2018 22:13:16 +0200
Subject: [Buildroot] [PATCH] flashrom: avoid download URL redirect
Message-ID: <fce71df77b97c82775049f8e7dd00133e859dcf1.1521663196.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the https URL to avoid HTTP 308 redirect. Older wget releases treat
it as a hard error.

Fixes:
http://autobuild.buildroot.net/results/ee6/ee66e5ead70e73f1d2dae1c5ba31ccf054fe15a7/
http://autobuild.buildroot.net/results/fb8/fb8509bf9cf03933e45355fd9a6c3fa53d33c44f/
http://autobuild.buildroot.net/results/0e1/0e196570207e459c3440d50cecf0032eee6edfc2/

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/flashrom/flashrom.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index 95ce86c52ca4..70f47b5a041d 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -6,7 +6,7 @@
 
 FLASHROM_VERSION = 1.0
 FLASHROM_SOURCE = flashrom-$(FLASHROM_VERSION).tar.bz2
-FLASHROM_SITE = http://download.flashrom.org/releases
+FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_DEPENDENCIES = pciutils libusb libusb-compat libftdi host-pkgconf
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
-- 
2.16.2
