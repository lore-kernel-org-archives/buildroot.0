Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E26C28B30
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D619A409A7;
	Mon, 10 Mar 2025 22:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LghEFM7zj6-h; Mon, 10 Mar 2025 22:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F311140753
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F311140753;
	Mon, 10 Mar 2025 22:25:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8ED6594A
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E4EC80F50
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BTdq0rJOrs7U for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 22:25:49 +0000 (UTC)
X-Greylist: delayed 426 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 10 Mar 2025 22:25:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5757580EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5757580EE7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5757580EE7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:25:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id rlSJtaJMYfFewrlSJtcjI9; Mon, 10 Mar 2025 23:18:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Simon Dawson <spdawson@gmail.com>
Date: Mon, 10 Mar 2025 23:18:38 +0100
Message-Id: <20250310221838.176632-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfErpqA7Pk6DeLgpkO9IEOTjnU/SspgX1ARzqAS6/p6lUmUreRsaWp0VK2KJan1Ctm5yVRR+pVoHqx+8si6pr4kwxJsG2T/+rcAKn9KC/Hf9+4zcuB/jw
 B1X7c0kpv4MgP1oVWRnDc61n/+R4RUZv4n2ZjXhdKtWhF+ZBy5iUKIGZ9JEypNLOKz+lnhXTkg/17+TkRQi/hB6IMgYXplV3mQErwOTLFDQ0zQ74I0iyVaHW
 KOUYIc2FnsjAuHJ6gcYNgMzsz5TOoOGUn1N2+06pgNZbQCJfJxnmHYQJ0CtWLOCHDySPSYTBQOiLJozyUzlzog==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1741645119; bh=aU017PT9rT55OLoizib1qqLbwhZp/uEr7rmm0TqX4TY=;
 h=From:To:Subject:Date:MIME-Version;
 b=j8Ep+CddeeVtChO+si7R1NqsB4/lai/gdXHvGiag5g+EnKKLfXa3NEP0whJc7suxR
 vD/xDcSI7cA4T5Bl/jdMzbvzbXg1izBZ+wh6m3BBNXK3lY3OiwwGXkzCrVKDwlUmF8
 Md1tL8bJmSZzkON++tDWUNT5775ZoU8w3j7JBPOs/HxtV77qzJsTCdET6InN4dxqqw
 g0+JX2o4XOOg7N73BCB5vXfbSRrr6HFJBaN1+6Y/BX+ALwo4zV39d+nPagqgRzx8Pk
 RNn3cXvmNS3CeqhptTX/8tpb466Um19NFzcHzu5z33GP8p4Ud+dki3T5Z8AvG5UoIX
 ZkXuyhYOrcbwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=j8Ep+Cdd
Subject: [Buildroot] [PATCH] package/minicom: bump to version 2.10
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
https://salsa.debian.org/minicom-team/minicom/-/releases/2.10

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/minicom/minicom.hash | 2 +-
 package/minicom/minicom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minicom/minicom.hash b/package/minicom/minicom.hash
index dd10450262..92a50d010c 100644
--- a/package/minicom/minicom.hash
+++ b/package/minicom/minicom.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c  minicom-2.9.tar.bz2
+sha256  90e7ce2856b3eaaa3f452354d17981c49d32c426a255b6f0d3063a227c101538  minicom-2.10.tar.bz2
 sha256  cf80a758014eefbf068afffe3d462fc34ff4f528527524d8e100329c42094e15  COPYING
diff --git a/package/minicom/minicom.mk b/package/minicom/minicom.mk
index 8bc5717417..0c9b1ae434 100644
--- a/package/minicom/minicom.mk
+++ b/package/minicom/minicom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MINICOM_VERSION = 2.9
+MINICOM_VERSION = 2.10
 MINICOM_SOURCE = minicom-$(MINICOM_VERSION).tar.bz2
 MINICOM_SITE = \
 	https://salsa.debian.org/minicom-team/minicom/-/archive/$(MINICOM_VERSION)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
