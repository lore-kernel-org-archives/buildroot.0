Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8DDC3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 15:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B455B83A34;
	Wed, 14 May 2025 15:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pRF5c5-6lDK0; Wed, 14 May 2025 15:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD83B82F98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD83B82F98;
	Wed, 14 May 2025 15:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D56153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 128F94155A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5HeMI44Xnhe for <buildroot@buildroot.org>;
 Wed, 14 May 2025 15:13:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 114D341549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 114D341549
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 114D341549
 for <buildroot@buildroot.org>; Wed, 14 May 2025 15:13:03 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id EB4312C845D2;
 Wed, 14 May 2025 17:13:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 May 2025 17:12:41 +0200
Message-ID: <20250514151255.2316205-7-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514151255.2316205-1-buildroot@bubu1.eu>
References: <20250514151255.2316205-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1747235582; bh=19GTzlSkdO/bzFLrJ36/wrvDH/wiY71zVrypwiIDz2o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=PVTBjBX/YO5WXYtd31xfs8EhWzEPicykEFMudKmlnRTkjI7ZAXauxKtDJayuwy/Fq
 7JF/q5wiCczQX2FVxDZWaoeaUhYYifb2QqlWsUURuSCZJ3EaaTQ6ZL9qIbiQ9i8QNV
 KqXa5UB8sKYPGPNRfzlSw3XfSRG/DORslMdplCKc66zVtjMzKprg7kM5b77l3poKHK
 0zRG3nVzavBJnqVsQliuL9/gBe+TfX7EAEOUqK8/QqNOOy/QHb7nBD6354TkMZlQDt
 tiDG8kjb8llSH7txx8DjcWjUzB7mBbazcjPsqi6dujKWLdx9xEHegS7r2ARu3FEbG0
 DKp+0qQVN5H2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=PVTBjBX/
Subject: [Buildroot] [PATCH v2 07/12] package/python-pydantic-settings: bump
 to 2.9.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
v1 -> v2: fix package by packaging typing-inspection dependency
---
 package/python-pydantic-settings/Config.in                    | 1 +
 .../python-pydantic-settings/python-pydantic-settings.hash    | 4 ++--
 package/python-pydantic-settings/python-pydantic-settings.mk  | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-settings/Config.in b/package/python-pydantic-settings/Config.in
index 0e8dbc29b5..76cf564f0c 100644
--- a/package/python-pydantic-settings/Config.in
+++ b/package/python-pydantic-settings/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_PYDANTIC_SETTINGS
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
 	select BR2_PACKAGE_PYTHON_DOTENV # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_INSPECTION # runtime
 	help
 	  Settings management using Pydantic.
 
diff --git a/package/python-pydantic-settings/python-pydantic-settings.hash b/package/python-pydantic-settings/python-pydantic-settings.hash
index 173293389c..66197ca41d 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.hash
+++ b/package/python-pydantic-settings/python-pydantic-settings.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic-settings/json
-md5  c12f2c0a6e767e4e65665ad6f9641e93  pydantic_settings-2.7.1.tar.gz
-sha256  10c9caad35e64bfb3c2fbf70a078c0e25cc92499782e5200747f942a065dec93  pydantic_settings-2.7.1.tar.gz
+md5  ff06507b3ea80b5a6f9adf7a7dcb2b23  pydantic_settings-2.9.1.tar.gz
+sha256  c509bf79d27563add44e8446233359004ed85066cd096d8b510f715e6ef5d268  pydantic_settings-2.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  eb355a753e020346d33d83bf9769135b89fc610568ac531a01c295bcee7fd998  LICENSE
diff --git a/package/python-pydantic-settings/python-pydantic-settings.mk b/package/python-pydantic-settings/python-pydantic-settings.mk
index d3dc3d8246..0200ba72ed 100644
--- a/package/python-pydantic-settings/python-pydantic-settings.mk
+++ b/package/python-pydantic-settings/python-pydantic-settings.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_SETTINGS_VERSION = 2.7.1
+PYTHON_PYDANTIC_SETTINGS_VERSION = 2.9.1
 PYTHON_PYDANTIC_SETTINGS_SOURCE = pydantic_settings-$(PYTHON_PYDANTIC_SETTINGS_VERSION).tar.gz
-PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/73/7b/c58a586cd7d9ac66d2ee4ba60ca2d241fa837c02bca9bea80a9a8c3d22a9
+PYTHON_PYDANTIC_SETTINGS_SITE = https://files.pythonhosted.org/packages/67/1d/42628a2c33e93f8e9acbde0d5d735fa0850f3e6a2f8cb1eb6c40b9a732ac
 PYTHON_PYDANTIC_SETTINGS_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_SETTINGS_LICENSE = MIT
 PYTHON_PYDANTIC_SETTINGS_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
