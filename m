Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736D8C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:35:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CFB61050
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 06:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29CFB61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01265607B4;
	Sun,  1 Aug 2021 06:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qh64mcnhL9LM; Sun,  1 Aug 2021 06:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39BF5607B5;
	Sun,  1 Aug 2021 06:35:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 747631BF86B
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61AAE415A8
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 06:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyUDVeSjnd1n for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 06:35:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C4D64158B
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 06:35:23 +0000 (UTC)
Received: from fwd34.aul.t-online.de (fwd34.aul.t-online.de [172.20.26.145])
 by mailout05.t-online.de (Postfix) with SMTP id 5BFA27AD7
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 08:35:20 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (JJJBf+ZlrhcyhlH1vej8kW5YCg0yqBnmFTkFPdwCJ-aCa8gLiM1DwXNeWw3DFpygvW@[79.214.201.246])
 by fwd34.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mA540-0vNRiK0; Sun, 1 Aug 2021 08:35:08 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:34232)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mA53z-00059E-H0
 for buildroot@buildroot.org; Sun, 01 Aug 2021 08:35:07 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 08:35:07 +0200
Message-Id: <20210801063507.13004-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: JJJBf+ZlrhcyhlH1vej8kW5YCg0yqBnmFTkFPdwCJ-aCa8gLiM1DwXNeWw3DFpygvW
X-TOI-EXPURGATEID: 150726::1627799708-000126A7-238E3689/0/0 CLEAN NORMAL
X-TOI-MSGID: fdfa136d-506a-4fa9-835c-651b6bbcf156
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: bump
 version to 1.20.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Release notes:
https://lists.x.org/archives/xorg-announce/2021-July/003100.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 167d3fa591..8eb56ba027 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-July/003098.html
-sha256  336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac  xorg-server-1.20.12.tar.xz
-sha512  98350c42fb1f10c965663c1c8d4b225689a6a63163d788d454aa71b28b9cc8fcf9709a932f882358a13ca0c277c0c15812d05919092b4c32828d4ed61cca0406  xorg-server-1.20.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2021-July/003100.html
+sha256  40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300  xorg-server-1.20.13.tar.xz
+sha512  4e0b7bd4e070dc52cb2c51c2056feb133de2c0487d359392ed63abba9702910cd2e2983e9415973d8d6e9672eac78be6f39202687fc56610877914ce722554b3  xorg-server-1.20.13.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 26cc1c07b5..c326230be0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.12
+XSERVER_XORG_SERVER_VERSION = 1.20.13
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
