Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB58C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:39:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29AC960F25
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29AC960F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E290340455;
	Sun, 29 Aug 2021 11:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gZYP9nTh5eV8; Sun, 29 Aug 2021 11:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BFE440465;
	Sun, 29 Aug 2021 11:39:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2EA31BF2EA
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F1B080DCE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6Qo8MdIYGOc for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 11:39:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3BF680EA3
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 11:39:39 +0000 (UTC)
Received: from fwd39.aul.t-online.de (fwd39.aul.t-online.de [172.20.27.138])
 by mailout06.t-online.de (Postfix) with SMTP id 5C4381AC15
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 13:39:30 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (bpIK7kZEohvXBkZvsKoAJlVDB-fRoS-4Y6BkeIDPcGPGYOXLLuAbjON1BN4SFHtZ56@[84.161.184.41])
 by fwd39.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mKJ9g-2cwZo80; Sun, 29 Aug 2021 13:39:16 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:43748)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mKJ9g-0003p8-3X
 for buildroot@buildroot.org; Sun, 29 Aug 2021 13:39:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 13:39:14 +0200
Message-Id: <20210829113915.19781-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210829113915.19781-1-bernd.kuhls@t-online.de>
References: <20210829113915.19781-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-ID: bpIK7kZEohvXBkZvsKoAJlVDB-fRoS-4Y6BkeIDPcGPGYOXLLuAbjON1BN4SFHtZ56
X-TOI-EXPURGATEID: 150726::1630237156-00003E8E-B9A23054/0/0 CLEAN NORMAL
X-TOI-MSGID: 88e46cf1-464c-4504-9104-b68efb2f5c68
Subject: [Buildroot] [PATCH/next 2/3] package/kodi-pvr-iptvsimple: bump
 version to 7.6.10-Matrix
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
https://github.com/kodi-pvr/pvr.iptvsimple/blob/Matrix/pvr.iptvsimple/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash | 2 +-
 package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
index 911837c0c6..d32719eb3a 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b968b38d09299a9784b82d3fb82f461db1544901b450e374d270dd5c2be0c6d1  kodi-pvr-iptvsimple-7.6.9-Matrix.tar.gz
+sha256  7c6a08f77f8e8ba64d4a7608a8ef7baace10eefc8d0dace1e4c7ae58776e5f94  kodi-pvr-iptvsimple-7.6.10-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
index 6785410562..4c3234cdde 100644
--- a/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
+++ b/package/kodi-pvr-iptvsimple/kodi-pvr-iptvsimple.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_IPTVSIMPLE_VERSION = 7.6.9-Matrix
+KODI_PVR_IPTVSIMPLE_VERSION = 7.6.10-Matrix
 KODI_PVR_IPTVSIMPLE_SITE = $(call github,kodi-pvr,pvr.iptvsimple,$(KODI_PVR_IPTVSIMPLE_VERSION))
 KODI_PVR_IPTVSIMPLE_LICENSE = GPL-2.0+
 KODI_PVR_IPTVSIMPLE_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
