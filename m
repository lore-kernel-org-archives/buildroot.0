Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80917C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 18:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBFF740141;
	Sun,  4 Feb 2024 18:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBFF740141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3QjOAGDlNK18; Sun,  4 Feb 2024 18:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE94A4033F;
	Sun,  4 Feb 2024 18:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE94A4033F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3D81BF285
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 18:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 580F260739
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 18:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 580F260739
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lblnSUnSrmHk for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 18:14:41 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 227BA60737
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 18:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 227BA60737
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40fc52c2ae4so22324185e9.3
 for <buildroot@buildroot.org>; Sun, 04 Feb 2024 10:14:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707070478; x=1707675278;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8qfJce0Pg6FMwo6XSq1YVRP0VWg5Ya31Y1P89kl7fko=;
 b=oozno2+dSL+BKWtqV8L4U+/cWPvcJ/FSXVPtkgeI4L9xNM/WVtMPepZTD6cRNgXuxe
 jGGglf/QPtaNkageV16PWZills5KKaHTH2A+dO3gWdWzeons7g3qUkcU1RF/V2qWs+bj
 5dALoR4YJo2IdJ4hDbHx4sxeOSGJ5vFO+DeRBzID2J9ZD3E/mnq5bQiCyNVaCim/Ij9T
 79g9JILKS1jMtusmaI5PV8o0JgPvkFczfzofs0K2ELzZ8nYvhg/LBXyqzQzR5/1IRA1c
 zGW85oMM4rq02hj6nQxLrJVRND4j76fKHy/PdupUf0DD5xXQ3eXAwXxEFeVUiMYGWCp7
 NQgg==
X-Gm-Message-State: AOJu0YxpQpbndlFskjjn2fAF2Mx/TP9qi0sijLvUK9UcubVazPFn528E
 Gpr6JUxCs3gLRhzfGsBJ0pFMC2iEGCO0QN8s5vhiO8VQn9TM+SV/miUGESNY5bw=
X-Google-Smtp-Source: AGHT+IHU4lSgpAg8W91x5cwmweVvacYa+sKPxuDLfboTkv8nD1Rd16aHyBpYsaE1+k6Shm++TGtlmA==
X-Received: by 2002:a05:600c:4689:b0:40e:b17d:2f56 with SMTP id
 p9-20020a05600c468900b0040eb17d2f56mr2349664wmo.23.1707070478180; 
 Sun, 04 Feb 2024 10:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV9TC8rXg2AZcisebIjye5rNbtdBlgseSCiNLJdaw337Aaut7bjpCUXdu2TKCgRqHOlN56Qj9laqfJRd5iKrkCd6nwRP8dv5e/0Rw==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fm16-20020a05600c0c1000b0040ef67bd244sm6363609wmb.17.2024.02.04.10.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Feb 2024 10:14:37 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Feb 2024 19:14:35 +0100
Message-ID: <20240204181435.1657162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707070478; x=1707675278; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8qfJce0Pg6FMwo6XSq1YVRP0VWg5Ya31Y1P89kl7fko=;
 b=j8D0kfRHVzw9wZwBvbwBVV6xRY5p9ZgXvMxHFZtemj+7l9JgPikCvWJ+7mXHZMibJA
 7IJNucm0LOwOx71EbOkOuoELN8zIPA8phNH9hHS7/z6yVU9bXLDd//ZyNMoFdjShj/TB
 prjM/zjoKUvEBqkWRbEo9AOc9j4gT7skSBFL1QErnzOyx3hYMnq00cmEaeBNYA7D4gsf
 2xgZJR8/mx9irJxjpBbBGWn0r9AzlTpxkbC2WvdmCKQ/x9+K3nwBLgz9PFxoTmpmqxiC
 PJJ0QOu2IoxXDNl2qXbhXNqM/qPPpsYAOkRoEVhdhL8SnEqX19br3tAr9Wwj0FEwFgX2
 ZjiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j8D0kfRH
Subject: [Buildroot] [PATCH 1/1] package/opus: set OPUS_CPE_ID_VENDOR
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:opus-codec:opus is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/6C4EA9AB-4801-48FF-9737-A7C3B368C41B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opus/opus.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 15531b521a..cbc07a091b 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -8,6 +8,7 @@ OPUS_VERSION = 1.4
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
+OPUS_CPE_ID_VENDOR = opus-codec
 OPUS_INSTALL_STAGING = YES
 
 OPUS_CFLAGS = $(TARGET_CFLAGS)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
