From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 14 Dec 2011 12:15:18 -0300
Subject: [Buildroot] [PATCH 3/3] cdrkit: bump to version 1.1.11 and adjust
	style
In-Reply-To: <1323875718-25871-1-git-send-email-gustavo@zacarias.com.ar>
References: <1323875718-25871-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1323875718-25871-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...0-no-rcmd.patch => cdrkit-1.1.11-no-rcmd.patch} |    0
 package/cdrkit/cdrkit.mk                           |   14 +++++++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename package/cdrkit/{cdrkit-1.1.10-no-rcmd.patch => cdrkit-1.1.11-no-rcmd.patch} (100%)

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
-- 
1.7.3.4
