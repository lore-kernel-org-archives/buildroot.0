Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625ABC636CC
	for <buildroot@archiver.kernel.org>; Mon, 13 Feb 2023 09:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1A45405C5;
	Mon, 13 Feb 2023 09:26:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A45405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDRT28QYmMsv; Mon, 13 Feb 2023 09:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC82405BA;
	Mon, 13 Feb 2023 09:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC82405BA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDC1F1BF3E8
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 09:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97B65402B5
 for <buildroot@lists.busybox.net>; Mon, 13 Feb 2023 09:26:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97B65402B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WT766qTC42qt for <buildroot@lists.busybox.net>;
 Mon, 13 Feb 2023 09:26:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59F204024E
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59F204024E
 for <buildroot@buildroot.org>; Mon, 13 Feb 2023 09:26:41 +0000 (UTC)
Received: from iago.. (rm-19-42-195.service.infuturo.it [151.19.42.195])
 by serv15.avernis.de (Postfix) with ESMTPSA id D4405BDE0DC9;
 Mon, 13 Feb 2023 10:26:34 +0100 (CET)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Mon, 13 Feb 2023 10:26:11 +0100
Message-Id: <20230213092611.86858-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1676280395; bh=YzHeTQx+iZnpIluUx3QG1ESTgYyQ6Aoo1EOAmzA4wFg=;
 h=From:To:Cc:Subject:Date;
 b=rkX/9Olv1OJ1AjrI0AowITLdZ4KbbY+UDg8wLz0D1YK6N3vdXFNHmqvSLusoZTvTQ
 /9ErNyJxOMvKMv/LwrrZ3ouOKLRSJGaeEbmj5PX3sPwIIgUlqgop6a3U6pAT/CMXuj
 VYk9JX0jiPy94hFyzXO4+QKTSVI9HxmuIRcZ52G4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=rkX/9Olv
Subject: [Buildroot] [PATCH] package/mpd: update to version 0.23.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Andreas Ziegler <br015@umbiko.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

List of changes:
	decoder::mad: fix integer underflow with very small files
	input::curl: require CURL 7.55.0 or later
	output::pipewire: adjust to PipeWire 0.3.64 API change
	tags:: fix crash bug due to race condition
	fix build failures with GCC 13

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.12/NEWS

Commit:
	https://github.com/MusicPlayerDaemon/MPD/commit/b1422fb

Tested on:
	i386 (build)
	x86_64 (build, run)
	Aarch64 (build)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 8c488d0357..2521238f64 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  edb4e7a8f9dff238b5610f9e2461940ea98c727a5462fafb1cdf836304dfdca9  mpd-0.23.11.tar.xz
+sha256  b7fca62284ecc25a681ea6a07abc49200af5353be42cb5a31e3173be9d8702e7  mpd-0.23.12.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 449600eda2..6c25c9b46f 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).11
+MPD_VERSION = $(MPD_VERSION_MAJOR).12
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
