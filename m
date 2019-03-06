From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed,  6 Mar 2019 19:02:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable on microblaze and
 xtensa
Message-ID: <20190306180216.20337-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/cdf0fb462eec143ea881d43cdd0c69c86122f66b
 - http://autobuild.buildroot.org/results/df4d9702959b610762e87cf21fac9de62365dae6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index 948c774133..cf1f53c1a3 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
+	depends on !BR2_microblaze && !BR2_xtensa # platform.h
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
-- 
2.14.1
