From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Feb 2019 20:26:08 +0100
Subject: [Buildroot] [PATCH/next 1/6] package/flashrom: remove dmidecode
 dependency
Message-ID: <20190228192613.30160-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

flashrom uses its own internal DMI decoder since version 0.9.8 and
https://github.com/flashrom/flashrom/commit/4c6d3a4b732732eb20bfb0fc9d857abaa4c41c88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index e7844a0a62..8f26a634e6 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -6,8 +6,6 @@ config BR2_PACKAGE_FLASHROM
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	select BR2_PACKAGE_LIBFTDI
-	# dmidecode is only a runtime dependency
-	select BR2_PACKAGE_DMIDECODE
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
-- 
2.14.1
