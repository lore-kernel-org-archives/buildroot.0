Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3203CDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 13:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 436D5813DA;
	Sun, 15 Oct 2023 13:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 436D5813DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pf9hroRER18S; Sun, 15 Oct 2023 13:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9181081376;
	Sun, 15 Oct 2023 13:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9181081376
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E23FA1BF841
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 13:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB41A81376
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 13:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB41A81376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2CuAh3eCXLKa for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 13:55:39 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AE458136A
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 13:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AE458136A
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so36396655e9.1
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697378137; x=1697982937;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RCQSYNGxn20rYto7nRttt1plLk/Kl/lVO0Zz/dksszI=;
 b=X/eYxfEvhAkoVGoWhW0Y9OIWB8vvEZOAnJcwDtG9FhQt4fgPLoBDr7Eu76kqrrbwXm
 +5GoZWRj692gdSQenKRNcENKeGEqrRchCRRkHmZJU474cByWH63h/OTIP74A8+Tcpqfi
 IqpMgxHH1UOjbuSlhjX1hN+04/EFdEgLIjCOACKAJLucjQzaVjZh8xmSMyB19ZJRdEbw
 1AxokpV0TMq1hLIGP2MhAue5GZJ6wcmswEroNK1e2doZMDuzdZexWFsJk/nMjrQYod4n
 aAGM9di2Na07wuNVX8GHxfiDZ+Ff65ffiARhHAbYm955fx3QdgitLItFKqmGBcDQziqI
 dYDw==
X-Gm-Message-State: AOJu0Yx5oPEUTYUJXHz0e4vL3cWZprQxYZltejSh7JBTRNQlit7K1Zzb
 M8i09Y1OOuzk5qgXYchBUJuwB/nyszk=
X-Google-Smtp-Source: AGHT+IERUFk6Ao8krSuh0/vDk1RM+XYr96NVzDNbfs7XOTZZywePDQ07D75Y8qoDBSBZfSEBpL3vPw==
X-Received: by 2002:a7b:ca54:0:b0:405:3885:490a with SMTP id
 m20-20020a7bca54000000b004053885490amr27682884wml.0.1697378136723; 
 Sun, 15 Oct 2023 06:55:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b0040472ad9a3dsm4582261wmq.14.2023.10.15.06.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 06:55:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 15:55:32 +0200
Message-ID: <20231015135532.540647-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697378137; x=1697982937; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RCQSYNGxn20rYto7nRttt1plLk/Kl/lVO0Zz/dksszI=;
 b=SVmWhEZGqTKhn2MfixHxEIn1WQ329E+isR+yKUsrNZJi1aJhTQk9ZxFTGOhwcOV9d5
 4v/pXohtOqwz7iZgSE0YU4aj50PTo8WOdrwVuWXJIxp9qafXblmLnXPOfZLwiG6KjGfQ
 FPFZLeYA0k+Ekt1IrtytDFv2n8oNNrWnmQN4PVCy798Q3zJQVgctE87GKOZZ4KZghnvV
 xEhKDhcwX6VJIhuncp+CcpWdNT3PcooF8VcYtf/oY6qJvzzbnIL5OY4G/aJB6FeY1rkc
 NpH2b1wRG3H+kvt5EK3vASFGm80nRvGSM6BUzO/47UxH4HPMJBCQgxiq/uh06KdD2mwT
 h8Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SVmWhEZG
Subject: [Buildroot] [PATCH 1/1] package/librsync: bump to version 2.3.4
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

https://github.com/librsync/librsync/blob/v2.3.4/NEWS.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/librsync/librsync.hash | 2 +-
 package/librsync/librsync.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/librsync/librsync.hash b/package/librsync/librsync.hash
index c8ca61e516..7fc7395a49 100644
--- a/package/librsync/librsync.hash
+++ b/package/librsync/librsync.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ef8ce23df38d5076d25510baa2cabedffbe0af460d887d86c2413a1c2b0c676f  librsync-2.3.2.tar.gz
+sha256  a0dedf9fff66d8e29e7c25d23c1f42beda2089fb4eac1b36e6acd8a29edfbd1f  librsync-2.3.4.tar.gz
 sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 97f5c607b0..1465963c61 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRSYNC_VERSION = 2.3.2
+LIBRSYNC_VERSION = 2.3.4
 LIBRSYNC_SITE = https://github.com/librsync/librsync/releases/download/v$(LIBRSYNC_VERSION)
 LIBRSYNC_LICENSE = LGPL-2.1+
 LIBRSYNC_LICENSE_FILES = COPYING
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
