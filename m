Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2ADC282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D369570A7F;
	Fri, 28 Feb 2025 17:14:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et9NJFICMTLz; Fri, 28 Feb 2025 17:14:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DED670BA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DED670BA9;
	Fri, 28 Feb 2025 17:14:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 073A068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7375742F1E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lN4FhjHLxBin for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E37A843127
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E37A843127
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC74F7FEAC; Fri, 28 Feb 2025 16:30:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 12:36:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c39f677e6a7142394bb2713181bca69b768e9f9e
X-Git-Newrev: 5e5241e1cfc05b3521e663c30365cc7afe9bb9e5
X-Patchwork-Hint: ignore
Message-Id: <20250228163033.DC74F7FEAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/w_scan: drop package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e5241e1cfc05b3521e663c30365cc7afe9bb9e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes http://autobuild.buildroot.net/results/da054694f0056027e83e77a1cedff5659885f2ca/

The upstream location is gone (taken over by a domain squatter), there are
no reverse dependencies, it is not listed in DEVELOPERS and hasn't been
updated since 2017 with commit 0762015f144f ("package/w_scan: bump version
to 20170107"), so drop it.

It looks to be superseded by a C++ version at
https://www.gen2vdr.de/wirbel/w_scan_cpp/index2.html, which can be added if
there is interest.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  2 --
 Config.in.legacy                                   |  7 ++++
 package/Config.in                                  |  1 -
 package/w_scan/0001-musl.patch                     | 26 ---------------
 .../0002-si_types-h-fix-build-with-gcc-10.patch    | 37 ----------------------
 package/w_scan/Config.in                           | 14 --------
 package/w_scan/w_scan.hash                         |  3 --
 package/w_scan/w_scan.mk                           | 18 -----------
 8 files changed, 7 insertions(+), 101 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 194a2d1c72..6b45fb9e94 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1261,8 +1261,6 @@ package/vte/0002-build-Fix-check-for-fstack-protector-compiler-support.patch lib
 package/vtun/0001-fix-installation.patch lib_patch.Upstream
 package/vtun/0002-fix-ssl-headers-checks.patch lib_patch.Upstream
 package/vtun/0003-openssl11.patch lib_patch.Upstream
-package/w_scan/0001-musl.patch lib_patch.Upstream
-package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/waffle/0001-cmake-forward-cflags-from-.pc-files-to-waffle-cflags.patch lib_patch.Upstream
 package/waffle/0002-wayland-fix-build-against-version-1-20.patch lib_patch.Upstream
 package/waffle/0003-drop-C-dependency.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index fbabe784ba..2cb7cbd51f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_W_SCAN
+	bool "w_scan has been removed"
+	select BR2_LEGACY
+	help
+	  The w_scan package was removed as it is not maintained
+	  anymore and the upstream URL is gone.
+
 config BR2_PACKAGE_GENROMFS
 	bool "genromfs"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index da88832d37..0759a9df47 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -656,7 +656,6 @@ endmenu
 	source "package/usbip/Config.in"
 	source "package/usbmount/Config.in"
 	source "package/usbutils/Config.in"
-	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
 	source "package/wilc-driver/Config.in"
 	source "package/wipe/Config.in"
diff --git a/package/w_scan/0001-musl.patch b/package/w_scan/0001-musl.patch
deleted file mode 100644
index 46d67677a8..0000000000
--- a/package/w_scan/0001-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix musl build
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr w_scan-20141122.org/descriptors.h w_scan-20141122/descriptors.h
---- w_scan-20141122.org/descriptors.h	2014-11-22 09:49:26.000000000 +0100
-+++ w_scan-20141122/descriptors.h	2016-01-24 14:05:21.000000000 +0100
-@@ -28,6 +28,7 @@
- #ifndef __DESCRIPTORS_H__
- #define __DESCRIPTORS_H__
- 
-+#include <time.h>
- #include "extended_frontend.h"
- 
- /******************************************************************************
-diff -uNr w_scan-20141122.org/version.h w_scan-20141122/version.h
---- w_scan-20141122.org/version.h	2014-11-22 11:59:56.000000000 +0100
-+++ w_scan-20141122/version.h	2016-01-24 14:06:33.000000000 +0100
-@@ -1,6 +1,6 @@
- /* AUTOMATICALLY GENERATED - DO NOT EDIT MANUALLY */
- #ifndef W_SCAN_VERSION_H
- #define W_SCAN_VERSION_H
--uint version=20170107;
-+unsigned int version=20170107;
- #endif
- 
diff --git a/package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch b/package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch
deleted file mode 100644
index 50d2488190..0000000000
--- a/package/w_scan/0002-si_types-h-fix-build-with-gcc-10.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-si_types.h: fix build with gcc 10
-
-Drop service_t, p_service_t, transponder_t and p_transponder_t to avoid
-the following build failure with gcc 10 (which defaults to -fno-common):
-
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/bin/arm-buildroot-linux-gnueabihf-gcc -Wall -Wextra -Wno-comment -Wswitch-default -Wno-unused-parameter -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -lrt  -o w_scan atsc_psip_section.o countries.o descriptors.o diseqc.o dump-dvbscan.o dump-vdr.o dump-xine.o dump-mplayer.o dump-vlc-m3u.o dvbscan.o lnb.o parse-dvbscan.o satellites.o scan.o section.o tools.o emulate.o dump-xml.o iconv_codes.o char-coding.o  
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: descriptors.o:(.bss+0x404): multiple definition of `p_transponder_t'; countries.o:(.bss+0x0): first defined here
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: descriptors.o:(.bss+0x408): multiple definition of `transponder_t'; countries.o:(.bss+0x4): first defined here
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: descriptors.o:(.bss+0x480): multiple definition of `p_service_t'; countries.o:(.bss+0x7c): first defined here
-/home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.2.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: descriptors.o:(.bss+0x484): multiple definition of `service_t'; countries.o:(.bss+0x80): first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/5640442cb4ba06bcbcf31540a64f5665862d39f7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
-diff -Nura w_scan-20170107.orig/si_types.h w_scan-20170107/si_types.h
---- w_scan-20170107.orig/si_types.h	2020-09-20 11:09:56.776963441 +0200
-+++ w_scan-20170107/si_types.h	2020-09-20 11:13:13.149232478 +0200
-@@ -114,7 +114,7 @@
-   uint32_t logical_channel_number;
-   uint8_t  running;
-   void   * priv;
--} service_t, * p_service_t;
-+};
- 
- /*******************************************************************************
- /* transponder type.
-@@ -201,7 +201,7 @@
-   /*----------------------------*/
-   char * network_name;
-   network_change_t network_change;
--} __attribute__((packed))  transponder_t, * p_transponder_t;
-+} __attribute__((packed));
- 
- /*******************************************************************************
- /* satellite channel routing type.
diff --git a/package/w_scan/Config.in b/package/w_scan/Config.in
deleted file mode 100644
index d5471200ad..0000000000
--- a/package/w_scan/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-comment "w_scan needs a toolchain w/ headers >= 3.7"
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-
-config BR2_PACKAGE_W_SCAN
-	bool "w_scan"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  w_scan is a small command line utility used to perform
-	  frequency scans for DVB and ATSC transmissions. It is
-	  capable of creating channels.conf files (in different output
-	  formats !) as well as initial tuning data for scan.
-
-	  https://www.gen2vdr.de/wirbel/w_scan/index2.html
diff --git a/package/w_scan/w_scan.hash b/package/w_scan/w_scan.hash
deleted file mode 100644
index fcb0e611bc..0000000000
--- a/package/w_scan/w_scan.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  38e0f38a7bf06cff6d6ea01652ad4ee60da2cb0e937360468f936da785b46ffe  w_scan-20170107.tar.bz2
-sha256  ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/w_scan/w_scan.mk b/package/w_scan/w_scan.mk
deleted file mode 100644
index c63f20cc9e..0000000000
--- a/package/w_scan/w_scan.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# w_scan
-#
-################################################################################
-
-W_SCAN_VERSION = 20170107
-W_SCAN_SOURCE = w_scan-$(W_SCAN_VERSION).tar.bz2
-W_SCAN_SITE = http://wirbel.htpc-forum.de/w_scan
-W_SCAN_LICENSE = GPL-2.0+
-W_SCAN_LICENSE_FILES = COPYING
-
-ifeq ($(BR2_PACKAGE_LIBICONV),y)
-W_SCAN_DEPENDENCIES += libiconv
-W_SCAN_CONF_ENV += LIBS=-liconv
-endif
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
