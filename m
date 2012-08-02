From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:53:06 -0000
Subject: [Buildroot] [git commit branch/next] omap-u-boot-utils: fix
	visibility in menuconfig
Message-ID: <20120802195237.C91BC96FF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f83df20c863408de3eec03cff60cf4ef4b6be29a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

These tools only are useful for ARM (OMAP) targets.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/omap-u-boot-utils/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/omap-u-boot-utils/Config.in.host b/package/omap-u-boot-utils/Config.in.host
index 63fbdf5..87dcc06 100644
--- a/package/omap-u-boot-utils/Config.in.host
+++ b/package/omap-u-boot-utils/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_OMAP_U_BOOT_UTILS
 	bool "host omap-u-boot-utils"
+	depends on BR2_arm || BR2_armeb
 	help
 	  U-Boot Utilities for Texas Instrument's OMAP platforms.
 	  This is a set of tools to control U-Boot from scripts, generate
