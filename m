Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01DBE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 09:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46436804D2;
	Sat, 28 Dec 2024 09:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dl8QEPFl9MiJ; Sat, 28 Dec 2024 09:32:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53F808034E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F808034E;
	Sat, 28 Dec 2024 09:32:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03901E0
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC4DF80D57
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3Weoo12H0r7 for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 09:32:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B98F480D52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B98F480D52
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B98F480D52
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 09:32:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id B6102E0003;
 Sat, 28 Dec 2024 09:32:14 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Dec 2024 10:32:13 +0100
Message-ID: <20241228093213.3047356-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735378334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wFbJMuyq35G7sGkkZ38c51VQ06iO1njmUdsQ0xkjN0E=;
 b=NTk77fv/3RMlZgv8YLKeokBdGlvy9inAFxyP9OhUmdRhf5VBPnki6nj9ln2bGGj3CpURfV
 FibFqneKz6D1rW1rKAvHD1eEGKSAof5jU8BtvQhBcMKWzXuB2n4UJ74dCpWP1CvFPDpW7z
 3D1HjeYo7l/A8Rk5JRCMMIBiElf6i93jcpaUhn1fwpLsupCr1yE2HWoQmph4AYkX1spjyn
 Gbl3jYSvfPAAz1UIRVmtxyD1DOqcasB1O7T7lL1+MwCFUmyE+kLA14HdPpOvnPBOma4T1P
 zdJ/GpkfppseULzoqn4JE/uGadaEw7uPcPtc7SN6jp1hsFLIpaI+xgTF68yEQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NTk77fv/
Subject: [Buildroot] [PATCH] package/mpdecimal: bump to version 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While 2.5.1 -> 4.0.0 may seems like a big jump with lots of versions
skipped, in fact 4.0.0 is the immediate next release after 2.5.1.

Changelog at:
https://www.bytereef.org/mpdecimal/changelog.html

Build tested successfully with test-pkg, including with the one
reverse dependency of mpdecimal: the python3 decimal module:
https://gitlab.com/tpetazzoni/buildroot/-/pipelines/1604635008.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mpdecimal/mpdecimal.hash | 2 +-
 package/mpdecimal/mpdecimal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpdecimal/mpdecimal.hash b/package/mpdecimal/mpdecimal.hash
index 81150c7575..6e5f4cfcf8 100644
--- a/package/mpdecimal/mpdecimal.hash
+++ b/package/mpdecimal/mpdecimal.hash
@@ -1,4 +1,4 @@
 # From http://www.bytereef.org/mpdecimal/download.html
-sha256  9f9cd4c041f99b5c49ffb7b59d9f12d95b683d88585608aa56a6307667b2b21f  mpdecimal-2.5.1.tar.gz
+sha256  942445c3245b22730fd41a67a7c5c231d11cb1b9936b9c0f76334fb7d0b4468c  mpdecimal-4.0.0.tar.gz
 # Locally computed
 sha256  b07528d8b1dbf1e2d2741052996f0876e23342ce2d30d0effa39c5457716c25a  LICENSE.txt
diff --git a/package/mpdecimal/mpdecimal.mk b/package/mpdecimal/mpdecimal.mk
index aa322df340..212af5b7ee 100644
--- a/package/mpdecimal/mpdecimal.mk
+++ b/package/mpdecimal/mpdecimal.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPDECIMAL_SITE = http://www.bytereef.org/software/mpdecimal/releases
-MPDECIMAL_VERSION = 2.5.1
+MPDECIMAL_VERSION = 4.0.0
 MPDECIMAL_INSTALL_STAGING = YES
 MPDECIMAL_LICENSE = BSD-2-Clause
 MPDECIMAL_LICENSE_FILES = LICENSE.txt
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
