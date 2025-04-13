Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14398C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 11:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97B2F60C2E;
	Sun, 13 Apr 2025 11:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6C8mX0Vlqxi; Sun, 13 Apr 2025 11:29:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B5CF60B14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B5CF60B14;
	Sun, 13 Apr 2025 11:29:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3564D4
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D981F408D9
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGMNV5MFNFCw for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 11:29:05 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2257C40822
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2257C40822
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2257C40822
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 11:29:03 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 3B121BDE457F;
 Sun, 13 Apr 2025 13:28:59 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Sun, 13 Apr 2025 13:28:36 +0200
Message-ID: <20250413112836.789291-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1744543739; bh=p8m6lFohrFnjdMPmJ6F5OB8Yg4F275Rfa2+z9p0ektE=;
 h=From:To:Cc:Subject:Date;
 b=jTQgOiTPI0u8V5FJsObK/Ilfi4XNoI6nI1jlvwuHypnhUrJ/+hmu7/Ox3Qwc1M4SN
 ZebZ9SfU+0mFgnAMtLGaY8q/gVVBuPDxezX9V0I7h6GanziQ4hiiITFeE62tdw2kuR
 v8Vm9JSY/3vjye13MHDHD8BJ4HUe9+htxBMDNv64=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=jTQgOiTP
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.3
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

Since version 0.24.0, support for SoundCloud was removed and
yajl replaced with with json-for-modern-cpp. 

Consolidated list of changes:

* decoder
  - ffmpeg: support WMA
  - mpg123: fix trailing space in tag values
  - flac: enable chained Ogg decoding
* input
  - qobuz: use nlohmann_json instead of yajl
  - io_uring: fix stuck seek after I/O error
  - curl: fix malformed "Range" header
* log: include year in time stamp
* output
  - oss: fix error "Resource temporarily unavailable"
  - shout: fix hang on activating shout output
  - snapcast: use nlohmann_json instead of yajl to generate JSON tags
  - sndio: fix rounding error in volume calculation
* player
  - fix stalled playback after queue modification
  - fix deadlock with "single" mode
* playlist
  - soundcloud: remove defunct plugin
* tags
  - libid3tag: fix Meson subproject configure error
  - libid3tag: add missing zlib dependency to Meson subproject
  - fix build failure in the "id3tag" Meson subproject
* Linux
  - allow using io_uring on Linux kernels older than 6.0
  - fix build failure with ancient kernel headers
  - add configure-time check for openat2()
  - fix use-after-free bug on io_uring shutdown
* DSD: support channel conversion

Change log: 
  https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.3/NEWS

$ utils/check-package package/mpd/*
906 lines processed
0 warnings generated
$ utils/check-symbols
(no output)

$ rm -fr ~/output/
$ mkdir ~/output
$ echo "BR2_PACKAGE_MPD=y" > ~/output/mpd.config
$ echo "BR2_PACKAGE_MPD_QOBUZ=y" >> ~/output/mpd.config
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

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/Config.in |  9 +--------
 package/mpd/mpd.hash  |  2 +-
 package/mpd/mpd.mk    | 16 +++++-----------
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 7ce0d8b7eb..48b8c914fa 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -48,17 +48,10 @@ config BR2_PACKAGE_MPD_QOBUZ
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	select BR2_PACKAGE_MPD_CURL
 	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_YAJL
+	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
 	help
 	  Play songs from the commercial streaming service Qobuz.
 
-config BR2_PACKAGE_MPD_SOUNDCLOUD
-	bool "soundcloud"
-	select BR2_PACKAGE_MPD_CURL
-	select BR2_PACKAGE_YAJL
-	help
-	  Enable soundcloud.com playlist support.
-
 comment "Converter plugins"
 
 config BR2_PACKAGE_MPD_LIBSAMPLERATE
diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index a8d2b31b3e..ef13e27033 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  1c828a290816d540fb2dec90f78044b55ff5ef8b49dd47a639ac34e3e5226bc5  mpd-0.24.tar.xz
+sha256  4225680e068b2ad87e3c2de414ec3209758de93d671f89fa3bae90b70af478a2  mpd-0.24.3.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 0f5c07ae71..6cae2845e3 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR)
+MPD_VERSION = $(MPD_VERSION_MAJOR).3
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
@@ -44,11 +44,11 @@ else
 MPD_CONF_OPTS += -Dicu=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_YAJL),y)
-MPD_DEPENDENCIES += yajl
-MPD_CONF_OPTS += -Dyajl=enabled
+ifeq ($(BR2_PACKAGE_JSON_FOR_MODERN_CPP),y)
+MPD_DEPENDENCIES += json-for-modern-cpp
+MPD_CONF_OPTS += -Dnlohmann_json=enabled
 else
-MPD_CONF_OPTS += -Dyajl=disabled
+MPD_CONF_OPTS += -Dnlohmann_json=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_MPD_ALSA),y)
@@ -285,12 +285,6 @@ else
 MPD_CONF_OPTS += -Dsidplay=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_MPD_SOUNDCLOUD),y)
-MPD_CONF_OPTS += -Dsoundcloud=enabled
-else
-MPD_CONF_OPTS += -Dsoundcloud=disabled
-endif
-
 ifeq ($(BR2_PACKAGE_MPD_SQLITE),y)
 MPD_DEPENDENCIES += sqlite
 MPD_CONF_OPTS += -Dsqlite=enabled
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
