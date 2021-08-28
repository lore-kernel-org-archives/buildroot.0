Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD863C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8718461104
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8718461104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DEE742823;
	Sat, 28 Aug 2021 08:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Xut4yEN9w5X; Sat, 28 Aug 2021 08:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D26114282E;
	Sat, 28 Aug 2021 08:40:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD2E41BF957
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7CD840641
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 08:40:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYyHpmmd48pf for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 08:40:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AFEA404F3
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 08:40:08 +0000 (UTC)
Received: from fwd06.aul.t-online.de (fwd06.aul.t-online.de [172.20.26.150])
 by mailout10.t-online.de (Postfix) with SMTP id 9B8921B68D
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 10:40:05 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (Z6+3cwZJ8hsZp2lWjq9lFsgNANY8WazHPeoVBprh4XWfK5zZ9Bu+AV8qUD1gE0fwyH@[79.214.206.166])
 by fwd06.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mJtsg-0y2i6i0; Sat, 28 Aug 2021 10:40:02 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:37696)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mJtsg-0002pD-9K
 for buildroot@buildroot.org; Sat, 28 Aug 2021 10:40:02 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 10:40:01 +0200
Message-Id: <20210828084001.673394-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210828084001.673394-1-bernd.kuhls@t-online.de>
References: <20210828084001.673394-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-ID: Z6+3cwZJ8hsZp2lWjq9lFsgNANY8WazHPeoVBprh4XWfK5zZ9Bu+AV8qUD1gE0fwyH
X-TOI-EXPURGATEID: 150726::1630140002-00000C85-D4695E81/0/0 CLEAN NORMAL
X-TOI-MSGID: 424257d7-554c-4da3-8ddb-5bbbb4fc2c99
Subject: [Buildroot] [PATCH/next 3/3] package/kodi-pvr-zattoo: bump version
 to 19.7.10-Matrix
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
https://github.com/rbuehlma/pvr.zattoo/releases/tag/19.7.10-Matrix

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 138ad19b88..ac4960df92 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0dee5802592aa1fd53c3835e373b2c49bdc3121575273bf2a0c8ebf1a40bd2c  kodi-pvr-zattoo-19.7.9-Matrix.tar.gz
+sha256  8cc02c4627b5108e39bb7b6a6f56f7ba5debbb1adf982c4f23395944aa7d2c8e  kodi-pvr-zattoo-19.7.10-Matrix.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 554fd3946f..7a3b230e8b 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 19.7.9-Matrix
+KODI_PVR_ZATTOO_VERSION = 19.7.10-Matrix
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
