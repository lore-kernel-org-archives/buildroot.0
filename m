Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40BAC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 18:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5262D60B70;
	Sat,  5 Feb 2022 18:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x4_Dyeni-IKk; Sat,  5 Feb 2022 18:08:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 622CF60758;
	Sat,  5 Feb 2022 18:08:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B467A1BF41B
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B06C7401EF
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 18:08:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id It2XFzV9psSu for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 18:08:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83206401EB
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 18:08:21 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout01.t-online.de (Postfix) with SMTP id B99703CB5;
 Sat,  5 Feb 2022 19:08:18 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd82.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nGPTu-1mFVjt0; Sat, 5 Feb 2022 19:08:18 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:44586)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nGPTt-0002vI-L8;
 Sat, 05 Feb 2022 19:08:17 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 19:08:16 +0100
Message-Id: <20220205180817.2103343-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
References: <20220205180817.2103343-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644084498-0000B8A1-2174FD74/0/0 CLEAN NORMAL
X-TOI-MSGID: a5ab090c-70c9-4ba8-97e7-43f609a9dcd8
Subject: [Buildroot] [PATCH 2/3] package/dht: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for upcoming version bump of transmission.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build test using this defconfig

BR2_PACKAGE_DHT=y

was successful:

                             andes-nds32 [ 1/45]: OK
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: OK
                      bootlin-armv7-musl [ 8/45]: OK
                bootlin-m68k-5208-uclibc [ 9/45]: OK
               bootlin-m68k-68040-uclibc [10/45]: OK
             bootlin-microblazeel-uclibc [11/45]: OK
                bootlin-mipsel32r6-glibc [12/45]: OK
                   bootlin-mipsel-uclibc [13/45]: OK
                     bootlin-nios2-glibc [14/45]: OK
                 bootlin-openrisc-uclibc [15/45]: OK
        bootlin-powerpc64le-power8-glibc [16/45]: OK
           bootlin-powerpc-e500mc-uclibc [17/45]: OK
                   bootlin-riscv32-glibc [18/45]: OK
                   bootlin-riscv64-glibc [19/45]: OK
                    bootlin-riscv64-musl [20/45]: OK
                      bootlin-sh4-uclibc [21/45]: OK
                   bootlin-sparc64-glibc [22/45]: OK
                    bootlin-sparc-uclibc [23/45]: OK
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
                   bootlin-xtensa-uclibc [27/45]: OK
                            br-arm-basic [28/45]: OK
                    br-arm-full-nothread [29/45]: OK
                      br-arm-full-static [30/45]: OK
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
                      br-mips64-n64-full [33/45]: OK
                 br-mips64r6-el-hf-glibc [34/45]: OK
               br-powerpc-603e-basic-cpp [35/45]: OK
               br-powerpc64-power7-glibc [36/45]: OK
                       linaro-aarch64-be [37/45]: OK
                          linaro-aarch64 [38/45]: OK
                              linaro-arm [39/45]: OK
                     sourcery-arm-armv4t [40/45]: OK
                            sourcery-arm [41/45]: OK
                     sourcery-arm-thumb2 [42/45]: OK
                         sourcery-mips64 [43/45]: OK
                           sourcery-mips [44/45]: OK
                          sourcery-nios2 [45/45]: OK
45 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/dht/0001-cmake.patch | 67 ++++++++++++++++++++++++++++++++++++
 package/dht/Config.in        |  6 ++++
 package/dht/dht.hash         |  3 ++
 package/dht/dht.mk           | 13 +++++++
 6 files changed, 91 insertions(+)
 create mode 100644 package/dht/0001-cmake.patch
 create mode 100644 package/dht/Config.in
 create mode 100644 package/dht/dht.hash
 create mode 100644 package/dht/dht.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 70021ef823..c4084c5545 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -325,6 +325,7 @@ F:	package/bluez-tools/
 F:	package/boinc/
 F:	package/clamav/
 F:	package/dav1d/
+F:	package/dht/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
diff --git a/package/Config.in b/package/Config.in
index 52a8ff8fe3..990ee19665 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1798,6 +1798,7 @@ menu "Networking"
 	source "package/daq/Config.in"
 	source "package/daq3/Config.in"
 	source "package/davici/Config.in"
+	source "package/dht/Config.in"
 	source "package/enet/Config.in"
 	source "package/filemq/Config.in"
 	source "package/flickcurl/Config.in"
diff --git a/package/dht/0001-cmake.patch b/package/dht/0001-cmake.patch
new file mode 100644
index 0000000000..bbac639044
--- /dev/null
+++ b/package/dht/0001-cmake.patch
@@ -0,0 +1,67 @@
+From 25e12bb39eea3d433602de6390796fec8a8f3620 Mon Sep 17 00:00:00 2001
+From: Mike Gelfand <mikedld@mikedld.com>
+Date: Sun, 1 Jan 2017 16:23:21 +0300
+Subject: [PATCH] Remove Makefile, add Makefile.am and CMakeLists.txt
+
+Downloaded from transmission repo:
+https://github.com/transmission/dht/commit/25e12bb39eea3d433602de6390796fec8a8f3620
+
+Upstream status: rejected (https://github.com/jech/dht/pull/19)
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ CMakeLists.txt |  9 +++++++++
+ Makefile       |  9 ---------
+ Makefile.am    | 11 +++++++++++
+ 3 files changed, 20 insertions(+), 9 deletions(-)
+ create mode 100644 CMakeLists.txt
+ delete mode 100644 Makefile
+ create mode 100644 Makefile.am
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+new file mode 100644
+index 0000000..6d4aa99
+--- /dev/null
++++ b/CMakeLists.txt
+@@ -0,0 +1,9 @@
++cmake_minimum_required(VERSION 2.8)
++project(dht C)
++
++add_library(${PROJECT_NAME} STATIC
++    dht.c
++)
++
++install(TARGETS ${PROJECT_NAME} DESTINATION lib)
++install(FILES dht.h DESTINATION include/dht)
+diff --git a/Makefile b/Makefile
+deleted file mode 100644
+index e012945..0000000
+--- a/Makefile
++++ /dev/null
+@@ -1,9 +0,0 @@
+-CFLAGS = -g -Wall
+-LDLIBS = -lcrypt
+-
+-dht-example: dht-example.o dht.o
+-
+-all: dht-example
+-
+-clean:
+-	-rm -f dht-example dht-example.o dht-example.id dht.o *~ core
+diff --git a/Makefile.am b/Makefile.am
+new file mode 100644
+index 0000000..2dba648
+--- /dev/null
++++ b/Makefile.am
+@@ -0,0 +1,11 @@
++AM_CFLAGS = @PTHREAD_CFLAGS@
++
++noinst_LIBRARIES = libdht.a
++libdht_a_SOURCES = dht.c
++libdht_a_DEPENDENCIES = $(builddir)/include/dht
++noinst_HEADERS = dht.h
++EXTRA_DIST = CHANGES CMakeLists.txt dht-example.c LICENCE README
++
++$(builddir)/include/dht:
++	$(MKDIR_P) $(builddir)/include
++	(cd $(builddir)/include && $(LN_S) $(abs_srcdir) dht)
diff --git a/package/dht/Config.in b/package/dht/Config.in
new file mode 100644
index 0000000000..7660295c8d
--- /dev/null
+++ b/package/dht/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DHT
+	bool "dht"
+	help
+	  BitTorrent DHT library
+
+	  https://www.irif.fr/~jch/software/bittorrent
diff --git a/package/dht/dht.hash b/package/dht/dht.hash
new file mode 100644
index 0000000000..0f5d5c1758
--- /dev/null
+++ b/package/dht/dht.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  3873d54b786cf74090672ed6f786b82510ae375d5a8d8f4d99314e358d898baa  dht-0.26.tar.gz
+sha256  06ce07293caf8c8ddfaf47797ad1fb18d1c040a8375231d8f8a6105cef51a8e6  LICENCE
diff --git a/package/dht/dht.mk b/package/dht/dht.mk
new file mode 100644
index 0000000000..0fa4ed9e6a
--- /dev/null
+++ b/package/dht/dht.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# dht
+#
+################################################################################
+
+DHT_VERSION = 0.26
+DHT_SITE = $(call github,jech,dht,dht-$(DHT_VERSION))
+DHT_LICENSE = MIT
+DHT_LICENSE_FILES = LICENCE
+DHT_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
