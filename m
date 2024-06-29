Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB4EC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 21:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6EE2A4069E;
	Sat, 29 Jun 2024 21:47:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SGGEuOfNxrE; Sat, 29 Jun 2024 21:47:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39246406EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39246406EE;
	Sat, 29 Jun 2024 21:47:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 980371BF315
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 21:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D6A64069E
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 21:47:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5b2DXDoozE7n for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 21:47:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.147;
 helo=smtpcmd13147.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2A064406EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A064406EE
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2A064406EE
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 21:47:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Nfuus05nM8U42NfuusxaQ5; Sat, 29 Jun 2024 23:47:32 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 23:47:31 +0200
Message-Id: <20240629214731.202318-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBS2VnOyJVUtOeMBAucimTy9oNCmGhG85pADjqzuVzGl+qrxvlwUof9wKLzkiL+Ld0wK8bA8cqZkxZVO6gPmMKyNEVxUQEGNL1EsyDfZhcc10ZfaWEAo
 3WAcuMTGXAOCqhD4sxUD2t9va6r9bKCDgI0y9vA7vM1dW+JNQ3rbKq9ZYByS75ywRCPmpF1RWQWxwxSnXj9SdBeL4BIW+3RbrnIZP+NtdpcP4QqifkhspWS8
 dxCLo6OX+zdyzQmRey222Mt6fJxPDttYGyhFcI6QOnp5ZPwizNk0lF7lgDNRX51e7hJZViB5NpKaLZCfGXixyA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1719697652; bh=leylUF0SQF+PBGadUP5+b+hxAjIn1m6VAQaNlS19ngY=;
 h=From:To:Subject:Date:MIME-Version;
 b=aKxIYIfXxCedr2lMBwA+7TdybnwR+TmZgq5I+YxJ3Pje0I/j9HRM7DZA0NvTat4eh
 5EEh/8NsXw0WtoA7B3a4OIfpLDDG4Ne3K++WOk3d8dSLI8JlD/ij+p97vIqjzXTU9D
 a+1phHVGK5Y/E7IdtEF3C3BUpd3eSkJ0Lb1VwLy7UUo/ZkgAgISMl3JlLticQk8XpL
 RQOUbP/nRrKucSmiI4trg3iu+JKDnF56MvtlWs+ic2F9Byz8PPW9bCG8UaNQl+j21o
 gdMdboQuO2rI/RkEmvpseiPV169tZq1RLnbQYNDtYcltE/oEhbGmzCJ/+SwPpqJfDg
 WU4y3NHfxAs9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aKxIYIfX
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.101.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 1a69398f0d..ccc5951929 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_100_RTM/src/SHA256SUMS
-sha256  1e35373ce9cb5b776f678bb341b0625c437520d09ebd91d1abd622e072e38d88  nss-3.100.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_101_1_RTM/src/SHA256SUMS
+sha256  f20e8c5daafd89419d229ec8c54100a5c320dce1467377c9dfcd5e4d8446b468  nss-3.101.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 5cdc494b16..60ffc92b1b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.100
+LIBNSS_VERSION = 3.101.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
