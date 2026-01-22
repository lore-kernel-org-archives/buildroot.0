Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741F6D6CFA2
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 19:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45997606AF;
	Thu, 22 Jan 2026 19:21:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DL5NiXs0TwGz; Thu, 22 Jan 2026 19:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C35606BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769109685;
	bh=mJU+rQCeREd+VtHYwIRqsFKNWTPEzBSjB6nAwRAz8ak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ghEkIqcNYuL+PMU0diRzw+QGYWkgDhcTSaAoSxTvk9sma63GqOAacyAeRXHgdYt8S
	 btejYozZxNjKhHL04Zb+1JbqWoYPyBy1GaeYLFVV92KV7htLrAHQn0zJCuacSIV62R
	 1cjv4cWJsgMr7o7cxKeORl6uSAJ8QmQS1JC/Ty7gFTcaDqS/VCk/11NXngtb66BO4p
	 v++LpVUlSz5u1NTPZ5Bfy3hFOtYtVKDU1bijzZOOFUz/YWaSoQW98nDSzRn41+knq+
	 7UjS74NntbhEhvnMhUGN2phUwD3uHs8RrmpDpr0E4YPdE98Zwy2hXyaSjueCv67SYr
	 I8T+JESH0KI+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60C35606BF;
	Thu, 22 Jan 2026 19:21:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 10D844DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B1E040156
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EaFn9zp17AOp for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 19:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4502C4012B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4502C4012B
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 19:21:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D1A38753A; Thu, 22 Jan 2026 19:21:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 20:15:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04b64c8502cdb809b10ec6c01e4d408fcdca4a14
X-Git-Newrev: c1ff33e6a471ec40c0575d773b77b033aeda68f4
X-Patchwork-Hint: ignore
Message-Id: <20260122192123.3D1A38753A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1ff33e6a471ec40c0575d773b77b033aeda68f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 0.24.7 change log:

* decoder
  - ffmpeg: allow seeking only if both AVFormatContext and InputStream allow it
* playlist
  - cue: strip UTF-8 byte order marker
* Linux: disable the iowait state for io_uring
* fix GCC 16 compiler warning
* fix spurious linker failures

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index de385da77e..afdb66324c 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  8ce34a010577feb42999a96d867325c6d38bf7ae1b7a57f878d7e548c1fd1fa9  mpd-0.24.6.tar.xz
+sha256  47c4f146f39a09979ca65d232063d7df566b101c5b36ca8895083f9f278b0460  mpd-0.24.7.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index cc7bd7f0b2..f54dd58cde 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).6
+MPD_VERSION = $(MPD_VERSION_MAJOR).7
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
