Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18786C0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 13:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B426D4B007;
	Sat,  1 Feb 2025 13:51:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31R1HYvVlfvh; Sat,  1 Feb 2025 13:51:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A9D4A5F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A9D4A5F2;
	Sat,  1 Feb 2025 13:51:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5AFE16E
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0FD147415
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5qhLAmThGH7 for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 13:51:30 +0000 (UTC)
X-Greylist: delayed 391 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 01 Feb 2025 13:51:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA83D4A5F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA83D4A5F2
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA83D4A5F2
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 13:51:29 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 77571BDE411B;
 Sat,  1 Feb 2025 14:44:52 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Sat,  1 Feb 2025 14:44:25 +0100
Message-ID: <20250201134425.1786294-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1738417492; bh=e7Z5vtPOs6q0nHngmRZ0rbWV/gd2umgXU/Yz1zJDm0k=;
 h=From:To:Cc:Subject:Date;
 b=ZGSTDNNxPi3tq0DckKX+yYGFoVvGi9XLtI/gtxE3bipp02Z8HVoj5/rVwKvqBlr4x
 4UsCuwMF//NgmHajKSiFo+8AguPQXOJdWbQuWirHHTgf61SQmtDTOJEP3pxnKq4Ilt
 qFwmZDNJqf1ZjOP3jx5o9G/Z1KvrKjECrgVuby/w=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=ZGSTDNNx
Subject: [Buildroot] [PATCH 1/1] package/mpd: update version to 0.23.17
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

Version 0.23.17 change log: 

* protocol
  - "albumart" tries to send larger chunks if available
  - explicitly disallow "idle" and "noidle" in command lists
* storage
  - nfs: require libnfs 4.0 or later
* database
  - inotify: trigger update after symlink was created
* decoder
  - ffmpeg: prefer over sndfile and audiofile for its DTS-WAV support
* support libfmt 11.1

$ utils/check-package package/mpd/*
914 lines processed
0 warnings generated
$ utils/test-pkg -p mpd
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                             arm-aarch64 [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index c18a80a9d0..ce6d63addf 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  9668e36df80de485683c962d02845bf314d8a08e6141af7afeff76401e32b2c1  mpd-0.23.16.tar.xz
+sha256  a86f4fe811695743b08db82a9f1a840b8918bb4f46b06f48aa1d8d1b5386dff2  mpd-0.23.17.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index fd528aaa87..b0935d5184 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).16
+MPD_VERSION = $(MPD_VERSION_MAJOR).17
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
