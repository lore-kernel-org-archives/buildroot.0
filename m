Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B656DCCF9EA
	for <buildroot@archiver.kernel.org>; Tue, 28 Oct 2025 05:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A17D6848EB;
	Tue, 28 Oct 2025 05:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m69GyoSgF71m; Tue, 28 Oct 2025 05:58:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3F1848E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3F1848E2;
	Tue, 28 Oct 2025 05:58:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8D5F43F
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 05:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF58940B37
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 05:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7DS5IWPhlxXW for <buildroot@buildroot.org>;
 Tue, 28 Oct 2025 05:58:42 +0000 (UTC)
X-Greylist: delayed 515 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 28 Oct 2025 05:58:41 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73195407CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73195407CE
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73195407CE
 for <buildroot@buildroot.org>; Tue, 28 Oct 2025 05:58:41 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 746FFBDE15D3;
 Tue, 28 Oct 2025 06:49:59 +0100 (CET)
From: Andreas Ziegler <br025@umbiko.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>
Date: Tue, 28 Oct 2025 06:49:28 +0100
Message-ID: <20251028054928.60012-1-br025@umbiko.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1761630599; bh=w2mZTuvXL9MzbL7Yfp62RzYF4dcmo5lb9yWRu4fK8SQ=;
 h=From:To:Cc:Subject:Date;
 b=tB/xOlPUZb+hdWpV9vx+vAErs1oSQSKxmqhas+GfDDZiW9nfdJEr8NGrWZPOprBM2
 HpFTZtUEC7A3eLt2jmVdfiEHmM3IK6VpK+OIAhOI0xuC8tXbFbYqolN3Uctpi733Yf
 WQIfDWlAstp5+SdqU5CXkVDCs7MOIRPYMX9CV9Ak=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=tB/xOlPU
Subject: [Buildroot] [PATCH 1/1] package/mpd: update to version 0.24.6
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

Version 0.24.6 change log: 

* decoder
  - ffmpeg: handle "*.opus" files
  - mpg123: another workaround for libmpg123 ID3 corruption bug
  - opus: fix seeking in files with large OpusTags
  - opus, vorbis: remove METADATA_BLOCK_PICTURE size limit

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
---

Tested on:
  i386      build, run
  x86_64    build
  aarch64   build, run

Tested-by: Andreas Ziegler <br025@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 4c2db47823..de385da77e 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  69dfcba5c99c8d828d8f35dfb31eb0a4e34ce3813f54666af4d8247558160a13  mpd-0.24.5.tar.xz
+sha256  8ce34a010577feb42999a96d867325c6d38bf7ae1b7a57f878d7e548c1fd1fa9  mpd-0.24.6.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index c04408054e..ff6f08ba65 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).5
+MPD_VERSION = $(MPD_VERSION_MAJOR).6
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
