Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC87CC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 08:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB8941A32;
	Tue,  9 Jan 2024 08:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB8941A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XxlRLjwKWvjC; Tue,  9 Jan 2024 08:54:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A633D4191F;
	Tue,  9 Jan 2024 08:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A633D4191F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEC1A1BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2F908175B
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 08:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2F908175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDr2XlpT9z3J for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 08:54:25 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D84A381516
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 08:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D84A381516
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso16296365ab.2
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 00:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704790463; x=1705395263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Usvzr52jdqVTHW2cG0IknG6OiSA+hPeQfLLLUy1GnH0=;
 b=v3XGHwDmRT/PD16afpfBTbwN0I2gxmBLSeiy369G4LAA+20Tk7e2GbI3PCbuHjShDf
 SLBwLhDKk55zjGnhbYEGOilFf25mnTNl8HhCx6inDYQRIrNm8m/BGvoMZZ1P6LtplMqk
 In5q/yuxAE0tBghDfmJxgx2wAat9/y9QYqy7Fikdi8b/9sUgN4IM2Y9NH/2SrvVtrWHr
 qRiW5gf1azevJ+IvQzrVBqhg1/hrc98d/4JBV3nOCGPrq/fS3XP60WBtC1W9GeowjNgZ
 ggs2O89JlqMlYTZm353g+YsmQfqqjY4djxp7P9BqdsutlvU/ltu4mTCU8k6KHc5dQJun
 wdKg==
X-Gm-Message-State: AOJu0YxONglVK7F5Hv2yUpLlpiqlBq3L22uCtjpkL25VnUEe3HMxwPVw
 d24+cYh6ldB66UEXxQbK9HjOuspJ/HHCmQ==
X-Google-Smtp-Source: AGHT+IF1dyPrbKJ1OQUH6lAFlu80UoL8dWmtc/+R7i/CJNjc7bFEIBw38HKt1T2w7eGw1xKkdSwqww==
X-Received: by 2002:a05:6e02:20cd:b0:360:63c0:545a with SMTP id
 13-20020a056e0220cd00b0036063c0545amr8515974ilq.6.1704790463611; 
 Tue, 09 Jan 2024 00:54:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 cp15-20020a056638480f00b0046d3fd7f9e2sm522807jab.163.2024.01.09.00.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 00:54:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 01:54:21 -0700
Message-Id: <20240109085421.33259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704790463; x=1705395263; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Usvzr52jdqVTHW2cG0IknG6OiSA+hPeQfLLLUy1GnH0=;
 b=GjgJb28w0u5LpFoAQw7p0sZZkCHqupF4fZ9r64e5ar+wQqdAxSyTyltzDgfqsbsJF5
 M4Cll6K7KZR7QnJ3BnbncHb/Vgv+Ze7Vmc8ARZzuTyxImJAEEabEgTJXdVsUBm00P6Qo
 cToVJEINtvH8+L0zRUls+Y1tn4XV/fOpJ4XIbWlJ3uwaIH+7KtHm9yDhhVifVD/gjA5T
 eeF2fJQN8bS9VZxXRii9iRYnBrFibs5ijerWWeqDbEyT7UY6KRb/haKUte5eIG7bgvml
 1rFpyrnnbF7SR2vv+uP5iAtrxYJYw1Q4V/gBfk3jLUusCaYY77L4LdZD/jQtmyUFNfR2
 t7Ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GjgJb28w
Subject: [Buildroot] [PATCH 1/1] package/python-lxml: bump to version 5.1.0
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
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index e34cb193f4..a23cdcec9e 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # From https://pypi.org/project/lxml/
-sha256  48628bd53a426c9eb9bc066a923acaa0878d1e86129fd5359aee99285f4eed9c  lxml-4.9.3.tar.gz
+sha256  3eea6ed6e6c918e468e693c41ef07f3c3acc310b70ddd9cc72d9ef84bc9564ca  lxml-5.1.0.tar.gz
 # Locally computed
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 3ef3aabdbc..519a9a77ac 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.9.3
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/30/39/7305428d1c4f28282a4f5bdbef24e0f905d351f34cf351ceb131f5cddf78
+PYTHON_LXML_VERSION = 5.1.0
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/2b/b4/bbccb250adbee490553b6a52712c46c20ea1ba533a643f1424b27ffc6845
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
