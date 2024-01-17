Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5816AC47258
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 23:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBE64615B8;
	Wed, 17 Jan 2024 23:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBE64615B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gY11im2s-_Zk; Wed, 17 Jan 2024 23:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65BAD6143E;
	Wed, 17 Jan 2024 23:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65BAD6143E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 056AB1BF36B
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 23:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8DC6403BE
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 23:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8DC6403BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BGHN69OxRCMd for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 23:46:42 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 847EB40150
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 23:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 847EB40150
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-559d0ef3fb5so1551748a12.3
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 15:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705535199; x=1706139999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t1KNgx3CWKNthx0fElopTNdJqoKgylh6gFCPLSWexrY=;
 b=eDpxLM37xSHzXq5u2pVff/2yNEZVRJu/n3zNYeDwce6IvMdQkLBnFDRTbwFout9uf/
 63ZfIHN/7idk6ncO2lxKUcxmeLd3s67MzlhtGqbeSAs8Uo9RrjYPNmN1sbRGizT9fv39
 3zlRARlXphaNekBEtTH496+QSFCZGk46iWsf1qe7R/W44hcRlDm6+xC4bjqGEBwPgkuc
 hHa6Vsl+XPgNjO+CDu7kvvSIYg81e3yXGxgj0fpVySkMo+j9ySTOEMV07+S8KKM1bE0f
 fay1hMddyMv8ch0wBtmbels5b3XdrW3ZU/AJRtgizNFqhCdFzsqz3GnKaERaN4uJPZ7E
 JkSg==
X-Gm-Message-State: AOJu0YzFWrez/ErlgqiJx7rHVY/CtFxsQlqbvgJgUTIclMLCLEgdFeDJ
 R1hHlw4V82w03mJuZ0CEEUGB7dCJQ4M=
X-Google-Smtp-Source: AGHT+IHgRTOcrnVpGqDWrFYOi8jr2/AQkn0UHlGmVhHOJVuRncB8QLyLaaVK/YHDuv8hCAktePCG0Q==
X-Received: by 2002:a17:907:bd7:b0:a1e:997a:574f with SMTP id
 ez23-20020a1709070bd700b00a1e997a574fmr4179909ejc.122.1705535199196; 
 Wed, 17 Jan 2024 15:46:39 -0800 (PST)
Received: from x230.suse.cz (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 rv4-20020a17090710c400b00a26e490e3f2sm8320468ejb.181.2024.01.17.15.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 15:46:38 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jan 2024 00:46:30 +0100
Message-ID: <20240117234630.2728809-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705535199; x=1706139999; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t1KNgx3CWKNthx0fElopTNdJqoKgylh6gFCPLSWexrY=;
 b=jc2RNnkQfuD9fat6FrAO9EgEJs0jxD0jVo+8Uq3wWj7ub6ZIUGtEsLWGIAR55MKqMN
 btGi8ISNqibtFcAPRfJwtf0FwUC4mt421HHtRVH9mK1qi0b88dAyRVzs+1cm9Rra8fBn
 HXF8h9AX7+FqRwlTyySoaVFrbJ5GMecoHcmEMJAkG17CftP08L/Ht3AEQZsUQf55ROTo
 K8qLxpFfyJfnqyZWFMauiNeWGyA9sHwbrVcMCpIF63G9HONwnfezp3RqYmqL9/O8QiID
 9jzEUYo4OrM3p9WV7a733V2VG8YkMDuGqS08tjX3AMWw6FkBSqRdEip4WjJCLG/O6yKP
 gDQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jc2RNnkQ
Subject: [Buildroot] [PATCH] package/iputils: bump release to 20240117
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Petr Vorel <petr.vorel@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/iputils/iputils.hash | 4 ++--
 package/iputils/iputils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
index c2f6a40797..a3e48d60a9 100644
--- a/package/iputils/iputils.hash
+++ b/package/iputils/iputils.hash
@@ -1,5 +1,5 @@
-# https://github.com/iputils/iputils/releases/download/20231222/sha256sums.asc
-sha256  e3ce5e1a1f795c2d520985463b90e20f9388b7060796d54ad64509aa8e4af775  iputils-20231222.tar.gz
+# https://github.com/iputils/iputils/releases/download/20240117/sha256sums.asc
+sha256  7ed46e876e4157e1d20c40ec945e1ce0f3af3b10b5f6373e423135c6f22cd116  iputils-20240117.tar.gz
 # Locally computed
 sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
 sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index bcf440ec93..58e44d673a 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPUTILS_VERSION = 20231222
+IPUTILS_VERSION = 20240117
 IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
 IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
 IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
