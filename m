From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 18 Oct 2017 21:03:57 +0300
Subject: [Buildroot] [PATCH] powertop: needs autoreconf
Message-ID: <dac9c0cd9a627b5c5500de6779f4aeca43fd0989.1508349837.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 01048deab60 (package/powertop: bump to version 2.9) removed
autoreconf even though the remaining patch touches Makefile.am. Fix
this.

Fixes:
http://autobuild.buildroot.net/results/3bf/3bf8daee559e2978f8602c56397afda771299032/
http://autobuild.buildroot.net/results/f9b/f9b4f113a333107a972fa51bd0347eeb0d52496f/
http://autobuild.buildroot.net/results/067/0675826888b6f89e76291c7835839344300ca9f5/

Cc: Romain Naour <romain.naour@gmail.com>
Cc: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/powertop/powertop.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index ce7a11875894..7c9c7ccc3f41 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -12,6 +12,8 @@ POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+# Patching Makefile.am
+POWERTOP_AUTORECONF = YES
 
 # Help powertop at finding the right ncurses library depending on
 # which one is available.
-- 
2.14.2
