Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C62CA0FFE
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 08:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CFC041BBD;
	Tue,  2 Sep 2025 08:53:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nBPziqWOxiT; Tue,  2 Sep 2025 08:53:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 076E741BC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 076E741BC4;
	Tue,  2 Sep 2025 08:53:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1F1D439
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 08:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7ED341BC4
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 08:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MbmPFVcDqsB5 for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 08:53:15 +0000 (UTC)
X-Greylist: delayed 71802 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 02 Sep 2025 08:53:14 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E175A41BD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E175A41BD7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E175A41BD7
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 08:53:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3FE741814B9; Tue,  2 Sep 2025 10:53:10 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  2 Sep 2025 10:52:53 +0200
Message-ID: <20250902085255.1234158-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1756803192; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=2jIIDKESU5cz9LDs0FKgrNuSgnojTtApBQkbpmHnvcE=;
 b=juqJiqGVH4pil/oj1yB+ii7obN+e+ibc7kgBcVWKdcxlDk6WyMXVo3vXI8RLutpzv3SmSZ
 aDa3iIUzKYkIzZfsyhD+2Mp23ISa8nsc/hPxxvdqjNDETRf3WrEtaUZ+4apNM095QDGhCz
 cL2dhttyiq53OxrHZi38txaIm36urXA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=juqJiqGV
Subject: [Buildroot] [PATCH] package/re2: bump to version 2025-08-12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- re2 now needs C++17

changelog: https://github.com/google/re2/compare/2024-07-02...2025-08-12

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/re2/Config.in | 2 +-
 package/re2/re2.hash  | 2 +-
 package/re2/re2.mk    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/re2/Config.in b/package/re2/Config.in
index b79e711ad3..acc4bdbe46 100644
--- a/package/re2/Config.in
+++ b/package/re2/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_RE2
 	bool "re2"
 	depends on BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # libabseil-cpp
 	select BR2_PACKAGE_LIBABSEIL_CPP
diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index baa3a927c5..25ca9b4896 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  eb2df807c781601c14a260a507a5bb4509be1ee626024cb45acbd57cb9d4032b  re2-2024-07-02.tar.gz
+sha256  2f3bec634c3e51ea1faf0d441e0a8718b73ef758d7020175ed7e352df3f6ae12  re2-2025-08-12.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index 80db4db650..1068e7cc54 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2024-07-02
+RE2_VERSION = 2025-08-12
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
