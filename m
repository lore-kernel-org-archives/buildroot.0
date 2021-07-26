Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55361C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C6860F38
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 06:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09C6860F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D66B640286;
	Mon, 26 Jul 2021 06:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6At2-fb3AXA; Mon, 26 Jul 2021 06:24:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3186C401C8;
	Mon, 26 Jul 2021 06:24:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BB1B51BF3A8
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA19A40433
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 06:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d3YvObIY51Ki for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 06:24:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ABA3403CD
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 06:24:15 +0000 (UTC)
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout08.t-online.de (Postfix) with SMTP id 3868230004
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:23:45 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (GolrcQZHQhYt2erEwi+Jd-8KfZ5qh4szyv8FQghpuc8RQfNEisdnGCEfCun54jtZtb@[91.58.13.189])
 by fwd39.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1m7u1g-40nPVY0; Mon, 26 Jul 2021 08:23:44 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:38024)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1m7u1f-0003s1-Ew
 for buildroot@buildroot.org; Mon, 26 Jul 2021 08:23:43 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 08:23:43 +0200
Message-Id: <20210726062343.767811-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210726062343.767811-1-bernd.kuhls@t-online.de>
References: <20210726062343.767811-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-ID: GolrcQZHQhYt2erEwi+Jd-8KfZ5qh4szyv8FQghpuc8RQfNEisdnGCEfCun54jtZtb
X-TOI-EXPURGATEID: 150726::1627280624-00003E8E-0EF2C691/0/0 CLEAN NORMAL
X-TOI-MSGID: fe52e349-ed12-4144-a7e7-cc99ea6a8b4a
Subject: [Buildroot] [PATCH 2/2] package/x11r7/xserver_xorg-server: bump
 version to 1.20.12
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
https://lists.x.org/archives/xorg-announce/2021-July/003098.html

Follow upstream switch to .xz tarballs.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 9876255c8e..167d3fa591 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-April/003081.html
-sha256  914c796e3ffabe1af48071d40ccc85e92117c97a9082ed1df29e4d64e3c34c49  xorg-server-1.20.11.tar.bz2
-sha512  1017015b9fd5d53788abe3641d877e6df8609841fa5c1847c0a5e133ddcc1b758a5d695304ebd36828099ec201a85b6b70b46f5ea4f81c5bd3a16fa6e175e3c2  xorg-server-1.20.11.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2021-July/003098.html
+sha256  336dc093431d81ecc03fa36af771f1181334f2746b7de7796f3cc6a8fa9e8cac  xorg-server-1.20.12.tar.xz
+sha512  98350c42fb1f10c965663c1c8d4b225689a6a63163d788d454aa71b28b9cc8fcf9709a932f882358a13ca0c277c0c15812d05919092b4c32828d4ed61cca0406  xorg-server-1.20.12.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index ae17dd535e..26cc1c07b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.20.11
-XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
+XSERVER_XORG_SERVER_VERSION = 1.20.12
+XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
 XSERVER_XORG_SERVER_LICENSE_FILES = COPYING
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
