Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1EAC369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 19:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B259980C5F;
	Mon, 14 Apr 2025 19:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpcme8mIxyTc; Mon, 14 Apr 2025 19:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B153380F5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B153380F5C;
	Mon, 14 Apr 2025 19:02:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5501205
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C644B80F5C
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:02:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zD6LoS_CV8dn for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 19:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7E2B80C5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E2B80C5F
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 19:02:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B223D846C5; Mon, 14 Apr 2025 19:02:17 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Apr 2025 20:59:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76b4fd159bcdba97eefdbc4299a7ae9b0a4cd423
X-Git-Newrev: b1ebc686d316a0ab3eaebc50880a6e420afbe220
X-Patchwork-Hint: ignore
Message-Id: <20250414190217.B223D846C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.3
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b1ebc686d316a0ab3eaebc50880a6e420afbe220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
[Julien:
 - remove test logs from commit log
 - add the removed config entry in Config.in.legacy
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy      |  6 ++++++
 package/mpd/Config.in |  9 +--------
 package/mpd/mpd.hash  |  2 +-
 package/mpd/mpd.mk    | 16 +++++-----------
 4 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 298476f495..79f7a33a23 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.05"
 
+config BR2_PACKAGE_MPD_SOUNDCLOUD
+	bool "mpd soundcloud support has been removed"
+	select BR2_LEGACY
+	help
+	  MPD SoundCloud support has been removed.
+
 # BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT is still referenced in docker-engine
 config BR2_PACKAGE_DOCKER_ENGINE_DOCKER_INIT
 	bool "docker-engine init support is now a choice"
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
