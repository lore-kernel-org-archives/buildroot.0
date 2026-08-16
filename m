Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2D6C5DF6A
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 07:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 173CE606B4;
	Sun, 16 Aug 2026 07:50:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmtK0yrPPZg4; Sun, 16 Aug 2026 07:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 700AF6061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786866598;
	bh=7Wi4xSO+AOtkaNT1MUZ4CdmiJyE4TgqfaIbDz0dvCes=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d8gmXz32RgB4RcioyT3rmIbAlkvnWpsyyBaq9CB2J4jJLpOJW2pxvZLJY02mgAln4
	 d3l3pEPTtx2pAfddj8BJvCfiUAxzgMhpHbc865YqzPGJObhPFjjHPvVzIQT13fe3PW
	 cxr53MRxPKDdmhMZpcO28kIY66yzV1GlA7iCmeXuLgnnhAB8dvxDCa94zDQrbyOzW+
	 IysIjeed9NDtJMrg2HlZz/ToItrt70kdOfogazBDKMyTDPBq8X1LXrIo/7B38rt85R
	 Sie2OI4Em6xZhSpjubllfqALUIDutNFbdt2JjDfwkXjLVbmAZyDHPT7K6FFW47Z9f6
	 6Df/HuecPi2jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 700AF6061A;
	Sun, 16 Aug 2026 07:49:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA239334
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7AAC80E60
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvNYWzND4mKI for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 07:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE65A80E5F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE65A80E5F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 07:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADA238DA1A; Sun, 16 Aug 2026 07:49:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 09:31:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e389f1b44c54660c7bb5512207a561e684b41595
X-Git-Newrev: 9b2f111a10f75f01ab9d2dbb9b7a80a3266b0abf
X-Patchwork-Hint: ignore
Message-Id: <20260816074905.ADA238DA1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update version to 0.24.14
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b2f111a10f75f01ab9d2dbb9b7a80a3266b0abf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 0.24.14 change log:

* storage
  - curl: bound WebDAV PROPFIND responses
* storage
  - nfs: work around libnfs memory leak
  - nfs: fix use-after-free bug after timeout
  - nfs: fix assertion failures
  - nfs: stop after 256k directory entries
* input
  - qobuz: use HTTPS for API requests
* decoder
  - dsdiff: fix tag parser
  - dsdiff: store audio format in database
  - dsdiff: reject overflowing chunk offsets
  - mad: limit ID3 tags to 4 MB
  - mad: ignore implausible Xing frame counts
  - modplug, openmpt: fix error handling bug
* output
  - alsa: remove logging calls from the real-time thread
  - alsa: remove option "thesycon_dsd_workaround"
  - alsa: fix corruption bug with "stop_dsd_silence"
  - osx: fix format selection bugs
  - osx: fix volume truncation
  - pipewire: remove logging calls from the real-time thread
  - pipewire: fix uninitialized variable
  - pipewire: fix thread-safety bugs
  - pipewire: fix deadlock bug
  - pipewire: fix ring buffer corruption bug
* Linux
  - support Zeroconf with systemd socket activation
* Windows
  - enable the "mpg123" decoder plugin
  - fix shutdown in console mode
  - fix last-modified check during database update

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 4d3d63215b..bf9ed653fd 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  9f215a081cc1f7c98fcccc6620f4cb705b14ba2d87fd99e062dd0804e2e3d96e  mpd-0.24.13.tar.xz
+sha256  367e85debb4427605cccb5415f2858ebb401d849a80615553f59520f4640811e  mpd-0.24.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 3e820c3053..d063d509f4 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
