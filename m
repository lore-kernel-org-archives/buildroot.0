Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F77C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B6796112D
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B6796112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562B14278B;
	Sat, 28 Aug 2021 08:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRDFADpMgAVg; Sat, 28 Aug 2021 08:40:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E9342823;
	Sat, 28 Aug 2021 08:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D894D1BF30A
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C712861675
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mwKiiXe1JqWR for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 08:40:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F9F606E5
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:40:08 +0000 (UTC)
Received: from fwd22.aul.t-online.de (fwd22.aul.t-online.de [172.20.26.127])
 by mailout10.t-online.de (Postfix) with SMTP id 1531D1B693
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:40:06 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (S8pUPEZEQhWNu5t6mnCVZrssyi8+-DEVu8c3n50eGATajNxZfNZRci5toO+CWnMwNn@[79.214.206.166])
 by fwd22.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mJtsg-4JMlHc0; Sat, 28 Aug 2021 10:40:02 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:37696)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mJtsg-0002pD-1u
 for buildroot@buildroot.org; Sat, 28 Aug 2021 10:40:02 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 10:40:00 +0200
Message-Id: <20210828084001.673394-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828084001.673394-1-bernd.kuhls@t-online.de>
References: <20210828084001.673394-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-ID: S8pUPEZEQhWNu5t6mnCVZrssyi8+-DEVu8c3n50eGATajNxZfNZRci5toO+CWnMwNn
X-TOI-EXPURGATEID: 150726::1630140002-0000454D-F87B9A17/0/0 CLEAN NORMAL
X-TOI-MSGID: ef05ce49-66d8-450f-8117-c2176ee9d726
Subject: [Buildroot] [PATCH/next 2/3] package/kodi-pvr-nextpvr: bump version
 to 8.2.7-Matrix
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

Changelog:
https://github.com/kodi-pvr/pvr.nextpvr/blob/Matrix/pvr.nextpvr/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash | 2 +-
 package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
index 898b7a3941..0b818a2631 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0aa1239e5cbee28da8c2f29ed043ef644621c5478fc1db08c700fea971c80873  kodi-pvr-nextpvr-8.2.6-Matrix.tar.gz
+sha256  6572956013a792971c76ae8da489988c2f99d59c775c246f0d7b3808661ddfc3  kodi-pvr-nextpvr-8.2.7-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
index f00d5b3804..f1b7bcd5c4 100644
--- a/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
+++ b/package/kodi-pvr-nextpvr/kodi-pvr-nextpvr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_NEXTPVR_VERSION = 8.2.6-Matrix
+KODI_PVR_NEXTPVR_VERSION = 8.2.7-Matrix
 KODI_PVR_NEXTPVR_SITE = $(call github,kodi-pvr,pvr.nextpvr,$(KODI_PVR_NEXTPVR_VERSION))
 KODI_PVR_NEXTPVR_LICENSE = GPL-2.0+
 KODI_PVR_NEXTPVR_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
