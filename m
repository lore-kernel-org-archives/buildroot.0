Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A44CCD183
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 17:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD4C24052C;
	Thu, 16 Oct 2025 17:40:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvgYmVh4GrXg; Thu, 16 Oct 2025 17:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0117F40532
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0117F40532;
	Thu, 16 Oct 2025 17:40:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 69CC6968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5015F401D7
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oLINEzyQxeod for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 17:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D700401C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D700401C9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D700401C9
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 17:39:59 +0000 (UTC)
Received: from framework-OT (unknown [93.240.174.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3EC902C89302;
 Thu, 16 Oct 2025 19:39:57 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 19:39:54 +0200
Message-ID: <20251016173957.246866-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016173957.246866-1-buildroot@bubu1.eu>
References: <20251016173957.246866-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760636397; bh=DUWjqf/JWyAFvZIlzzm0uw52OWANR/vomMhBaHa9rdk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WmjnjHCEm9krNq6eU2MTVEWwk/OREP107XpASxpa3BaGtK93ayQ4NN4u6QdtJhnYD
 aK4uNosBE3fdIUTTHYn8Hu1rMzO18yprXD2zxFI3M03K57gX0i88RdyOR4joV1MVbG
 vMI/VCriJiCfgR+3EzFrlz80akNWnKKGM8Ktpl2IesLQYqBI9v+XR/e0+sLW36rLxz
 WSXVkZT8wEdu4jamB0tVZp/wFPtOWmrwoc96JzxEc1Lk4z8r+D8N4cssTL4kBiXLwX
 eCxDdcTExbR1HNjLzfij+OMWGMPtFoHcSc/l0xHaA0gX76OMuV09R2Yuh4LAZE54gK
 a+I3PnYrlZhUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=WmjnjHCE
Subject: [Buildroot] [PATCH 2/3] package/python-pydantic-settings: bump to
 2.11.0
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

Changelog: https://github.com/pydantic/pydantic-settings/releases/tag/v2.11.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index d388b54a11..3d0f053968 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  9ae7af43eead1edfe978e2e94f6c2c86  pydantic_settings-2.10.1.tar.gz
-sha256  06f0062169818d0f5524420a360d632d5857b83cffd4d42fe29597807a1614ee  pydantic_settings-2.10.1.tar.gz
+md5  bfd7d2cc366483b19181428756e6a58a  pydantic_settings-2.11.0.tar.gz
+sha256  d0e87a1c7d33593beb7194adb8470fc426e95ba02af83a0f23474a04c9a08180  pydantic_settings-2.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index 770fd0895b..ab5205b7e1 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.10.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.11.0
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/68/85/1ea668bbab3c50071ca613c6ab30047fb36ab0da1b92fa8f17bbc38fd36c
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/20/c5/dbbc27b814c71676593d1c3f718e6cd7d4f00652cefa24b75f7aa3efb25e
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
