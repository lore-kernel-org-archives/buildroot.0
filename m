Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A6BCEE337
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 17:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21A55402A5;
	Wed,  9 Oct 2024 17:25:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rWtjnkilxrxO; Wed,  9 Oct 2024 17:25:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D33D0402EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D33D0402EA;
	Wed,  9 Oct 2024 17:25:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6B61BF3E8
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE918102F
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 17:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUpnq-D3H0Ib for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 17:25:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 381EC81027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 381EC81027
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 381EC81027
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 17:25:20 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-832525e7449so836139f.2
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 10:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728494719; x=1729099519;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/c+ACwgQ+G+oUcbVzd+5XxxOb0sfSl1acPTxEib3tg=;
 b=JKlv1mMsP5/oucCfwOeGMtInfK1X8jeJIrN2oqDeuDZ8W0lAOosWdxExR2x8vWS1b0
 R3UYGMR6VY0Cny+HnKxD/mj7l80GdXhKEZKmKt726sevCgHyF7RSDSgwZ8AMa0LwxbIs
 NOwWk8BBSncN2bPhF1HcPWf2r1qXHXLcVgerpeQ58m545PDt8g9Yh19zXwCXiQTYN6Ej
 mYZfrQRnXQZqyY1tCghiX4ji5/OQzukmmGDi3COdblDLq6l9ph1oVbKiIIwJCZ5ZyMnG
 S+TS8dtr8J/aOto612hFDLvClmMyZWluobDsyyp0bD4gt0cuqO4Mm3AdQmBQeyht1gts
 3yZA==
X-Gm-Message-State: AOJu0YxD8NJzQW7g1HiT10lyPuKtGwXmzpnNG87K1tOLMtJKCIsK/7cO
 CV+HV9S54/DDBP7XW5zL3IaI+PNvuQ4dUNxJdfXvwFMEeHPLBHrmV3Rufx5D
X-Google-Smtp-Source: AGHT+IFYLBQqE6HMiQU4iz+fc5pOkCMKtiFyry5HlLEbwB9wk0BTOl1NReyOIFl6CJqO5j8wdTL/HQ==
X-Received: by 2002:a05:6602:27d2:b0:82d:38d:1362 with SMTP id
 ca18e2360f4ac-8353c07a5admr431688039f.0.1728494718893; 
 Wed, 09 Oct 2024 10:25:18 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6ec7279bsm2131333173.172.2024.10.09.10.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 10:25:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 11:25:17 -0600
Message-Id: <20241009172517.3844255-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728494719; x=1729099519; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/c+ACwgQ+G+oUcbVzd+5XxxOb0sfSl1acPTxEib3tg=;
 b=YlrIlAreZm3uc5Z9qlwgTNMN7Tsf+QfV8293E5N4x6GhHba4BXQWTb5QozjW3f6Vdo
 bFNeYYRuSsXIsdQoYVvc+5Gr6bqWqtrEUcGmQgs8fgktvEAi4tJz0fE54VjR6v9ltaBn
 KUgDIompD3AV060c3jjytW3n6qtYVTCWvHU3sBYk82jbuQ8qACzmAnHrLw1cCoa/ScVG
 JvNHlgytNWwjoCUo6dmrdYYnm93fT58Pz9U1LSmesh/FxkrrCzEqAYuMQ85MFXc7IlJ9
 BhGgXxxsKIleOHynQ3ByPDDZZjkYRH0yl6e2ZiQpk4JTDLm0njp06IOH6PP/Vn4+p4C5
 8oRg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YlrIlAre
Subject: [Buildroot] [PATCH 1/1] package/python-pyproject-hooks: bump to
 version 1.2.0
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
 package/python-pyproject-hooks/python-pyproject-hooks.hash | 4 ++--
 package/python-pyproject-hooks/python-pyproject-hooks.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
index 9fdcd33596..fdbcb9816b 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.hash
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
-md5  69b0b6de189bc04c3f9e304281765741  pyproject_hooks-1.0.0.tar.gz
-sha256  f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5  pyproject_hooks-1.0.0.tar.gz
+md5  ed3dd1b984339e83e35f676d7169c192  pyproject_hooks-1.2.0.tar.gz
+sha256  1e859bd5c40fae9448642dd871adf459e5e2084186e8d2c2a79a824c970da1f8  pyproject_hooks-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
index a42dbb0ab1..7edbd64294 100644
--- a/package/python-pyproject-hooks/python-pyproject-hooks.mk
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPROJECT_HOOKS_VERSION = 1.0.0
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.2.0
 PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
-PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/e7/82/28175b2414effca1cdac8dc99f76d660e7a4fb0ceefa4b4ab8f5f6742925
 PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
 PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
 PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
