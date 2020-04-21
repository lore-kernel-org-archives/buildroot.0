From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 08:48:57 +0200
Subject: [Buildroot] [git commit] package/apcupsd: uses fork(), needs MMU
Message-ID: <20200421063623.C73298F93A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=209ea2414bbba0ae7444934c5cad228b07b2daa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/19af985de6e26813b841e7019051da3043c2b7d1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apcupsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/apcupsd/Config.in b/package/apcupsd/Config.in
index fc77e7c208..eabfb14842 100644
--- a/package/apcupsd/Config.in
+++ b/package/apcupsd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_APCUPSD
 	bool "apcupsd"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
 	help
 	  A daemon for controlling APC UPSes.
 
