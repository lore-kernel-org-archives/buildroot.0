Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28216606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HPedqNIg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=CZtJFxTm
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0404040750;
	Mon, 23 Nov 2026 17:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nte2WwB-3ys; Mon, 23 Nov 2026 17:46:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2934A40738
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455991;
	b=Z4iiKov+kVrr91Hi9SkLJtNFhvpsmNpntvoUG6zTcnd9cywRNI6qIr55kQPBkPrRWCCy
	 8iDs9U8APRGMD1HjmHrrk1pCZv085zRjE9VzkBWntn2o09vpiUo7S61R7O7HMMslxCOx8
	 PwColY7uwz0GoLWqOV+mMh5TeOxI/TeV7qNk+XbpCGkUjrpzSnT3R2MpWT74yW+fx56B8
	 KnUE/nbVxvh0SGrJdwEs1Z23Mvu3xWV1HmF9Ha0wEBfSzkAF3MsdOFGuKeIKWDAv908oe
	 Z5m06ae1asB5wcyQftfasPBvVOOejkvPVlKyvDnsu6nDZTpIHIEGgk9vPaFEDPPXR8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455991;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=D3GiUw0U4h5UB/yTA3KTS981Ko6SXVYEgnDZI7g9Kbk=;
	b=kghAeooegLEL+kdjp3op/T5n23VkJ3a/eFy81L28u9mijBAzosQAZ+0rev/8sL77TJcw
	 SVce60I4v8nh3QBuRqKIUyklB/XDk0PvcMnfS0bniNkTJul8ElMfMCQYTInIQ+tGXkAYK
	 sR8BMBSH0kp5Jr924mQJKQU4LkCUoM3nW3QyutnqkTcQoaCfwSUiBMvROmF9HOtXVMpet
	 8arTbo+/jsL4GJiq6o+hgO9/c6WbPfsW0VE4QPMnWmz+cl/5EBppgsaVCKP+2OZHi0bqQ
	 J/QsVCZdQ8eZBp6kPATYdVblAZj0vxQ2PQugm3PB3E/De37r7pwCq/7aPatZ3jtFbDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455991;
	bh=D3GiUw0U4h5UB/yTA3KTS981Ko6SXVYEgnDZI7g9Kbk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HPedqNIgGjrieanh1/IulwKV+UOz4cLb9fGd/r+51nqOL57QE518E7GHptGFiS98e
	 pWNzFco/UaqXUKFBfF5aJF0Iww4tEVdAlqtb1zIoauHOla/fW6yQDCow6skgcEmvwi
	 UODiBW9phzGgeXoKsJ0zzXv+bwwq4OjRHLCHaLmZkntamSywhKIPoJZhvJzt/xyXCO
	 0ZMrhbbR4gW7wjU78al0Nc3Fs7NhQuJDoKsJRNQRfnGPDMS0l2Xaq8cjLOqn196UD8
	 Gc0KeK2wdzctdzS624NiHwalmHJsZOMjXb3bCusKlwt3tUCieAZFSM3G164hNSwk7d
	 XkJT6b9nOwr+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2934A40738;
	Mon, 23 Nov 2026 17:46:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AFC9E3A8
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E2F0401E9
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g5JBjzwyTV5L for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 27FF140093
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=CZtJFxTm
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27FF140093
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:25 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7SxTNIykbYcVY7SxrpgV; Mon, 23 Nov 2026 18:46:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455982; bh=z6G/n0XlKFPtGgaM9wwa5uLNSBRj+5D5DlscFtEVctU=;
 h=From:To:Subject:Date:MIME-Version;
 b=CZtJFxTmiEIFkmoNew9nDl8UBRbFW6zOu+K73bH1txCxAaY9EWBvvKobRy3LiZW0d
 sVnZXnYw7KresujcqfxgIvjbleH1x+YfEe31841481HT8qqOFgMrHQAuCq3GehLsDN
 H1SNr4Q6peS4vW0LVJB8O7VI5NQ3WW8Y4DokGkzq62GVgzsZAZJrKdW2rSr5NpCB3M
 yFRTWJxJiSr0xTj0Pdc1h+/oN02ZI0uHh5b34zEMkQHoOHqpxW9i4fthcDqKklIpc5
 QOa2vmM1Hdk/hBshjG2mtNn/urBePOGO7jFsPkR1ZWv679CttURyXboN/QEkIOD3vJ
 OwITfamDrklgw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Nov 2026 18:46:17 +0100
Message-ID: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMD5myFTEeIcp2xdRC6b1kPjAVZZpnPNe+LnLur4T8L/p9npIc16qikyhQsyxw7vLEqcGOXPmPEGfksgurzQ9k9PbZRYIT+MAZGeqWvjyyEbL0MZ6k1L
 2bTFnLLYc6Ia4bNf1pLeW9U3Iu2xU8hnXM0an1WORDfAPakH/nI1kclBGC0LjeO9bmeccDP4qTnpRhH8LLTmGsstwdDdBShKxGDWwAsx5/8w4gPiVT5N3UIP
 utQsqqfLTBP4lnVKO1O5fbbWdGfSchN0Y31W8w3DyOWcTSXn9KKje9JX3FEA24dR
Subject: [Buildroot] [PATCH/next 1/4] package/harfbuzz: bump to version
 15.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For release note, see:
https://github.com/harfbuzz/harfbuzz/releases/tag/15.2.0

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 0f8cb8cfd7..06b73e6ff2 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.1.0
-sha256  0fc7c565443a5f4be7da65ac5ee5bd737d9b158dc908708b7689a0a5796b0c8d  harfbuzz-15.1.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/15.2.0
+sha256  e2ec49090744383cdbe7df808c1cedaafba06a97be8dc4211fe546ba585f12cb  harfbuzz-15.2.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 69599c6630..443896ca94 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 15.1.0
+HARFBUZZ_VERSION = 15.2.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
