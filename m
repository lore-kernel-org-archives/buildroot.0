Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD7EC02180
	for <buildroot@archiver.kernel.org>; Wed, 15 Jan 2025 21:24:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E038E848AF;
	Wed, 15 Jan 2025 21:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CqwpewngdY3p; Wed, 15 Jan 2025 21:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1653D848B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1653D848B1;
	Wed, 15 Jan 2025 21:24:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65B8194B
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 21:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53B14848B1
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 21:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FUCarAy3BKMf for <buildroot@buildroot.org>;
 Wed, 15 Jan 2025 21:24:11 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 15 Jan 2025 21:24:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EDDD0848AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDD0848AF
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EDDD0848AF
 for <buildroot@buildroot.org>; Wed, 15 Jan 2025 21:24:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YAl4tNDoeNbHHYAl4tZeg6; Wed, 15 Jan 2025 22:17:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 15 Jan 2025 22:16:59 +0100
Message-Id: <20250115211659.2498521-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMA/vkRg+ZEkD2FAc7/3L/bQfaryCKjTPw21osbMUkEJnkSXHOF2FSHTAHVWHnX4fPykI+PmifcmKXaB4NFN5YfC6fvTYUDeZt17M30Vm+fywEjlEWAw
 kAksTMn1Xej1GAk41R8JRd0+879vrHkhWkYEjkRB6gex9e8qnhmq2vsY9YDbqxelIxlWXCbk6Eu3dzv87fIb0YzgqAaAF8JkS0OyPA2nRPSRMzX9gm9d2OXa
 IuQ8rshmJyEzBjmFgG92bINoXg7dREXcCCDXwZqiDvM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1736975822; bh=0Myq97KG2T7wByFOfDBfq7BBugCLdx3VCfFgOxysGv0=;
 h=From:To:Subject:Date:MIME-Version;
 b=LREvS/ph2e8v8ZdYduWybfymPSXzpEIY7pvVlvR/hC2tyQGphsoXPGCrnY3Py/2Om
 7K6gsGXiadBcv+YM58y+SmvcWBGWiaOwJrBVJFxkjY7KEAeVY1rkXRwHICfpHYhFPb
 duz3nSSNpb+yFwsrnucS95xM4JmXlEJQjHdaeMn8b7SMXVE2SCeMVHrmi7hMGg3O6B
 /ecucLtlVHRzx+SmQCWAcZ+WD77ezIp+3AMeDnSMnypEKnFh5KeEgSLurhdO42O95u
 cK9HRQJUN/zYZXLzyRD3XdvHbbhrrK6X5esLHm3OVtOBf5pwlQ/0w0sj8dVdPO0RcP
 0VJ+BQHOpZlmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=LREvS/ph
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.2.0
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 562727d3df..7f2d48e06b 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc  harfbuzz-10.0.1.tar.xz
+sha256  620e3468faec2ea8685d32c46a58469b850ef63040b3565cde05959825b48227  harfbuzz-10.2.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 510c0a946c..d614e60a0c 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 10.0.1
+HARFBUZZ_VERSION = 10.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
