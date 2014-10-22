From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 18:07:35 +0200
Subject: [Buildroot] [git commit] openswan: bump to version 2.6.42
Message-ID: <20141022160740.10D14B0026@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29ea73ab4fbd6c6e343c321d209cef2c8303be05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash file.
Patch upstream in common Makefile.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openswan/openswan-01-gcc-detection.patch |   43 ----------------------
 package/openswan/openswan.hash                   |    2 +
 package/openswan/openswan.mk                     |    2 +-
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/openswan/openswan-01-gcc-detection.patch b/package/openswan/openswan-01-gcc-detection.patch
deleted file mode 100644
index 2feb5c5..0000000
--- a/package/openswan/openswan-01-gcc-detection.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b37d4bd266ec65acdf5288e21722991d1c5ec44a Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sun, 30 Mar 2014 08:52:05 -0300
-Subject: [PATCH] Makefile: use CC for version test instead of gcc
-
-Use $(CC) for the version test since that's different from gcc when
-cross-compiling.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- lib/libopenswan/Makefile | 2 +-
- programs/pluto/Makefile  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/libopenswan/Makefile b/lib/libopenswan/Makefile
-index 3649fe7..06f5317 100644
---- a/lib/libopenswan/Makefile
-+++ b/lib/libopenswan/Makefile
-@@ -90,7 +90,7 @@ CFLAGS+= -Wpointer-arith
- CFLAGS+= -Wno-error=cast-qual
- 
- # Check if GCC's version is recent enough
--GCC_VERSION_GE_46:=$(shell test `gcc -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
-+GCC_VERSION_GE_46:=$(shell test `$(CC) -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
- ifeq ($(GCC_VERSION_GE_46),true)
- # some junk left in alg_info.c
- CFLAGS+= -Wno-error=cpp
-diff --git a/programs/pluto/Makefile b/programs/pluto/Makefile
-index 8e4bc89..ed5e9dc 100644
---- a/programs/pluto/Makefile
-+++ b/programs/pluto/Makefile
-@@ -48,7 +48,7 @@ CPPFLAGS = $(HDRDIRS) $(DEFINES) \
- # must turn this off due to myid.c
- CFLAGS+= -Wno-error=cast-qual
- # Check if GCC's version is recent enough
--GCC_VERSION_GE_46:=$(shell test `gcc -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
-+GCC_VERSION_GE_46:=$(shell test `$(CC) -dumpversion | sed 's/^\([0-9]\)\.\([0-9]\).*/\1\2/'` -ge 46 && echo true || echo false)
- ifeq ($(GCC_VERSION_GE_46),true)
- CFLAGS+= -Wno-error=cpp
- endif
--- 
-1.8.3.2
-
diff --git a/package/openswan/openswan.hash b/package/openswan/openswan.hash
new file mode 100644
index 0000000..724a935
--- /dev/null
+++ b/package/openswan/openswan.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	1be58b684dedd4bf00946ac5c7c6e9fbf8ac5db849feea2360c42c5e87cb565a	openswan-2.6.42.tar.gz
diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index ca29daa..ba36f7c 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSWAN_VERSION = 2.6.41
+OPENSWAN_VERSION = 2.6.42
 OPENSWAN_SITE = http://download.openswan.org/openswan
 OPENSWAN_LICENSE = GPLv2+, BSD-3c
 OPENSWAN_LICENSE_FILES = COPYING LICENSE
