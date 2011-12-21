From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Dec 2011 23:02:31 +0100
Subject: [Buildroot] [git commit] cdrkit: bump to version 1.1.11 and adjust
	style
Message-ID: <20111221220350.058B78FAAF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef3fe1bef6581c66af3858d540343e011cb9fdd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...0-no-rcmd.patch => cdrkit-1.1.11-no-rcmd.patch} |    0
 package/cdrkit/cdrkit.mk                           |   14 +++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/cdrkit/cdrkit-1.1.10-no-rcmd.patch b/package/cdrkit/cdrkit-1.1.11-no-rcmd.patch
similarity index 100%
rename from package/cdrkit/cdrkit-1.1.10-no-rcmd.patch
rename to package/cdrkit/cdrkit-1.1.11-no-rcmd.patch
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 9eebe6e..fc22c18 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -1,9 +1,13 @@
-CDRKIT_VERSION=1.1.10
-CDRKIT_SOURCE=cdrkit-$(CDRKIT_VERSION).tar.gz
-CDRKIT_SITE=http://www.cdrkit.org/releases/
+#############################################################
+#
+# cdrkit
+#
+#############################################################
 
-CDRKIT_DEPENDENCIES=libcap bzip2 zlib
-HOST_CDRKIT_DEPENDENCIES=host-libcap host-bzip2 host-zlib
+CDRKIT_VERSION = 1.1.11
+CDRKIT_SITE = http://www.cdrkit.org/releases
+CDRKIT_DEPENDENCIES = libcap bzip2 zlib
+HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
