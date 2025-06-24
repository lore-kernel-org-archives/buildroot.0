Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE39C77B7F
	for <buildroot@archiver.kernel.org>; Tue, 24 Jun 2025 13:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5AD61253;
	Tue, 24 Jun 2025 13:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OiG02cC5zI4e; Tue, 24 Jun 2025 13:46:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5162B61230
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5162B61230;
	Tue, 24 Jun 2025 13:46:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F83D12C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9AFD8202C
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSAERlMng1H6 for <buildroot@buildroot.org>;
 Tue, 24 Jun 2025 13:46:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91B4980EA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91B4980EA0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91B4980EA0
 for <buildroot@buildroot.org>; Tue, 24 Jun 2025 13:46:28 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 482212C800A0;
 Tue, 24 Jun 2025 15:46:26 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 15:46:24 +0200
Message-ID: <20250624134625.2394898-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1750772786; bh=AUDH1gQJrf6CZMPwXF+sVfuuHWhF3Uamo6TAm6FFcuM=;
 h=From:To:Cc:Subject:Date;
 b=KOazOp5aByADm9Sdpt/kVW2Pr7kt0h66VdGjliYo3gXmx865R0AooEOqoDLd5RA3p
 S9vWSUSAPGOVLjkMkOOnbjOJdOsBtYMosTgcHYCRNXtRr4TUeVe8sq63w1Y0nht01a
 HtIQi/NFUkSDqLvQEcPXnq+qoalGBKSa3eqMdQznV4jRCOOSWw0/fJEq2bZYtRep1q
 0UX7NDxm1Tvoq5ya8X003rQlqi0/zGDz4igzKMrHlkwGNteZV5bomQKWU3KiOJlj0B
 qxRx7+MMS8X7ybBfjD2I8nhq/c7Vjv6/gSspXqN12vkLu5mCCKT9efp0WFZmE5/jAG
 mSuYayZIzfgNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=KOazOp5a
Subject: [Buildroot] [PATCH] package/python-pydantic-settings: bump to 2.10.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
* https://github.com/pydantic/pydantic-settings/releases/tag/2.10.1
* https://github.com/pydantic/pydantic-settings/releases/tag/2.10.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 66197ca41d..d388b54a11 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  ff06507b3ea80b5a6f9adf7a7dcb2b23  pydantic_settings-2.9.1.tar.gz
-sha256  c509bf79d27563add44e8446233359004ed85066cd096d8b510f715e6ef5d268  pydantic_settings-2.9.1.tar.gz
+md5  9ae7af43eead1edfe978e2e94f6c2c86  pydantic_settings-2.10.1.tar.gz
+sha256  06f0062169818d0f5524420a360d632d5857b83cffd4d42fe29597807a1614ee  pydantic_settings-2.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 0200ba72ed..770fd0895b 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.9.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.10.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/67/1d/42628a2c33e93f8e9acbde0d5d735fa0850f3e6a2f8cb1eb6c40b9a732ac
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/85/1ea668bbab3c50071ca613c6ab30047fb36ab0da1b92fa8f17bbc38fd36c
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
