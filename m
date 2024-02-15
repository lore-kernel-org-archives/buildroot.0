Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D913C48BC3
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 01:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9DB980DAD;
	Thu, 15 Feb 2024 01:34:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vKdFVnOgry9G; Thu, 15 Feb 2024 01:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B971180C14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B971180C14;
	Thu, 15 Feb 2024 01:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A1591BF947
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 01:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6021C41B57
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 01:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1qxmypPAhUdD for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 01:34:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6029F41B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6029F41B4F
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6029F41B4F
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 01:34:27 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so363561b3a.3
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 17:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707960866; x=1708565666;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Ey351MMEobad2SNm23RQ/vPLcUqtu4L6ZZGBqafAX4=;
 b=TA134WWjBl+O72AyswJcu6DqraJ4Xi3vVjz4cjtNYlKBVwvpqCkjItReKGe1afYlPi
 O9UPQX89RF0lK5ND3cj9oqrMoOVd5pUsp5FlA0kKT2llWTbqqrahab00buLz7LZ8fX0N
 8TzuEVJkafoN9ILIsjrQaV6rrBsRwGaBukr4QyKaVxmYiMpkM7E9vrN4uw81guHDHpkZ
 u9ldK6fVunEQ7D54cIS5NcpzdyQLbOkU5au+becQmazUySBzmMyv7pVdTtIP0hIxDcPw
 uk029urnW3F8EBPGYvru8v4jqhaUgQbAeU0yoz5ab8S0s7N0MpI3vVctEVTuxz+tM1A3
 M9FA==
X-Gm-Message-State: AOJu0YxbRGsjWV7I+a/jPejHDOY8Pnhw7M5fIHDkotYel94XEX0PPz/v
 XqAtGT90ugymccnDGi8jAIDUSDDiPd6R3ettVPmmdB3L1uDi1q3CxsohbWpv3N4=
X-Google-Smtp-Source: AGHT+IEYUA5nfCTlxUHIVsO13TRZDd8LMu2OudQg8oiRB3AJH/XcAf+Do8sh0NK8rDs4CgXrSQWkqQ==
X-Received: by 2002:a05:6a00:26d4:b0:6e0:f47b:a5e1 with SMTP id
 p20-20020a056a0026d400b006e0f47ba5e1mr527014pfw.20.1707960865952; 
 Wed, 14 Feb 2024 17:34:25 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006e06aaf5e58sm103409pfe.34.2024.02.14.17.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 17:34:25 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 14 Feb 2024 17:32:22 -0800
Message-Id: <20240215013222.2312466-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707960866; x=1708565666; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Ey351MMEobad2SNm23RQ/vPLcUqtu4L6ZZGBqafAX4=;
 b=LElVPG1nzuSES2QA2VbNPajeFykn+XwUZZ90/58inoT0WckorGqHxDIsu6PTczM5W3
 oA9618liflA0DPc4mL7/IYNp8SFeuyh9k6PhwErH4dpyB8EiOK6GKkuzb71qG8/FNVG1
 e3jWI3aNDoISPI3gu0/KOhHEE3hiKuEuyPi3pxvZ/rZLE7sBTpGlpkJ6/ORSmOnfxRGN
 ws6gesEiMNI9DfDDC5EXGKqJbnkoRxrBeMmHZZAs4V3Gdkhn68UsYhmNnAszIs7xMpau
 Bb/rWh5BfoN30rnGyqsWwUdztKPCfgOQGH75vvWT+FMwlpUQELtfU9h5C87X+iSMZcKZ
 3hbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LElVPG1n
Subject: [Buildroot] [PATCH 1/1] package/{tzdata, zic}: bump version to 2024a
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes - https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/tzdata/tzdata.hash | 4 ++--
 package/tzdata/tzdata.mk   | 2 +-
 package/zic/zic.hash       | 4 ++--
 package/zic/zic.mk         | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
index 5488625ddd..d353bc4410 100644
--- a/package/tzdata/tzdata.hash
+++ b/package/tzdata/tzdata.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
-sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
+sha512  1f09f1b2327cc9e1afc7e9045e83ee3377918dafe1bee2f282b6991828d03b3c70a4d3a17f9207dfb1361bb25bc214a8922a756e84fa114e9ba476226db57236  tzdata2024a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/tzdata/tzdata.mk b/package/tzdata/tzdata.mk
index 33e296d7d7..e367205277 100644
--- a/package/tzdata/tzdata.mk
+++ b/package/tzdata/tzdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TZDATA_VERSION = 2023c
+TZDATA_VERSION = 2024a
 TZDATA_SOURCE = tzdata$(TZDATA_VERSION).tar.gz
 TZDATA_SITE = https://www.iana.org/time-zones/repository/releases
 TZDATA_SELINUX_MODULES = tzdata
diff --git a/package/zic/zic.hash b/package/zic/zic.hash
index a2720a27ba..80c96ed793 100644
--- a/package/zic/zic.hash
+++ b/package/zic/zic.hash
@@ -1,4 +1,4 @@
-# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
-sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
+# From https://mm.icann.org/pipermail/tz-announce/2024-February/000081.html
+sha512  46da8bfa762c7d109db93e5c060789097fc0e1e38bdad5bb8fec886ef47f138bd03b913a743cd5f7e23dc359a72bfd63e7ffc0de199d2b51e6a174361dbdc43c  tzcode2024a.tar.gz
 # Locally computed:
 sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
diff --git a/package/zic/zic.mk b/package/zic/zic.mk
index a915f6d256..95fa1eaa96 100644
--- a/package/zic/zic.mk
+++ b/package/zic/zic.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZIC_VERSION = 2023c
+ZIC_VERSION = 2024a
 ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
 ZIC_SITE = https://www.iana.org/time-zones/repository/releases
 ZIC_STRIP_COMPONENTS = 0
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
