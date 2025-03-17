Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9787CC282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 09:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305A760A5C;
	Mon, 17 Mar 2025 09:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rqYFw10xYWb6; Mon, 17 Mar 2025 09:06:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 122AC60A55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 122AC60A55;
	Mon, 17 Mar 2025 09:06:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3452FD5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 09:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C08812B6
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 09:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1oWZV_EdTEE for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 09:06:38 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 25055812A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25055812A5
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25055812A5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 09:06:37 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 4F114BDE10A5;
 Mon, 17 Mar 2025 10:06:33 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
	Andreas Ziegler <br015@umbiko.net>
Date: Mon, 17 Mar 2025 10:06:18 +0100
Message-ID: <20250317090618.403247-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250315103547.1083333-2-br015@umbiko.net>
References: <20250315103547.1083333-2-br015@umbiko.net>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1742202394; bh=jlEWKU7qAjWrqbRBWmS3w7Br4Y097Hh3vOQt/FqGwqE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=r3WvQCV6toW3fqPLDjLDF4oOxv+KnwpC1gaA/CalpSX21JpxiRpfPPD4dKjcrW8FZ
 9UXoj3Q+gd1SIN+FVztK5UjyeJmVE7Yt5YO6GcsDgHoa9seZaIFEBauVOVQGTDD0jO
 H/p7cAjN0qwBbvt5htO2eu/pgJNgkCPL9WONHVW8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=r3WvQCV6
Subject: [Buildroot] [PATCH v2 1/1] package/mpd: update version to 0.24
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Require C++20, drop dependency on boost, require new minimum versions for 
tools and libraries:

package        mpd-0.24 buildroot
  gcc          12       12.4.0
  meson         1.0      1.7.0
  alsa-lib      1.1      1.2.13
  ffmpeg        4.0      6.1.2
  libfmt        9       11.0.2
  libmpdclient  2.15     2.22
  libnfs        4.0      5.0.3
  libsoxr       0.1.2    0.1.3

The GenParseName tool compiled and run on the build machine now needs 
host-gcc 10, because the parsed structure uses constexpr (P1143R2). [1][2]

Due to the introduction of openat2 system calls (available since Linux
kernel 5.6), MPD now has a minimum kernel header requirement. [3][4]

Release note: https://musicpd.org/news/2025/03/mpd-0-24-released/
Change log: https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS

$ utils/check-package package/mpd/*
919 lines processed
0 warnings generated

$ gcc --version
gcc (Ubuntu 10.5.0-4ubuntu2) 10.5.0

$ mkdir ~/output
$ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
$ utils/test-pkg -a -c ~/output/mpd.config -d ~/output -p mpd
                             arm-aarch64 [ 1/40]: SKIPPED
                   bootlin-aarch64-glibc [ 2/40]: SKIPPED
               bootlin-arcle-hs38-uclibc [ 3/40]: SKIPPED
                    bootlin-armv5-uclibc [ 4/40]: SKIPPED
                     bootlin-armv7-glibc [ 5/40]: OK
                   bootlin-armv7m-uclibc [ 6/40]: SKIPPED
                      bootlin-armv7-musl [ 7/40]: SKIPPED
                bootlin-m68k-5208-uclibc [ 8/40]: SKIPPED
               bootlin-m68k-68040-uclibc [ 9/40]: SKIPPED
             bootlin-microblazeel-uclibc [10/40]: SKIPPED
                bootlin-mipsel32r6-glibc [11/40]: SKIPPED
                   bootlin-mipsel-uclibc [12/40]: SKIPPED
                 bootlin-openrisc-uclibc [13/40]: SKIPPED
        bootlin-powerpc64le-power8-glibc [14/40]: SKIPPED
           bootlin-powerpc-e500mc-uclibc [15/40]: SKIPPED
                   bootlin-riscv32-glibc [16/40]: OK
                   bootlin-riscv64-glibc [17/40]: OK
                    bootlin-riscv64-musl [18/40]: SKIPPED
                 bootlin-s390x-z13-glibc [19/40]: OK
                      bootlin-sh4-uclibc [20/40]: SKIPPED
                   bootlin-sparc64-glibc [21/40]: SKIPPED
                    bootlin-sparc-uclibc [22/40]: SKIPPED
                    bootlin-x86-64-glibc [23/40]: OK
                     bootlin-x86-64-musl [24/40]: SKIPPED
                   bootlin-x86-64-uclibc [25/40]: SKIPPED
                   bootlin-x86-i686-musl [26/40]: SKIPPED
                   bootlin-xtensa-uclibc [27/40]: SKIPPED
                            br-arm-basic [28/40]: SKIPPED
                    br-arm-full-nothread [29/40]: SKIPPED
                      br-arm-full-static [30/40]: SKIPPED
                   br-i386-pentium4-full [31/40]: SKIPPED
                      br-mips64-n64-full [32/40]: SKIPPED
                 br-mips64r6-el-hf-glibc [33/40]: SKIPPED
               br-powerpc-603e-basic-cpp [34/40]: SKIPPED
               br-powerpc64-power7-glibc [35/40]: SKIPPED
                       linaro-aarch64-be [36/40]: SKIPPED
                          linaro-aarch64 [37/40]: SKIPPED
                              linaro-arm [38/40]: SKIPPED
                         sourcery-mips64 [39/40]: SKIPPED
                           sourcery-mips [40/40]: SKIPPED
40 builds, 35 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

[1] https://github.com/MusicPlayerDaemon/MPD/blob/master/src/tag/Names.cxx#L9
[2] https://gcc.gnu.org/projects/cxx-status.html#cxx20
[3] https://github.com/MusicPlayerDaemon/MPD/commit/dda85e0
[4] https://man7.org/linux/man-pages/man2/openat2.2.html

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
Changes v1 -> v2:
 - keep & update host-gcc dependency
 - add host-gcc information

 ...son.build-add-atomic-dependency-for-spar.patch |  6 +++++-
 package/mpd/Config.in                             | 15 ++++++++-------
 package/mpd/mpd.hash                              |  2 +-
 package/mpd/mpd.mk                                |  6 +++---
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
index 28a82da30a..9ebf7d09d9 100644
--- a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
+++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
@@ -13,6 +13,10 @@ Upstream: not sent (the same kind of patch for ncmpc was
 refused: https://github.com/MusicPlayerDaemon/ncmpc/pull/45)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Andreas: adapt upstream formatting]
+Signed-off-by: Andreas Ziegler <br015@umbiko.net>
+---
+Rebase for mpd-0.24
+
 Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 ---
  src/event/meson.build | 4 ++++
@@ -22,7 +26,7 @@ diff --git a/src/event/meson.build b/src/event/meson.build
 index bc13bbcd2..88370c03a 100644
 --- a/src/event/meson.build
 +++ b/src/event/meson.build
-@@ -47,9 +47,13 @@ event = declare_dependency(
+@@ -46,9 +46,13 @@
    ],
  )
  
diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 03ceaa1e00..6bf745b30b 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -1,13 +1,13 @@
 menuconfig BR2_PACKAGE_MPD
 	bool "mpd"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR # boost
+	depends on BR2_USE_WCHAR # libfmt
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
-	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
-	select BR2_PACKAGE_BOOST
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_12 # C++20 recommended
+	depends on BR2_HOST_GCC_AT_LEAST_10 # C++20 constinit P4311R2
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6 # openat2.h
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
@@ -433,10 +433,11 @@ config BR2_PACKAGE_MPD_ID3TAG
 
 endif
 
-comment "mpd needs a toolchain w/ C++, threads, wchar, gcc >= 8, host gcc >= 8"
+comment "mpd needs a toolchain w/ C++, threads, wchar, host-gcc 10, gcc 12, headers 5.6"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
-		!BR2_HOST_GCC_AT_LEAST_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_12 || \
+		!BR2_THOST_GCC_AT_LEAST_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_6
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index ce6d63addf..a8d2b31b3e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a86f4fe811695743b08db82a9f1a840b8918bb4f46b06f48aa1d8d1b5386dff2  mpd-0.23.17.tar.xz
+sha256  1c828a290816d540fb2dec90f78044b55ff5ef8b49dd47a639ac34e3e5226bc5  mpd-0.24.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index b0935d5184..0f5c07ae71 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).17
+MPD_VERSION_MAJOR = 0.24
+MPD_VERSION = $(MPD_VERSION_MAJOR)
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
-MPD_DEPENDENCIES = host-pkgconf boost fmt
+MPD_DEPENDENCIES = host-pkgconf fmt
 MPD_LICENSE = GPL-2.0+
 MPD_LICENSE_FILES = COPYING
 # these refer to the FreeBSD PPP daemon
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
