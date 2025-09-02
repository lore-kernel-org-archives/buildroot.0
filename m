Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26B5CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 07:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 736A441B1B;
	Tue,  2 Sep 2025 07:00:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVECY7p7fOcH; Tue,  2 Sep 2025 06:59:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7873741AFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7873741AFC;
	Tue,  2 Sep 2025 06:59:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CE210439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 06:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B4E5440CD6
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 06:59:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sV1waIbSM3Wq for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 06:59:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5E53241387
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E53241387
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5E53241387
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 06:59:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 167B41814B9; Tue,  2 Sep 2025 08:59:53 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  2 Sep 2025 08:59:27 +0200
Message-ID: <20250902065929.924677-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1756796393; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=lQOADpMdcbs6JpZaHR4cj9lo8nlg/lTKLz5Yqqh4jVA=;
 b=IkP0Dxpks5nXg2hmxLVpJHbFwaMwSduyBtg4muqI+7XhivPVZp1i2YWAOFnmZXzkdZ6ch3
 2FvdVVFKuMSHNa5+pNG+iofDoRPVrQ8r8ln1o9VKe+JRvaJ6sD3kARt41J1piPKiyh/M4z
 QfcT5CcSm+SWW3+T3ERxCeceHDLDBjU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=IkP0Dxpk
Subject: [Buildroot] [PATCH] package/fmt: bump to version 11.2.0
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes of major releases since 11.0.2:

https://github.com/fmtlib/fmt/releases/tag/11.1.0
https://github.com/fmtlib/fmt/releases/tag/11.2.0

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

compile tested with

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_NCMPC=y
BR2_PACKAGE_RWMEM=y
BR2_PACKAGE_FMTOOLS=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y
BR2_PACKAGE_KMSXX=y
BR2_PACKAGE_GERBERA=y
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index aff52ccb6e..29b2b13c66 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  40fc58bebcf38c759e11a7bd8fdc163507d2423ef5058bba7f26280c5b9c5465  fmt-11.0.2.zip
+sha256  203eb4e8aa0d746c62d8f903df58e0419e3751591bb53ff971096eaa0ebd4ec3  fmt-11.2.0.zip
 sha256  07580f2a3b35709ce703d523f447b242f6dfec7582a8c0df102c7fa2849375f8  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index 113652e911..dfb6fd3942 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 11.0.2
+FMT_VERSION = 11.2.0
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
