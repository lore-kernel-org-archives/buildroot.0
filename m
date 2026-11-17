Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241C606A332
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qGlr9U3k;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=F/mYzubp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78EB94075F;
	Tue, 17 Nov 2026 11:19:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zv5cJ8uRXDKA; Tue, 17 Nov 2026 11:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C519840737
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794914391;
	b=b4kIxJjHfzKeEdiroQqF852Pgo5oOtbkDkfC+Z3/3JmYL3vLHK7Kmw8K78oXg7+A6HRZ
	 JVYenl5rCnLCTRcmlufMMC+PxN3SwiHhLl1tGZrYfqGNMJBNqNaHO8FdZDBe/ynhVXkk6
	 ZmOJg/lMJ3GOEe4yHO0xwjrJCXyR4I5/8a4Sk7zWoO6CI0KwhoERk86oCCfj3at/Wg3m7
	 R9RaNTtmMbLBhalzZq1eXgfBh4zsG0Ls78N+uBn3YjSnHwAA1RerGUa0+yR/m/NJwbihe
	 kGweXV1jlNIpwwShUbOmpMkYTIPWZuBAMB8SiAcJzFg3axtajW/YPsZlxXrerHkxTew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794914391;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MM70cL+uMWx32HtM0CKPsvKZWSRHk6AIO1x/9Y/s9Kk=;
	b=IY7IwPAUIuuHiMtTlQOMnO9dznDjXqIeNS4lqYCR9ZCbt6EKP93T+b34IeN3Pdkt1SdE
	 +lIPF2Yyav+VdEXwPVPruFPJzpvEjZp78izpoJAse3oF+oIVbDzv6C5N1/Jbph4YRcaN7
	 YGWSTdDcw3+SRzZ4f2AXpGFgx3pP1+ChulMPRNONFsKz0QRX5NGCGvepf9aoywVqLKt5C
	 OIAURsJ6VcRU/J2TmP962s88KSuZKC5bL/4YKN+0KPwjwKRaDBEHEOzjkrAHZBwIYGsom
	 f5ZMS3di24VpgdBN3oBIpnLXkyq3t7b4HpR5Cxxwa28tQdPF08mQU8ktanzUbj0KOPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794914391;
	bh=MM70cL+uMWx32HtM0CKPsvKZWSRHk6AIO1x/9Y/s9Kk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGlr9U3kCx24LCScBeigzwwMhOwx1DGzpd0itMxavKE/xigmSMHmdKXqBP0hT/cxb
	 HDAGKGEQhwpkCcRUEfew7rPoMezUSbpblNkX/u3y5ctWnxvphqrz2D/SKGOl2T7JGt
	 cwXgCaaHHFarud01uBlOuqD23Kog4nWpzzQuPgRa9oEoG8BjrFbVN4dKXycDJ6s37c
	 Js4wuiSRk3QDOnpcQ9xDtmqY0iAWiVfVDu90p9kayr/z/u/A1mIEWCRxIxEG72KGsk
	 wZWdmXQzImcTRG1c/2M19Tfa183Q/+A78NzEYiC6qqPY3MqwWptJVfD9xL+T6RXqBx
	 fasrUE349bYow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C519840737;
	Tue, 17 Nov 2026 11:19:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB0A08F1
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 11:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCC3F40308
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 11:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvUPEBS1BIqx for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 11:19:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 34FD3402CA
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.217
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.217;
 helo=smtpcmd01-g.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=F/mYzubp
Received: from smtpcmd01-g.aruba.it (smtpcmd01-g.aruba.it [62.149.158.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34FD3402CA
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 11:19:46 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id THDzxjvmGGZvgTHDzxAR3k; Tue, 17 Nov 2026 12:19:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794914383; bh=76ZHWejKxoCXsXn2rs5m4EQ2ioH0dIQ5jRf1PKLvkvE=;
 h=From:To:Subject:Date:MIME-Version;
 b=F/mYzubpRQrh7bZwmPGnyvv9Uet0p7Owth3Yq+bBTuUXvlKRK6PPQEygOm39ivS34
 U6CTzYT0btvyv0EBcSF1FGoez/eh+8usWId6yccsvX/uv1KGlztKPG6me83ssdrYVt
 /5i6aek7FWPSKjv8Qm9JEeMrWlQMqLLQVsVmLosS5fsNGr/hfIVRKa2BTj5kigzm+i
 R/s5mf0ARV2CVBHAMAPTdaQO/9pfiiTmqU7uHg46+5SDjTf7qgEDE8V8U4wu0nhSwc
 34BjcIEO1M64xMnUQA0uwkFDEQBWX3DMS2nUoB4wZebtcLcNNINc8kK/VljNIwayXk
 z5aEjpkejJOmA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Claude Opus 5.5" <noreply@anthropic.com>
Date: Tue, 17 Nov 2026 12:19:42 +0100
Message-ID: <20261117111942.1382413-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK7WEG5fcfcA2Z8+g2lvuBtOa4EK57wy1yjQa60ZPCEfoCGQpwGWFeuX6AjaYcMpEiHAyTYrz4f4adAO2eFVngmTG05Pq3n7+h1mEK7YJOdY+GZH2RaS
 nttrXLWcI7C7UKjgAL57eiMNQ0jR+1bJLQH75kKPp/hjqoAbHSVs5oNm23qSqOvEs1M00zdxl0atlTHyhXszRaKQDNfcvS8BQne9hBaegwZlkdhc42DlqmsE
 r2jNyBPZZGHCjVMxrfymHHGdQNkWdl+/3dtN6oQ2BVhfLb1DVchza1fh5ypvhw2+DVX7n+EVqhrfChOP9jHsoYu1H9kQdQOurSzfkq2Z3BQb6N1u+1bpRRyc
 TMZnhfy2
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with linux
 6.1.188+ and 6.6.157+
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bump to version 2026-11-17 on branch v5.2.2.4 to fix build failure with
Linux 6.1.188+ and 6.6.157+ due to Linux stable commit 8b7648962d41
("USB: core: Use device_driver directly in struct usb_driver and
usb_device_driver") that dropped member drvwrap of struct usb_driver.

Fixes:
https://autobuild.buildroot.org/results/6c1f9024b049d74e556e1a6790be40c620c2b8b4

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 0fb5fd45bd..fe87b9a28e 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8c941d91f1ae70edf053e0550317ee36f7944328844710922e1a482d5f63a407  rtl8188eu-db2131b227dd439587f37ea38927178286b980b5.tar.gz
+sha256  11b4d45992054e96493a67bf18746bec2e85b9329412210dda28fb504f4f6c96  rtl8188eu-806f138bec596aa5141ff80bb3a6a67b3c95bc22.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ee7fe2b796..e26b9032fa 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = db2131b227dd439587f37ea38927178286b980b5
+RTL8188EU_VERSION = 806f138bec596aa5141ff80bb3a6a67b3c95bc22
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
