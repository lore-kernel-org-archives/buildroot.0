Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90144C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:40:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E11A60ED4
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E11A60ED4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8FA480DCE;
	Sun, 29 Aug 2021 11:40:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ng1zdYWmAskV; Sun, 29 Aug 2021 11:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C98B80F2F;
	Sun, 29 Aug 2021 11:39:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B54301BF2EA
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A558580F2F
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 11:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dxt5lP09XdAB for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 11:39:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 035E780DCE
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 11:39:51 +0000 (UTC)
Received: from fwd38.aul.t-online.de (fwd38.aul.t-online.de [172.20.26.138])
 by mailout12.t-online.de (Postfix) with SMTP id 9BC3F1E48F
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 13:39:27 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (r9pAKQZbghDkTzEjITqo3G+rO76qJG5dWKU+XMwN7b5Nvts8v1kS9vmuO0tAV8zQsz@[84.161.184.41])
 by fwd38.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mKJ9g-0sAMIy0; Sun, 29 Aug 2021 13:39:16 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:43748)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mKJ9f-0003p8-VR
 for buildroot@buildroot.org; Sun, 29 Aug 2021 13:39:16 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 13:39:13 +0200
Message-Id: <20210829113915.19781-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: r9pAKQZbghDkTzEjITqo3G+rO76qJG5dWKU+XMwN7b5Nvts8v1kS9vmuO0tAV8zQsz
X-TOI-EXPURGATEID: 150726::1630237156-00010279-DD47B865/0/0 CLEAN NORMAL
X-TOI-MSGID: 58e46991-152c-4cac-b6ef-c5c0a6fd85b5
Subject: [Buildroot] [PATCH/next 1/3] package/kodi-pvr-filmon: bump version
 to 6.1.3-Matrix
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
https://github.com/kodi-pvr/pvr.filmon/blob/Matrix/pvr.filmon/changelog.txt

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-filmon/kodi-pvr-filmon.hash | 2 +-
 package/kodi-pvr-filmon/kodi-pvr-filmon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
index b771212a3d..3043adf34c 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3ede4930bce246f15cdc4a063086327c28c412b923d0c1030e2fd3ba8a63e138  kodi-pvr-filmon-6.1.2-Matrix.tar.gz
+sha256  e8cf22398e2ab2da9873dc84a3fa5fcc27c7726adfedd813ebdd9b8d41066fec  kodi-pvr-filmon-6.1.3-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
index 976db3fbe2..14c7d2262b 100644
--- a/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
+++ b/package/kodi-pvr-filmon/kodi-pvr-filmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_FILMON_VERSION = 6.1.2-Matrix
+KODI_PVR_FILMON_VERSION = 6.1.3-Matrix
 KODI_PVR_FILMON_SITE = $(call github,kodi-pvr,pvr.filmon,$(KODI_PVR_FILMON_VERSION))
 KODI_PVR_FILMON_LICENSE = GPL-2.0+
 KODI_PVR_FILMON_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
