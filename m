Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB6DC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 20:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A129C80D9F;
	Wed, 10 Jul 2024 20:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XLaVV9qDtTgm; Wed, 10 Jul 2024 20:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A82A280DBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A82A280DBA;
	Wed, 10 Jul 2024 20:04:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC5BB1BF2A2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7E3080DBA
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 20:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tMlYArDJcso8 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 20:04:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64D4B80D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64D4B80D9F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64D4B80D9F
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 20:04:02 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D4BA2B00535;
 Wed, 10 Jul 2024 22:03:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 22:03:53 +0200
Message-ID: <20240710200353.146248-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720641840;
 bh=SdA1v+BlhSGIP820oO2fXWeBCnI9z/EkPYANAleSuks=;
 h=From:To:Cc:Subject:Date:From;
 b=SzGRIHN1AfnvsZgxQEG8KfJ2g1eJPNcoN/++ntzvyWk6Q595Q8jzq4RH0btlSyOdV
 Ok4Ayv/mNUuqjgLw7YEtkJ/v7Omx/yqu0AV9SaONAhXqZhvE22dgGHqympLKPNLMKo
 74wHp4u8b+OZA+WVtMi20KSt85aSvZyfpql+MXN2nE1tchCucP+VP8FAb5UTL4ElRN
 Rb7wmA/o1PgU/SEE9NLjSAz9Qr9SgVptTKnPNaM8DWmtQK1Ac7F6SE8489bu12Gu8a
 yrc8MLjsCZvXIt/djhjWsqqXgkthAQMQL0Qo8paaYYvPF6s3YkZh8IaUtWhHbQ+OUG
 DoIKKu2G/gXJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SzGRIHN1
Subject: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.10.3
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since v0.10.2, see:
- https://github.com/libjxl/libjxl/releases/tag/v0.10.3

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libjxl/libjxl.hash | 2 +-
 package/libjxl/libjxl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libjxl/libjxl.hash b/package/libjxl/libjxl.hash
index ccd0d4e954..4eaadf957c 100644
--- a/package/libjxl/libjxl.hash
+++ b/package/libjxl/libjxl.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  95e807f63143856dc4d161c071cca01115d2c6405b3d3209854ac6989dc6bb91  libjxl-0.10.2.tar.gz
+sha256  e0191411cfcd927eebe5392d030fe4283fe27ba1685ab7265104936e0b4283a6  libjxl-0.10.3.tar.gz
 sha256  8405932022a556380c2d8c272eff154a923feb197233f348ce5f7334fb0a5ede  LICENSE
 sha256  91915f8ae056a68a3c5bdf05d9f6f78bb6903e27a8ca3a8434c9e4ac87300575  PATENTS
diff --git a/package/libjxl/libjxl.mk b/package/libjxl/libjxl.mk
index 51b69109d9..b7fe3e1b52 100644
--- a/package/libjxl/libjxl.mk
+++ b/package/libjxl/libjxl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBJXL_VERSION = 0.10.2
+LIBJXL_VERSION = 0.10.3
 LIBJXL_SITE = $(call github,libjxl,libjxl,v$(LIBJXL_VERSION))
 LIBJXL_LICENSE = BSD-3-Clause
 LIBJXL_LICENSE_FILES = LICENSE PATENTS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
