Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43921C4828F
	for <buildroot@archiver.kernel.org>; Thu,  8 Feb 2024 08:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCD9D41744;
	Thu,  8 Feb 2024 08:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbTLKHw4EvNc; Thu,  8 Feb 2024 08:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B591141A13
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B591141A13;
	Thu,  8 Feb 2024 08:38:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7744A1BF831
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 717AA42F5E
 for <buildroot@lists.busybox.net>; Thu,  8 Feb 2024 08:38:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1KUbUwtxNWjO for <buildroot@lists.busybox.net>;
 Thu,  8 Feb 2024 08:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6B5240857
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6B5240857
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6B5240857
 for <buildroot@buildroot.org>; Thu,  8 Feb 2024 08:38:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CDCD124000C;
 Thu,  8 Feb 2024 08:38:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rXzv5-002Dbh-0L;
 Thu, 08 Feb 2024 09:38:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu,  8 Feb 2024 09:38:04 +0100
Message-Id: <20240208083805.528949-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] boot/shim: security bump to version 15.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2023-40546 mok: fix LogError() invocation
CVE-2023-40547 - avoid incorrectly trusting HTTP headers
CVE-2023-40548 Fix integer overflow on SBAT section size on 32-bit system
CVE-2023-40549 Authenticode: verify that the signature header is in bounds.
CVE-2023-40550 pe: Fix an out-of-bound read in verify_buffer_sbat()
CVE-2023-40551: pe-relocate: Fix bounds check for MZ binaries

https://github.com/rhboot/shim/tree/15.8

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/shim/shim.hash | 2 +-
 boot/shim/shim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/shim/shim.hash b/boot/shim/shim.hash
index c9c489fd2f..5aa4ca06e8 100644
--- a/boot/shim/shim.hash
+++ b/boot/shim/shim.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  eab91644a3efe91a666399f5d8eb3eed0e04d04f79d4b6c0b278ef7747a239a5  shim-15.6.tar.bz2
+sha256  a79f0a9b89f3681ab384865b1a46ab3f79d88b11b4ca59aa040ab03fffae80a9  shim-15.8.tar.bz2
 sha256  15edf527919ddcb2f514ab9d16ad07ef219e4bb490e0b79560be510f0c159cc2  COPYRIGHT
diff --git a/boot/shim/shim.mk b/boot/shim/shim.mk
index bbef81cfc4..19b11f4086 100644
--- a/boot/shim/shim.mk
+++ b/boot/shim/shim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHIM_VERSION = 15.6
+SHIM_VERSION = 15.8
 SHIM_SITE = https://github.com/rhboot/shim/releases/download/$(SHIM_VERSION)
 SHIM_SOURCE = shim-$(SHIM_VERSION).tar.bz2
 SHIM_LICENSE = BSD-2-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
