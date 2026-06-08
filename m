Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACEACD8C92
	for <buildroot@archiver.kernel.org>; Mon,  8 Jun 2026 07:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840FD84961;
	Mon,  8 Jun 2026 07:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4iTpYTjUe8WV; Mon,  8 Jun 2026 07:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A36C8491D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780904614;
	bh=53wtH39s+SMexc0Rg2PhlZ1MS+HTVttTaG8m3fXXbcQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=JgJVSdlFXrPmNvMFRA4AbU4a8WICMHIsSYoEXU+lCoeFgDpT9S80tDJtZ8oSxZLJn
	 RxGT/R6h8PsDybkzt/j4H7p5Sb01q54Gk8srl4Ao2YL/Ry7GbCq15SvbTpje7vyIxv
	 2pfOLPykr6N4pD6RoEc/Waih/NYjDNUYu/jAGTR2KIRbaonM+ovFOKTlnYWiehyFhK
	 xrG92R9aWICGT76+NwMXdVa5kFAp+i2hfhbEBU+bHyIILy9dd8135nX9YB17YOpOeN
	 NafbGrKqIMMoaylOSsyWNgHpy59ZNKOqyZ3zUKyE52M9Bq/xgdN0HLJBE40Wt7vtPK
	 Us9vfVGvSckcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A36C8491D;
	Mon,  8 Jun 2026 07:43:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 725A62C1
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57B038491D
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-4PKFfGhA8p for <buildroot@buildroot.org>;
 Mon,  8 Jun 2026 07:43:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CFCA084917
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CFCA084917
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CFCA084917
 for <buildroot@buildroot.org>; Mon,  8 Jun 2026 07:43:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 536871814BE; Mon,  8 Jun 2026 09:43:25 +0200 (CEST)
To: buildroot@buildroot.org
Date: Mon,  8 Jun 2026 09:42:56 +0200
Message-ID: <20260608074258.279114-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1780904607; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=TX8ytWuSPlb8iGxK4JHLamhlqvaGCCbEEW41NQnLDo0=;
 b=nxPRNd+AT5DCfz2jwaFVCvKjes93k0HPH93M83f9IKPyA/g8ja4PHNWg3q9028wThQFUHl
 gb0Brn05HNtkoF7z5GzTO0GABBK/1mPeSMAXcpKl1D3Bl0YGRZ/OQZbj2pbiLIp+zaz6di
 5eounUKBs21xUNYVHqc0r7L941zBsJc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=nxPRNd+A
Subject: [Buildroot] [PATCH next] package/sdbus-cpp: bump to version 2.3.1
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
Cc: Sergey Bobrenok <bobrofon@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fixes an ABI break in 2.3.0

changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/sdbus-cpp/sdbus-cpp.hash | 2 +-
 package/sdbus-cpp/sdbus-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sdbus-cpp/sdbus-cpp.hash b/package/sdbus-cpp/sdbus-cpp.hash
index db1c5d5fee..839757cdcb 100644
--- a/package/sdbus-cpp/sdbus-cpp.hash
+++ b/package/sdbus-cpp/sdbus-cpp.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  8c01d28fa7b1a973d7a9cfdfd65480e733a52172506eaa1fea225b681590fe3c  sdbus-cpp-2.3.0.tar.gz
+sha256  3a289eded586c26d06c1387de72c7bf7c809527a70d51ba6401fe61059b19626  sdbus-cpp-2.3.1.tar.gz
 sha256  20c17d8b8c48a600800dfd14f95d5cb9ff47066a9641ddeab48dc54aec96e331  COPYING
 sha256  a1c9e75e25d8f2ce18017c88978edab2f0dbc7814ad0697d4ff2e5e59959f657  COPYING-LGPL-Exception
diff --git a/package/sdbus-cpp/sdbus-cpp.mk b/package/sdbus-cpp/sdbus-cpp.mk
index d8743c66b3..ad5f999c5c 100644
--- a/package/sdbus-cpp/sdbus-cpp.mk
+++ b/package/sdbus-cpp/sdbus-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDBUS_CPP_VERSION = 2.3.0
+SDBUS_CPP_VERSION = 2.3.1
 SDBUS_CPP_SITE = $(call github,Kistler-Group,sdbus-cpp,v$(SDBUS_CPP_VERSION))
 SDBUS_CPP_INSTALL_STAGING = YES
 SDBUS_CPP_DEPENDENCIES = host-pkgconf systemd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
