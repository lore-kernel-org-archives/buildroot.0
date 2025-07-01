Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31302C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 19:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0544D611E8;
	Tue,  1 Jul 2025 19:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9w0CRfpzfB2; Tue,  1 Jul 2025 19:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3796560DCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3796560DCE;
	Tue,  1 Jul 2025 19:08:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E52EB8F
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CC30401D6
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 41P4csnBFvvr for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 19:08:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0254340076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0254340076
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0254340076
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 19:08:44 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id WgLSuTx4S8eo9WgLSuLwxS; Tue, 01 Jul 2025 21:08:43 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Kris Bahnsen <kris@embeddedTS.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  1 Jul 2025 21:08:37 +0200
Message-Id: <20250701190841.714026-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
References: <20250701190841.714026-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPaetpRX+Y9vzvURDsmOV4hcOQ/rzwSKlnxnMojitVJLGI73DfFBWuqTnjko41fmInFHdC7WqWwYU7QZHD2PES03qJyTqw+Lpm0S84XOEeiTYb4k0lP4
 /Uj7r1Gj/dxsYILd9irGIJB0xbpyGViNujdpRCQZ8iIntgv6X5EtyU+1NRNVeG86C910NJ1g45q20tyteoFcpImBUmk2pB4+dY6T8zlXvsJn39Ykl+TPVHty
 wVuv0V7jOcfIYwSC1RCNCCJqGswl1q7mH02ZhlGrtdoXLkpfIUJGEq0oIHW6H108tgpv9J92WUUBNTUa5PsJWy/3gUhEMt78uUdGG9Q9XOviuf83HNuNPcfv
 551DdfuINBRJN/R7m0+0ThEpSXT/DJ0kbHf7MejDzv/4CVVQ1QxkqK3upQnKk6UC7hoghr0m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1751396923; bh=H4wslrLrNMtQWPv/SECWcfLfur/bUFKp7Oj5kRXy368=;
 h=From:To:Subject:Date:MIME-Version;
 b=baEMKCunyEp/zpumZTs0pnVjQqdmPrmGoVS0QliVAHyONA/ieXwDdpX3k+1MzpAJg
 YgYREyE1PFU2mavUp/I3NVbDfnWsfBhyCBd+i6Fm3rPQRg3cS1oc56CEg2IIqVLZi+
 AQK6J8tKLUMDvHMnZ7ElxPsz9dP4Gx9SpLhu+Z/xWHZzcG5xmkibztkHRBVJImKHsI
 9dxJsOosxTeDhCP9vyY+teqDyp/lk0ko8fP8pz/d5TrMCi1GPL2sYpvYo5aK9+9jwv
 qVjPnuJTSfRe+DmLzuR1AcWpieFCCZmOuLSWtOZuvyjKnzpBZlMrct9JwGEv0aQIEs
 tC38s5QOQ/Nzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=baEMKCun
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2025-06-21
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

With this version we can build with Linux 6.14.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index eedbb46bea..1e1691e535 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  40a0890d3ea2d6d2b58748a9e05e20a14942c0f7652a0178e7466e8279106345  rtl8189fs-3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd.tar.gz
+sha256  8209950e00716c4731675bbf5ee6ee8d54b010e70f86245c70d5c85fddee5694  rtl8189fs-d0f15f392570499f3e48f6d157c89cadf393a739.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 800956a927..abd159f22f 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 3f34f380715b88e4a3ef049b3a60e2fc69ccc9bd
+RTL8189FS_VERSION = d0f15f392570499f3e48f6d157c89cadf393a739
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
