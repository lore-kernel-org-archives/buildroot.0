From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Thu, 5 Jul 2007 21:05:56 +0700
Subject: [Buildroot] coreutils 6.9 patch for subversion 19002
Message-ID: <5d75f4610707050705k751711a0u387a63555e9789a7@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is against subversion version 19002
It upgrades to coreutils 6.9

--- buildroot.19002/package/coreutils/coreutils.mk      2007-07-04
23:02:14.000000000 +0700
+++ buildroot/package/coreutils/coreutils.mk    2007-07-05
21:02:58.000000000 +0700
@@ -3,7 +3,7 @@
 # coreutils
 #
 #############################################################
-COREUTILS_VER:=5.96
+COREUTILS_VER:=6.9
 COREUTILS_SOURCE:=coreutils-$(COREUTILS_VER).tar.bz2
 #COREUTILS_SITE:=ftp://alpha.gnu.org/gnu/coreutils/
 COREUTILS_SITE:=http://ftp.gnu.org/pub/gnu/coreutils
@@ -102,13 +102,6 @@
                --disable-rpath \
                --disable-dependency-tracking \
        );
-       #Fix up the max number of open files per process, which apparently
-       # is not set when cross compiling
-       $(SED) 's,.*UTILS_OPEN_MAX.*,#define UTILS_OPEN_MAX 1019,g' \
-               $(COREUTILS_DIR)/config.h
-       # This is undefined when crosscompiling...
-       $(SED) 's,.*HAVE_PROC_UPTIME.*,#define HAVE_PROC_UPTIME 1,g' \
-               $(COREUTILS_DIR)/config.h
        touch $@

 $(COREUTILS_DIR)/$(COREUTILS_BINARY): $(COREUTILS_DIR)/.configured
