From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  7 Mar 2019 22:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable on arc,
 nios and or1k
Message-ID: <20190307213431.17211-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/22c72369cd5b7a8200bb03564bdc342ed026ccac
 - http://autobuild.buildroot.org/results/ef6869bc40382145fad1079b79107275c4973494
 - http://autobuild.buildroot.org/results/09d857102c469ede1db0bff8aa0dcd82a4001eaf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index cf1f53c1a3..b99fc2a960 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
-	depends on !BR2_microblaze && !BR2_xtensa # platform.h
+	# platform.h
+	depends on !(BR2_arc || BR2_microblaze || BR2_nios || \
+		BR2_or1k || BR2_xtensa)
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
-- 
2.14.1
