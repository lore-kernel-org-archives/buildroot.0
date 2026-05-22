Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6BECD5BAC
	for <buildroot@archiver.kernel.org>; Fri, 22 May 2026 20:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F3085634;
	Fri, 22 May 2026 20:04:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cIBYMbsNqH1; Fri, 22 May 2026 20:04:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4D1885635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779480279;
	bh=KFmkqSJN9PBqaVI1w8FodPUqQAXD75PfvlfVOOUCLbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Nmew/YpXejVx8SvMpR+AEwiy+5onWEfacOPf2FC2Lc2jGLTUK29nDuFcbZFt1Kwkt
	 rpzGto5vdcA2XEA3CfbA0cfeuYxU9pzKCMfZOzuD6dYQPZ7pRs79cCT7V16zgR+Tmi
	 zKDSa8bZFMseWkrFbN1BxtrB4Wr8ikUd6vptpxIRSRL0zvuBzu1R7gSGec+PSDiJKb
	 Xcs7AHInhNPKUgMy8AHvrjUJ8jvjPL+Ls1f6OAB2bsPHL6+s9c8byB9GEj++9UsMav
	 bin+fICq0dY5n6XOxBWvHongG80t4QaSNR8h4HPIQc5kAVWvhQ9XIyygIKnTg364+u
	 Qe1NbG59tf4QQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4D1885635;
	Fri, 22 May 2026 20:04:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB731265
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C33261C0B
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbOmZGh3Zi36 for <buildroot@buildroot.org>;
 Fri, 22 May 2026 20:04:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9B6E61BA4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9B6E61BA4
 for <buildroot@buildroot.org>; Fri, 22 May 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC0D86C3A; Fri, 22 May 2026 20:04:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 May 2026 21:50:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b0b0c6c10471443bf75637ccf6d528177babdf
X-Git-Newrev: 9d6949b1b145d82c43423e62c777e11667ce754e
X-Patchwork-Hint: ignore
Message-Id: <20260522200428.AEC0D86C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update version to 0.24.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9d6949b1b145d82c43423e62c777e11667ce754e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Bug fix of bug fix. Changes from version 0.24.10 -> 0.24.12:

* protocol
  - fix path traversal bug
  - allow empty URI in "lsinfo", "add" etc. (0.24.11 regression)
* playlist: do not allow newlines in song URIs
* input
  - curl: require version 7.85.0
* decoder
  - pcm: fix stack buffer overflow
  - sidplay: fall back to SIDLiteBuilder if ReSIDfpBuilder is unavailable

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index e3e2cde023..1c02e0fe20 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  867f10fd83cde20c240617222b38fbf6885f902015d0da424a28fbafc675e1dd  mpd-0.24.10.tar.xz
+sha256  14223ca883c35fbf711994bcf745726cecc9d898e3d3964265cf3a2c7519a360  mpd-0.24.12.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index eb40f0ccc3..e94858897a 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).10
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
