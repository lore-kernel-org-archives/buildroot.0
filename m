From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:36:15 +0100
Subject: [Buildroot] [git commit] package/flashrom: disable on microblaze
 and xtensa
Message-ID: <20190307203345.8A97D8EA19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=582448032d97b9dc6b196d838f57ec7f695048ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/cdf0fb462eec143ea881d43cdd0c69c86122f66b
 - http://autobuild.buildroot.org/results/df4d9702959b610762e87cf21fac9de62365dae6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
