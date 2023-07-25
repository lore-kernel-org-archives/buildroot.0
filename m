Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02C0C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 14:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 772E4817F5;
	Tue, 25 Jul 2023 14:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772E4817F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4easyl5oxaI; Tue, 25 Jul 2023 14:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E9981433;
	Tue, 25 Jul 2023 14:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E9981433
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D4CA1BF588
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1445181433
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 14:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1445181433
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3LWviR28i-2W for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 14:25:44 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E93A81415
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 14:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E93A81415
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7835e5fa459so210305039f.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 07:25:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690295143; x=1690899943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=smTpjIQH4SliM7M/C94PqurcYwmN9DyAzw0FQTEXILw=;
 b=hBHtCACewg+RGj6jKXJGXlqf81Hg46fnwJPR+UKNdjF0fi2x7rXOfsRsyvlUASyZuu
 w03uAY6srSJ5RdtWOWYd7zN3aCknShZGVUNTPbqXDZ3T4TV2v8KmJneBNcKJNJDqRqDO
 7mfI0DmdV+9DyZ2Sqw5Xxc9DboQ735UJHYIN2554U62Oz4k7uPK1uPbHAKZ5TDMv5pJN
 7OBnlnVun3uQwDLRh7P5oOjHNH7lZt7uXvYq9NMa/lPVbCglHZ7ZWABemCb0HOYHGkMj
 5SUnInmAEyn6Pvuu6UgL7G+8gpFDJ9af+NZBvWlABdl6o4D+3DHB4yE4ktbQVUYyI9JZ
 hMdA==
X-Gm-Message-State: ABy/qLaKldgX2Ij+aiK/usxBjWPDo+rt7z03AcHWsIU77034Qkw8B9JL
 /S5X8sY5+fxfehpIfkyzG0Ly6ALSUDo=
X-Google-Smtp-Source: APBJJlGcRdECDS5x0iXbaJdElNx2u7U1038N/P+GnZFyq2EvpmbIGEPx2kbLgqDvtu2VOi9VR6IFyg==
X-Received: by 2002:a05:6e02:66f:b0:348:cd93:8c85 with SMTP id
 l15-20020a056e02066f00b00348cd938c85mr2788679ilt.9.1690295142778; 
 Tue, 25 Jul 2023 07:25:42 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 r16-20020a92d450000000b00345cce526cdsm3750008ilm.54.2023.07.25.07.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 07:25:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 08:25:40 -0600
Message-Id: <20230725142540.321108-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690295143; x=1690899943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=smTpjIQH4SliM7M/C94PqurcYwmN9DyAzw0FQTEXILw=;
 b=dBGBKEh8fQ3zaeO5CaJa/vY8rOSGhv4vJEnmzAqxmXIKS6xfU2aIgaNMYo400L/3sw
 su8mPIRr+nSts9ooKBwBBW8ZkXsKMtAsISoHeDSR5DW+YQ09FY0Wp+h9tYYoVksSq4Pj
 FRwaQ30baRQDeiO3TSIiHslpPQf5rW/4d1ni5we15wZqHkiyJH/rgeZZONASkHeNK8VU
 RwoLYWwPHSkfelyQIttzESQY2pUtXYjcpHZPU725ZmmWy2c+gAQpJ6+PhMmeR7NLM9eU
 qV/PwLb3gfVWfEZBRgNaGSBziXay0dpWRxYEO1IyPzFKst8Q3OGV7RFLnE2nt270ES3z
 CfRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dBGBKEh8
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 90242bb2e2..0a41a4033a 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  fadc2f3bf5872bf6310576a86c3566e0  pyparsing-3.0.9.tar.gz
-sha256  2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb  pyparsing-3.0.9.tar.gz
+md5  93b2b40f3d1ffa5c3dd795aad8f5829e  pyparsing-3.1.0.tar.gz
+sha256  edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea  pyparsing-3.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 55516c3ce8..a7d6ea30d2 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.0.9
+PYTHON_PYPARSING_VERSION = 3.1.0
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/71/22/207523d16464c40a0310d2d4d8926daffa00ac1f5b1576170a32db749636
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/4f/13/28e88033cab976721512e7741000fb0635fa078045e530a91abb25aea0c0
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
