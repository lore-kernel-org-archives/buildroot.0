Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E0AC87FD3
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 12:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7A54052B;
	Fri,  8 Aug 2025 12:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYlwiDN3VQ-x; Fri,  8 Aug 2025 12:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D8F405CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D8F405CB;
	Fri,  8 Aug 2025 12:06:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E5E5031
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 12:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC0FE405DC
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 12:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3MJ7S9sp16L for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 12:06:19 +0000 (UTC)
X-Greylist: delayed 537 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 08 Aug 2025 12:06:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43632405D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43632405D9
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43632405D9
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 12:06:18 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 9F484BDE5701;
 Fri,  8 Aug 2025 13:57:17 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br015@umbiko.net>
Date: Fri,  8 Aug 2025 13:57:03 +0200
Message-ID: <20250808115703.580212-1-br015@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1754654238; bh=0Z+qOelTI+UrPlZydoszfNU8O3bk3qKb1QFsCw3NUUY=;
 h=From:To:Cc:Subject:Date;
 b=Q624Ao7j0cVibIPW2wqu/USApO4GxvsgPQ3DtqtfY2ORS0KcGe69nXRhY36gC9Uci
 Sg42CpeKr0M3XHl2+arTSuu3HCU/ihGVuxvReb3RYCb+xY6upzozdnLVIXb3SaH5Ah
 O/f/oUQJFGiiyCnbaas//sZQEuviGYbpqUzQGTVI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=Q624Ao7j
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.5
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
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
