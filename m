Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1EBC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 14:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EAD815CD;
	Sat,  9 Aug 2025 14:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qctsx743-3C9; Sat,  9 Aug 2025 14:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AAF281319
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AAF281319;
	Sat,  9 Aug 2025 14:20:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8AF2C21B
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71B3260BC4
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpY2MDM0BQZn for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 14:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EF560BE5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7EF560BE5
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 14:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9468E86EB2; Sat,  9 Aug 2025 14:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 16:08:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab470fbc8eb1053548c3d33e807db84fd5af1445
X-Git-Newrev: 866d89dfeb93cf8067ef66db6147bdd9fe37cda0
X-Patchwork-Hint: ignore
Message-Id: <20250809142014.9468E86EB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.5
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=866d89dfeb93cf8067ef66db6147bdd9fe37cda0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.24.5 change log:

* database
  - fix disappearing playlist files
* decoder
  - ffmpeg: handle "*.aif" files
  - mpg123: add option "full_scan"
  - mpg123: support seeking on remote files
  - mpg123: work around libmpg123 ID3 corruption bug
  - sidplay: add support for PSID files
* output
  - pipewire: fix resuming playback after it was paused by "single" mode
* Windows
  - fix libfmt error "what(): invalid utf8"

Tested-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index dd3ac9782f..4c2db47823 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  86035d6c63af32afa77fd5eb5ecd1c6afaef7cc352b28064edf51eea60f40d66  mpd-0.24.4.tar.xz
+sha256  69dfcba5c99c8d828d8f35dfb31eb0a4e34ce3813f54666af4d8247558160a13  mpd-0.24.5.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index e41c03ef08..c04408054e 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).4
+MPD_VERSION = $(MPD_VERSION_MAJOR).5
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
