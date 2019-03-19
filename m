From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:09:22 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: remove
 dmidecode dependency
Message-ID: <20190319191327.A4E5781935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=838e5efae235802c83fc389ca08748ba70d7b418
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

flashrom uses its own internal DMI decoder since version 0.9.8 and
https://github.com/flashrom/flashrom/commit/4c6d3a4b732732eb20bfb0fc9d857abaa4c41c88

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7edb1e1c29a86df017586ca31952ffb9386014c5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
