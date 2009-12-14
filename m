From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Dec 2009 13:34:27 +0100
Subject: [Buildroot] [git commit master] package/mtd-utils: fix git build
	after gitweb update
Message-ID: <20091214123452.CE2AD77717@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a2d833bf34a7a3a10d24956cd27d02958e2cca38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by Daniel Mack <daniel@caiaq.de>

The gitweb installation of infradead.org has been updated, and gitweb >=
1.6.6-rc1 adds the first 7 characters of the git SHA1 to the snapshot
tarball directory name.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                          |    2 +-
 package/mtd/mtd-utils.git/mtd.mk |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index b31d5dc..5217452 100644
--- a/CHANGES
+++ b/CHANGES
@@ -4,7 +4,7 @@
 
 	Updated/fixed packages: autoconf, bind, binutils, busybox,
 	directfb, gst-plugins-bad, iw, libfuse, libpcap, lighttpd,
-	mesa, pcre, sshfs, tremor, usbutils
+	mesa, mtd-utils, pcre, sshfs, tremor, usbutils
 
 	Issues resolved (http://bugs.uclibc.org):
 
diff --git a/package/mtd/mtd-utils.git/mtd.mk b/package/mtd/mtd-utils.git/mtd.mk
index b7e584e..6cb45c2 100644
--- a/package/mtd/mtd-utils.git/mtd.mk
+++ b/package/mtd/mtd-utils.git/mtd.mk
@@ -4,12 +4,14 @@
 #
 #############################################################
 MTD_VERSION:=fcb52ccc99679460640386c297023f852b108f68
+# gitweb >= 1.6.6-rc1 uses first 7 chars of git SHA1 as dir suffix
+MTD_SHORT_VERSION=$(shell echo $(MTD_VERSION)|cut -c -7)
 MTD_SOURCE:=mtd-utils-$(MTD_VERSION).tar.gz
 MTD_URL:=http://git.infradead.org/mtd-utils.git?a=snapshot;h=$(MTD_VERSION);sf=tgz
 MTD_HOST_DIR:= $(TOOLCHAIN_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_DIR:=$(BUILD_DIR)/mtd-utils-$(MTD_VERSION)
 MTD_CAT:=$(ZCAT)
-MTD_NAME:=mtd-utils
+MTD_NAME:=mtd-utils-$(MTD_SHORT_VERSION)
 
 #############################################################
 #
-- 
1.6.3.3
