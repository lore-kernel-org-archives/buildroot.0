Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A7C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BC65408FB;
	Mon, 13 Jul 2026 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BaoiVb-JRIpw; Mon, 13 Jul 2026 15:29:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C101D408C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783956590;
	bh=u0kMDGM40eLR0AdKO28dqc+80MSy65cnc0Yoyu4NOm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=l2nz92qtPVXbRmFJORoMHYOJfJN2oc3v//c0CoOOVjYAOlZ9xyZ8a1rmDUvy/wcn9
	 Cs3gr39hxTSPw7NsZzf32RMqaohI3GSsf2kmgAggsc9nHyqGHQYm1dEqgSZ84A+KhQ
	 O00hMOyv5/SNUpw0DzG14o/BRNLDe9cm3Ye36Xeil30E9NtGCFknTvX8bXANbNEWj+
	 H+4n0kqanJky7kzUyhKejkIIu0XBw9rf8rrdlK4iNr0rM4M/Dvn78TspnRSVHx6WqS
	 286qmFUOD4QOVgOHgevR7urFL/H0FEag4DwfBmC5gJ1MT92ibG8142LSC9JfaZmi/C
	 D2+RxJy1ZfdLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C101D408C6;
	Mon, 13 Jul 2026 15:29:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86E8328D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7865A6061B
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f7uxHIvjDVRo for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE9956086A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE9956086A
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:29:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C1FB887D6; Mon, 13 Jul 2026 15:29:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 17:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90e5e3383a4593996e1b688a0b540c3d1956898
X-Git-Newrev: 07ee6534146c4db4ff1ed098bbd75d89a47f9a83
X-Patchwork-Hint: ignore
Message-Id: <20260713152914.7C1FB887D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/07ee6534146c4db4ff1ed098bbd75d89a47f9a83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 0.24.13 change log:

* configuration
  - add range checks to number parser
  - copy replay_gain_mode when creating a new partition
* storage
  - curl: eliminate auth probe requests
* decoder
  - opus: do not add 5 dB to Opus header playback gain
* tags:
  - id3: limit ID3 tags to 4 MB
* output
  - pipewire: fix file descriptor leak bug after connect failure
  - pipewire: support the "media.album" tag
* systemd: allow AF_NETLINK when UPnP is enabled

In addition, the fix for fmt 12.2.0 is also included in this release
(https://github.com/MusicPlayerDaemon/MPD/commit/88d5b52).

Fixes:
../src/net/ToString.cxx: In function 'std::string ToString(SocketAddress)':
../src/net/ToString.cxx:80:37: error: 'format' is not a member of 'fmt'
   80 |                         return fmt::format("[{}]:{}", host, serv);
      |                                     ^~~~~~

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 1c02e0fe20..4d3d63215b 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  14223ca883c35fbf711994bcf745726cecc9d898e3d3964265cf3a2c7519a360  mpd-0.24.12.tar.xz
+sha256  9f215a081cc1f7c98fcccc6620f4cb705b14ba2d87fd99e062dd0804e2e3d96e  mpd-0.24.13.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 65cd390ff9..3e820c3053 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).12
+MPD_VERSION = $(MPD_VERSION_MAJOR).13
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
