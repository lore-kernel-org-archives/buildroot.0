Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65917C71141
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 397E240830;
	Sat, 14 Jun 2025 13:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HeYq-_6ZgyFg; Sat, 14 Jun 2025 13:41:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A9F4059C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66A9F4059C;
	Sat, 14 Jun 2025 13:41:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E6C151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C71D80F60
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVaNBQK76hRx for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC4BE80F5E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC4BE80F5E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC4BE80F5E
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:41:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a08ea.dip0.t-ipconnect.de [91.58.8.234])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E13C2A4C0C64;
 Sat, 14 Jun 2025 15:41:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44674)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uQR8s-000000000FC-0Jxi;
 Sat, 14 Jun 2025 13:41:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>
Date: Sat, 14 Jun 2025 15:41:54 +0200
Message-Id: <20250614134154.678799-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1749908514;
 bh=vL6FcivAMGtf6gzOPeF0mTJltjkuxD8ToXmXcQyFvas=;
 h=From:To:Cc:Subject:Date:From;
 b=Bm2T/n2zlyFanE+Onfc5YTUd03XvrO90xt4ZxuNa4cW1tXvEIkiWtrPKYpStTRcqb
 cAMrqk8suoXw3RXVoXIotIFaqVgfeLb7FZwFcwn1mMUI+IeGOptxeGvHLfsTt9HelQ
 SqDV7X4ezeveDGMBWHk9ONn/D/8s2VZ6tQ/j429lS31rYBZtsunArGeVqpP/J61sjt
 EF4+gruP8gN3mnl1vfxyW1M3bdt/wIasuPIfbz/2C4Snb23LTKjM2fbGtK8M9obkmz
 vOV4Bzr1gf6uJgnuPipJecULeEZWoj7+F2GS8n4sqbykWH6PKD0v9Xvaf2M6xS4Tt+
 MG/U1QKvUqXBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=Bm2T/n2z
Subject: [Buildroot] [PATCH 1/1] package/znc: bump version to 1.10.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/znc/znc/blob/master/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 7bac128af9..985849acf8 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e8a7cf80e19aad510b4e282eaf61b56bc30df88ea2e0f64fadcdd303c4894f3c  znc-1.9.1.tar.gz
+sha256  be65ad9b62ef545a7e9486f2f74134edc53ba513ad43a69d9d8b476605336b19  znc-1.10.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index ec6287e6de..c0614f3e87 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.9.1
+ZNC_VERSION = 1.10.0
 ZNC_SITE = http://znc.in/releases/archive
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
