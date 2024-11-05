Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2945ED3610E
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA0588118F;
	Tue,  5 Nov 2024 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lDq2rntKgAng; Tue,  5 Nov 2024 19:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07A0E81193
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07A0E81193;
	Tue,  5 Nov 2024 19:26:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 517F5B8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D3D240696
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A5zeU9knRHpn for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 19:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 259CE4067F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 259CE4067F
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 259CE4067F
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 19:26:03 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so194922539f.3
 for <buildroot@buildroot.org>; Tue, 05 Nov 2024 11:26:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730834762; x=1731439562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ci+d6pR8L1gVUtmg4WVLJP7x7O2HI8dMuviEicT/qkI=;
 b=hQyH6S0u/eVnICpeGLAcyLTQiswXj6C1YcRPYinShs6SffLBd8Crb0pyXdYDOg0gL4
 BKuBT/a55ia3dSdKBkgYsNAZ6Nx8FGbpG0+Y5+h6wO1fvxKBcXhrpiOMelTn1MW47And
 B7jyfO1Bi7NwNAHb6AsoUssxrddpk3iOeV9gmVCdoIw9yzRAW07nK0IqsdJIP1etpq/H
 dfwP9mHQZrO60/Bohcx7Ll0VNQ+cQW5PlwPHDKCUTCqe73Em8O1vlUQ0XrI1EF6hzafc
 E2oYk1GoyjwMq5usyFoezVUTqbwtRQe8+VF9hC9CUg/INr57SdQbYUT/YzbDdF/P9/ui
 YeXg==
X-Gm-Message-State: AOJu0YxNJrA4MR0ngPm3nwVk6FfB3duq7tydmwZek2kqA7nQQFP+sp/r
 s57LtG2ijHGNeNhKawowtOESqLbzI2Kum9jI4xIWU0H1N4r1JQXCC9xJmA==
X-Google-Smtp-Source: AGHT+IEBffKCXzt3ealu/g7Ugrmz2CwT7n/tMW2MmZcxnRmuDAB0Jw236Gth2/ns9rOkz+kN9lPhrA==
X-Received: by 2002:a05:6602:6c17:b0:83a:aab3:57f with SMTP id
 ca18e2360f4ac-83b1bcfa8e1mr4071336639f.0.1730834761797; 
 Tue, 05 Nov 2024 11:26:01 -0800 (PST)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4de049782casm2533227173.101.2024.11.05.11.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 11:26:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Nov 2024 12:26:00 -0700
Message-Id: <20241105192600.1589181-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730834762; x=1731439562; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ci+d6pR8L1gVUtmg4WVLJP7x7O2HI8dMuviEicT/qkI=;
 b=NdxAEfnYlAxJxdo/F89TbIxtDkqHPEoLjIC3PL742YSFfmDBOJHGPuufy2k19KXLPq
 u5yoHC2cOBCng4AYwYdScWIzyPaq/MbIrxWl8fCoZ9V+lDglt6CBgpyh25mlVgcDxygh
 29hyhReiMLgLUBapGW6yRWqCcqcP+EYuPA/+3aiXL2d/RerHP76bRMGJLWdQKW6mWKz9
 DcDlU0rW7cufX0eFWmo2rgodkwjuggEk216R2DMFnEoy4XPvI12GI6+lXs+S6kGURX8n
 e+K+qykZdGt5f3y1K0H2MAgnICVLPmRTdhVRJdiDLhS7M20Q4hXqn8X64kq6olkaxmqU
 Ktug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NdxAEfnY
Subject: [Buildroot] [PATCH 1/1] package/python-zopfli: bump to version
 0.2.3.post1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Switch from zip archive to tar.gz archive.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-zopfli/python-zopfli.hash |  4 ++--
 package/python-zopfli/python-zopfli.mk   | 12 +++---------
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/package/python-zopfli/python-zopfli.hash b/package/python-zopfli/python-zopfli.hash
index c397808029..0fd009879c 100644
--- a/package/python-zopfli/python-zopfli.hash
+++ b/package/python-zopfli/python-zopfli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zopfli/json
-md5  7c8761eac18a9c6c16049192fc4fe119  zopfli-0.2.3.zip
-sha256  dbc9841bedd736041eb5e6982cd92da93bee145745f5422f3795f6f258cdc6ef  zopfli-0.2.3.zip
+md5  2c42e8d5918059b84a42c0d53c5a6852  zopfli-0.2.3.post1.tar.gz
+sha256  96484dc0f48be1c5d7ae9f38ed1ce41e3675fd506b27c11a6607f14b49101e99  zopfli-0.2.3.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  018b1cb87efdf7a04c2fcc13d57ed63f62149113fb207b27ea13430d64f13513  COPYING
diff --git a/package/python-zopfli/python-zopfli.mk b/package/python-zopfli/python-zopfli.mk
index df76845a7f..47a27b1084 100644
--- a/package/python-zopfli/python-zopfli.mk
+++ b/package/python-zopfli/python-zopfli.mk
@@ -4,18 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ZOPFLI_VERSION = 0.2.3
-PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).zip
-PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/92/d8/71230eb25ede499401a9a39ddf66fab4e4dab149bf75ed2ecea51a662d9e
+PYTHON_ZOPFLI_VERSION = 0.2.3.post1
+PYTHON_ZOPFLI_SOURCE = zopfli-$(PYTHON_ZOPFLI_VERSION).tar.gz
+PYTHON_ZOPFLI_SITE = https://files.pythonhosted.org/packages/5e/7c/a8f6696e694709e2abcbccd27d05ef761e9b6efae217e11d977471555b62
 PYTHON_ZOPFLI_SETUP_TYPE = setuptools
 PYTHON_ZOPFLI_LICENSE = Apache-2.0
 PYTHON_ZOPFLI_LICENSE_FILES = COPYING
 PYTHON_ZOPFLI_DEPENDENCIES = host-python-setuptools-scm
 
-define PYTHON_ZOPFLI_EXTRACT_CMDS
-	$(UNZIP) -d $(@D) $(PYTHON_ZOPFLI_DL_DIR)/$(PYTHON_ZOPFLI_SOURCE)
-	mv $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)/* $(@D)
-	$(RM) -r $(@D)/zopfli-$(PYTHON_ZOPFLI_VERSION)
-endef
-
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
