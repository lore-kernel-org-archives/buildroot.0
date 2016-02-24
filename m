From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 17:38:52 +0100
Subject: [Buildroot] [git commit branch/next] sdparm: bump to version 1.10
Message-ID: <20160224163924.3F88D8188E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad8358599649bc336ee17a1fc02a0ca350d1352b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

0000-makefile-remove-host-headers-include.patch is upstream so remove it
and drop autoreconf.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0000-makefile-remove-host-headers-include.patch   | 19 -------------------
 package/sdparm/sdparm.hash                            |  2 +-
 package/sdparm/sdparm.mk                              |  5 +----
 3 files changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/sdparm/0000-makefile-remove-host-headers-include.patch b/package/sdparm/0000-makefile-remove-host-headers-include.patch
deleted file mode 100644
index 765a81d..0000000
--- a/package/sdparm/0000-makefile-remove-host-headers-include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-src/Makefile.am: remove host headers incdlue
-
-Using host headers is bad for cross compilation. Instead, use the '=' prefix
-which expands to the current sysroot.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-diff -Nuar sdparm-1.09-orig/src/Makefile.am sdparm-1.09/src/Makefile.am
---- sdparm-1.09-orig/src/Makefile.am	2014-09-23 18:48:44.000000000 +0300
-+++ sdparm-1.09/src/Makefile.am	2015-02-06 09:33:43.693477667 +0200
-@@ -41,7 +41,7 @@
- 			../lib/sg_pt_common.c
- 
- if HAVE_SGUTILS
--INCLUDES = -I/usr/include/scsi
-+INCLUDES = -I=/scsi
- sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
- sdparm_DEPENDENCIES = @GETOPT_O_FILES@
- else
diff --git a/package/sdparm/sdparm.hash b/package/sdparm/sdparm.hash
index ff5e7b6..050785a 100644
--- a/package/sdparm/sdparm.hash
+++ b/package/sdparm/sdparm.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0f5e07438ef56e045443bd827008a38076e029558b00adbfc45f9cc8a5c75349	sdparm-1.09.tar.xz
+sha256	7dc9e148cef22744e00809dad21b59ac544e3615001bc1b2399978f73e1d58ca	sdparm-1.10.tar.xz
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
index 9fc2067..ed1606c 100644
--- a/package/sdparm/sdparm.mk
+++ b/package/sdparm/sdparm.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-SDPARM_VERSION = 1.09
+SDPARM_VERSION = 1.10
 SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tar.xz
 SDPARM_SITE = http://sg.danny.cz/sg/p
 SDPARM_LICENSE = BSD-3c
 SDPARM_LICENSE_FILES = COPYING
 
-# Patching src/Makefile.am
-SDPARM_AUTORECONF = YES
-
 ifeq ($(BR2_PACKAGE_SG3_UTILS),y)
 SDPARM_DEPENDENCIES += sg3_utils
 else
