Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425C0CEE342
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 18:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C02E812F1;
	Wed,  9 Oct 2024 18:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZnpreJ6QM42; Wed,  9 Oct 2024 18:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F6881300
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12F6881300;
	Wed,  9 Oct 2024 18:22:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF741BF403
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A56E4013F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 18:22:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hanp-83w1hCw for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 18:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0FADF400E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FADF400E7
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FADF400E7
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 18:22:23 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3a39ffe34f8so387025ab.1
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 11:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728498143; x=1729102943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2fY7QA5G1XgLNEt0yxPF/jxPk8gMb2xBRt7KlDy/54=;
 b=aTYwwLWh49B25uKl9gUfOF+t3rm8hblB+FkJpCD2V9Hp5yZOXfkRv2NBwqKZ4AYrzm
 BcgV11I1bgurst8qZEImDZu76BBxlSRix8MvjBljJ8NXKoxWZ0gHikbyI1SZUcJeqNfd
 1gT3rvpDgc0VPHsyTZPfvRVGDsqtsfDGu7Ew95lTZiof0tEhCEtrqc88GtelUNaYSIRv
 uDrK85+nX/KY7EeCQlJhlppUk1HZTWJNn9PxY8O5Hvod9dCihI743kPDG5NL4DfJ+mlq
 6ZIClm1WPRBncx/NdeAp7X8k/pEZWle+pViNb2+5JpoxdPLLqItBHW5oEd5TRQ0QRXbr
 anmA==
X-Gm-Message-State: AOJu0Yx9gbrrqIdKegFmY4Sp+emlMAqeS7nA+fcIjsQMigSW7ofWCyrt
 1e7sjAcNWLLPtvFJkbiowGFS3IS7QkkR/SareY2oHNWIQzYonHKT1+YR5IsQ
X-Google-Smtp-Source: AGHT+IFZHa/QdyUcMgxAYQI7i3ez4ZrPrSDJ14hGPABq3pqDqBT8eWEAoqrDRHjensblPudJhWX2Wg==
X-Received: by 2002:a05:6e02:3dc2:b0:39d:3c87:1435 with SMTP id
 e9e14a558f8ab-3a3a709de06mr4741515ab.1.1728498142768; 
 Wed, 09 Oct 2024 11:22:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db84c47434sm1525481173.43.2024.10.09.11.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 11:22:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 12:22:06 -0600
Message-Id: <20241009182206.3879842-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728498143; x=1729102943; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D2fY7QA5G1XgLNEt0yxPF/jxPk8gMb2xBRt7KlDy/54=;
 b=MsyEAo6Kj0Zy/L1vqOSA8d95e2ng2RC/F16C9M35p3rlLwpAM33AWmgZ1LKBoztNgD
 qs5l4JioWPtjrNNx98Nu3LrnUB9WO4tiPvGn8SN0/h0JH2VKUCH3PZ+zWuPPIfcWM99W
 ey06t3flHxueTDKw0/jroGeV3H34qRAAKKwivXeZsg2NSJ7aoWuq4yc81Fxi6e48K27C
 lp24+sgiNGEgP8Fe+vKrt4rdvSenbUtueirFHFvQU5ozkEzBz5nUxk8/sxfdtd5nlBGw
 wUZc98wgaNXoHQXVvXV4Rqo4jurU5JaplElgTcNwFwLA1nlUCnc562Cw8v9eYAsUcIWm
 WKvA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MsyEAo6K
Subject: [Buildroot] [PATCH 1/1] package/python-uvicorn: bump to version
 0.31.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index 57839debd2..be6e2e325c 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  d75153180f8c19a1bf8299818d3acdb2  uvicorn-0.30.6.tar.gz
-sha256  4b15decdda1e72be08209e860a1e10e92439ad5b97cf44cc945fcbee66fc5788  uvicorn-0.30.6.tar.gz
+md5  a5b7951b8d9e335fbee8002e9081c108  uvicorn-0.31.0.tar.gz
+sha256  13bc21373d103859f68fe739608e2eb054a816dea79189bc3ca08ea89a275906  uvicorn-0.31.0.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index e9676d3765..3917e3a4e7 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.30.6
+PYTHON_UVICORN_VERSION = 0.31.0
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/5a/01/5e637e7aa9dd031be5376b9fb749ec20b86f5a5b6a49b87fabd374d5fa9f
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/0a/96/ee52d900f8e41cc35eaebfda76f3619c2e45b741f3ee957d6fe32be1b2aa
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
