From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 08:42:06 +0200
Subject: [Buildroot] [git commit] package/pdmenu: bump to version 1.3.6
Message-ID: <20200914063320.C4BD288378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14905c775ca0934a587697fa202dc480278a5aaf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site to get latest release
- Update indentation in hash file
- This bump will also fix a build failure with gcc 10 thanks to
  https://git.joeyh.name/index.cgi/pdmenu.git/commit/?id=1a2dce9aaa6cdd0406f0be666929562d3b4521ff

Fixes:
 - http://autobuild.buildroot.org/results/78946a381f9f70975b41d24b0b050ba2073d6ef8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pdmenu/pdmenu.hash | 4 ++--
 package/pdmenu/pdmenu.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/pdmenu/pdmenu.hash b/package/pdmenu/pdmenu.hash
index ab3a6660ac..00c2569adf 100644
--- a/package/pdmenu/pdmenu.hash
+++ b/package/pdmenu/pdmenu.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256 302aa81b8868133ff5a0f3e3e897f71d425bc628c0d7439addb623f12c277bea pdmenu_1.3.4.tar.gz
+sha256  dedd2a4a5719278b5e49041161990c2f20b5909818837542aaca01819f2c14eb  pdmenu-1.3.6.tar.gz
 
 # License file hash, locally calculated
-sha256 32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670 doc/COPYING
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  doc/COPYING
diff --git a/package/pdmenu/pdmenu.mk b/package/pdmenu/pdmenu.mk
index 783509585c..2691a67ef6 100644
--- a/package/pdmenu/pdmenu.mk
+++ b/package/pdmenu/pdmenu.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PDMENU_VERSION = 1.3.4
-PDMENU_SOURCE = pdmenu_$(PDMENU_VERSION).tar.gz
-PDMENU_SITE = http://snapshot.debian.org/archive/debian/20170828T160058Z/pool/main/p/pdmenu
+PDMENU_VERSION = 1.3.6
+PDMENU_SITE = https://git.joeyh.name/index.cgi/pdmenu.git/snapshot
 PDMENU_LICENSE = GPL-2.0
 PDMENU_LICENSE_FILES = doc/COPYING
 PDMENU_DEPENDENCIES = slang $(TARGET_NLS_DEPENDENCIES)
