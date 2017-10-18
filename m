From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:28:35 +0200
Subject: [Buildroot] [git commit] powertop: needs autoreconf
Message-ID: <20171018202118.9EBC380E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89721c8c9023a19b41e4dacfc842fafe80cef119
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/powertop/powertop.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/powertop/powertop.mk b/package/powertop/powertop.mk
index ce7a118..cf5e8d4 100644
--- a/package/powertop/powertop.mk
+++ b/package/powertop/powertop.mk
@@ -12,6 +12,8 @@ POWERTOP_DEPENDENCIES = pciutils ncurses libnl host-pkgconf \
 POWERTOP_LICENSE = GPL-2.0
 POWERTOP_LICENSE_FILES = COPYING
 POWERTOP_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+# 0001-dont-force-stack-smashing-protection.patch
+POWERTOP_AUTORECONF = YES
 
 # Help powertop at finding the right ncurses library depending on
 # which one is available.
