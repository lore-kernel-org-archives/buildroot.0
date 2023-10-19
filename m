Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D79CDB482
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 07:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E63BF4249D;
	Thu, 19 Oct 2023 07:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E63BF4249D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BiH-iSVCZh-t; Thu, 19 Oct 2023 07:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4D4F4249E;
	Thu, 19 Oct 2023 07:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4D4F4249E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B001BF5EA
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A79783A4A
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 07:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A79783A4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qjg_5XrD6ea6 for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 07:15:53 +0000 (UTC)
X-Greylist: delayed 1085 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 19 Oct 2023 07:15:52 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1AFE83A49
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D1AFE83A49
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 07:15:52 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 736E4BDE0AE6;
 Thu, 19 Oct 2023 08:57:44 +0200 (CEST)
From: Andreas Ziegler <br015@umbiko.net>
To: buildroot@buildroot.org
Date: Thu, 19 Oct 2023 08:57:15 +0200
Message-Id: <20231019065715.1892348-1-br015@umbiko.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.10 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1697698664; bh=qSTinrvfCjfNjk+HAZJi1G0dUEWCbJ0X2VePypjN/Mk=;
 h=From:To:Cc:Subject:Date;
 b=5oChCy4m1mkSXSue4emRZ3Qgg2M92wLKKfpCvbWfeGJx/m9BE156wXsMK//aBKP6m
 wA+M8WFsowXKge27dbhYJ6TKRTzo8is8yJZxDW0GdZE0i3JMRe7PkbogL+o+HbdJxV
 Nr+JayaQQDT0OOy8NWDowkL273Vcb7LUFSWu+z70=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=5oChCy4m
Subject: [Buildroot] [PATCH] package/mpd: update to version 0.23.14
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

Bug fixes in decoder (flac, mad), mixer (wasapi),
libfmt, systemd detection

Change log:
	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.14/NEWS

Tested on:
	i386 (build, run)
	x86_64 (build)
	Aarch64 (build, run)

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 8683b02e3b..4ee4967556 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a96b01e6fbbb7e8ab25eb7c15d5c811c62eb19b76d143a802f51674791f1d519  mpd-0.23.13.tar.xz
+sha256  85b9a67426d528ae9fb849eb3b10faf52d4b18d22b1fd71088e6d9a388b509d2  mpd-0.23.14.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index f03a459b8c..4dbd7a6d1d 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.23
-MPD_VERSION = $(MPD_VERSION_MAJOR).13
+MPD_VERSION = $(MPD_VERSION_MAJOR).14
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf boost fmt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
