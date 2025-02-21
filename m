Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70B3C021B5
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:18:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351C481F95;
	Fri, 21 Feb 2025 22:18:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1EJV7PFfGYFA; Fri, 21 Feb 2025 22:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42F9281FCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42F9281FCF;
	Fri, 21 Feb 2025 22:18:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BFA226B
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC43D40173
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j-T5wpiI3xhU for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:18:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.162;
 helo=smtpcmd14162.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C747404A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C747404A8
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C747404A8
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:18:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id lbLRtsrNrLiPtlbLRtB7zr; Fri, 21 Feb 2025 23:18:05 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 21 Feb 2025 23:00:00 +0100
Message-Id: <20250221220000.149303-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfC6DmGcszOEBwF08H46Wz4irKeE7e/3gU5pkJx2iE49X2syswuMvlWCUz2JaPMC81kSHpdSTfbYULKPnLHgY6pMganjFVfF9EMFexGhw3iNnx4M0mdo+
 oIgKY5PCh0gAF2+nuuk3GYC1p/BczZbzu2O5jtjV9m6VbXPx7Bss/yUW5SKSJJ4u/e8dnsZKYtKbd1bF8wmXD4wdj8LDEtfRkKbn0f4Ocec6ek02FllOBbyk
 IM5PvoMMlLzLDwxylzQQTRa9wijcPa5nIuQDnT9dzAA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1740176286; bh=SQ1zQ+Cbzc6fWCPRqgsqbSgiL1ZooTPuEYCm1k/IqdY=;
 h=From:To:Subject:Date:MIME-Version;
 b=CKACJ4vsoNueASJpj1XSMfwIThbyf0oyq8JkfaEReqj0NJC4ZwRPyWOHm2F8AqFUP
 8BgvpJYwVQqhqGDTrC/J0usvt45GFdpuhHlnELEIIuBhRrODXngxi9kqwlmvlfVI2y
 mHjJ1K21oeDt6S56XVqz/Tg90S3Tt9748tw5gC/AzBzTQSpIUnPAFZ/iLj+Sgba71e
 Qwjq6EyD4xLXWREdJILRBDQFLZSs0h+ajr/5cFNz3CKyIq2zKTO19M/t7Y6n0An0pC
 BhD/VlleApAT1GuGZBG9pRAPf/11hRR1R5jZ/5fC1Y4KRsp0HubIcjTw3QWzB2/msM
 PX/WFRRVumJZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CKACJ4vs
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.3.0
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

Release Notes:
https://github.com/harfbuzz/harfbuzz/releases/tag/10.3.0

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 7f2d48e06b..561b9089e0 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  620e3468faec2ea8685d32c46a58469b850ef63040b3565cde05959825b48227  harfbuzz-10.2.0.tar.xz
+sha256  cd63fc3cbae32622588e46e0670fabf78ee6cff44a6348ca7f037dae9a32f9ea  harfbuzz-10.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index d614e60a0c..db99199278 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 10.2.0
+HARFBUZZ_VERSION = 10.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
