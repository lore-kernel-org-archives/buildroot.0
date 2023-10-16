Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE54ECDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 20:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50E55400F9;
	Mon, 16 Oct 2023 20:40:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E55400F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B13pxenqtbn8; Mon, 16 Oct 2023 20:40:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CCEE40A8B;
	Mon, 16 Oct 2023 20:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CCEE40A8B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 950A01BF34A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DCB740888
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DCB740888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qJ_BCsAXsod for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 20:40:45 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07DA140554
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07DA140554
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4060b623e64so31103835e9.0
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 13:40:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697488843; x=1698093643;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DTmmAU0Ta7zVVd5oqWdhaAIQbsPVEI0DxPSTyRGfG3A=;
 b=pPj6rLgePm+a0jeNjzF+WxbzZkQX05NgjeBaO4DK2cHLRVxopbhsJY/+b5JoATcdwA
 zksGnXalFxZ6HnPWH9aPqiJjWHi7VxQshS3lgBswB2X4AlQX3oVljmtxP7oxVU1jjODv
 6IoyeweFy7RTxHUtr83aiCOtX4CYFQi/b/KhwxcEnFsZYE3fYc1exNSbnh0/TH2Glabp
 guoUxGru6WiGT7FFOb+kbK1J9vSJFrQfIQ+AN8naW19wrRFSRqa8i4AFmgw98e8nrE4N
 jtY/V3z5U951/Jxf6xuekQQF8oTO7YNlgbz3y18aph5U+N10HR8P9oWXj3sunyrBlRvY
 8EzA==
X-Gm-Message-State: AOJu0YwUFwv3+4sd8Te6w+x5t/uqHd/qwDPGOcCnGmdEnL0zIDMz93i6
 GkJimrb/66jK4+9kv3F68Zu2kWHTd7A=
X-Google-Smtp-Source: AGHT+IEt2IMqai6RbHfcZmAtCkGa27VF9zZWlbjB2w7JgTGBlRrU+HjQ/SwAVYrjvpgeXDk352Z38g==
X-Received: by 2002:a05:600c:45d1:b0:405:19dd:ad82 with SMTP id
 s17-20020a05600c45d100b0040519ddad82mr343357wmo.16.1697488842544; 
 Mon, 16 Oct 2023 13:40:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l4-20020a05600c4f0400b00405959469afsm78219wmq.3.2023.10.16.13.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 13:40:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 22:40:39 +0200
Message-ID: <20231016204039.4191-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697488843; x=1698093643; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DTmmAU0Ta7zVVd5oqWdhaAIQbsPVEI0DxPSTyRGfG3A=;
 b=hyHQm9u8dF8/hpamaLSnfxH7CQ2d17nM2J+p7j0+uzJzsIvk44ObQ91euqwqMOgLvE
 S4IGrDOkUjPaGhQYxMUxcVV2UEblxg8DcSAi1GTILQ8QvxEC3w4TP6KIPZIqd2NJylXM
 ZszIz3mbtGLMF2BXSAbfMmQGVEws/+pTw2vLJ33is+O8wPy4JfoJdxBP52GL/AolLIIN
 xFXxSY6P65AchPkk8yOPh1IkeMqWqGCoIscgafd+xWG19GW/LsYCQ52fHtC2Zdw+7red
 Z3ecmxLpSysdq4HN/PbNfhOlGK26vsaal1F9M/dD7d6Y6umB750r487qt0SwFReuuFQ9
 9P8A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hyHQm9u8
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.18
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pupnp/pupnp/blob/release-1.14.18/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index fcb231cff6..6fd4678c0d 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  025d7aee1ac5ca8f0bd99cb58b83fcfca0efab0c5c9c1d48f72667fe40788a4e  libupnp-1.14.13.tar.bz2
+sha256  16a7cee93ce2868ae63ab1a8164dc7de43577c59983b9f61293a310d6888dceb  libupnp-1.14.18.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 8c6ae005a0..f8551a2a0d 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.13
+LIBUPNP_VERSION = 1.14.18
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
