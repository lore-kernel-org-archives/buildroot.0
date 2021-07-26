Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA71DC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AC0A60F23
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AC0A60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61EDD60752;
	Mon, 26 Jul 2021 06:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybF-GossRrss; Mon, 26 Jul 2021 06:23:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEEF8605E0;
	Mon, 26 Jul 2021 06:23:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BAC5F1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A6840433
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnXwTzkA9zwu for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:23:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1518403CD
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:23:50 +0000 (UTC)
Received: from fwd21.aul.t-online.de (fwd21.aul.t-online.de [172.20.27.66])
 by mailout02.t-online.de (Postfix) with SMTP id 7961A706AC
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:23:47 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (SrkaxTZEghAVcgSB1Ttzq6vhAqHIXnFJ3YEV7VqOzHyKGzCA7NWQzvaJj9UWSN0g4v@[91.58.13.189])
 by fwd21.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m7u1f-3WCrC40; Mon, 26 Jul 2021 08:23:43 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:38024)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1m7u1f-0003s1-8y
 for buildroot@buildroot.org; Mon, 26 Jul 2021 08:23:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:23:42 +0200
Message-Id: <20210726062343.767811-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: SrkaxTZEghAVcgSB1Ttzq6vhAqHIXnFJ3YEV7VqOzHyKGzCA7NWQzvaJj9UWSN0g4v
X-TOI-EXPURGATEID: 150726::1627280623-00002A54-EDAA205D/0/0 CLEAN NORMAL
X-TOI-MSGID: 7f4eb362-d8d1-44d2-bb95-d97e1039c1c8
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libX11: bump version to
 1.7.2
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
https://lists.x.org/archives/xorg-announce/2021-June/003092.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xlib_libX11/xlib_libX11.hash | 6 +++---
 package/x11r7/xlib_libX11/xlib_libX11.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libX11/xlib_libX11.hash b/package/x11r7/xlib_libX11/xlib_libX11.hash
index b87b2498e8..7aeef33446 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.hash
+++ b/package/x11r7/xlib_libX11/xlib_libX11.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-May/003089.html
-sha256  e64e43deaa562cbfb0d5ada64670ec09c6fac7935262dcd77bbc6d984a535d47  libX11-1.7.1.tar.bz2
-sha512  a76f0a82fce6f9b50646a7cd7ec5ee046650f225816050226068a7548fa083ef07d146d40faaf44e033c59c17b0fda5ffdee3a127dac3ab56cee02133819aa3d  libX11-1.7.1.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-June/003092.html
+sha256  1cfa35e37aaabbe4792e9bb690468efefbfbf6b147d9c69d6f90d13c3092ea6c  libX11-1.7.2.tar.bz2
+sha512  d01e5c1848c76218605e5af2d353de6b301a251555b52a38dbe930e6635d5e8a92d1486eb6d328ad5d42a5939e0d16868ffa19a75e5a7863d1a32e0d0727bdc7  libX11-1.7.2.tar.bz2
 
 # Locally computed
 sha256  2daec087a88e7c9b8082557cdeebad5bbb8155a4137472f0b22e269cd99d0c1e  COPYING
diff --git a/package/x11r7/xlib_libX11/xlib_libX11.mk b/package/x11r7/xlib_libX11/xlib_libX11.mk
index 39d9dc2cc7..aa3ebf1593 100644
--- a/package/x11r7/xlib_libX11/xlib_libX11.mk
+++ b/package/x11r7/xlib_libX11/xlib_libX11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBX11_VERSION = 1.7.1
+XLIB_LIBX11_VERSION = 1.7.2
 XLIB_LIBX11_SOURCE = libX11-$(XLIB_LIBX11_VERSION).tar.bz2
 XLIB_LIBX11_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBX11_LICENSE = MIT
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
