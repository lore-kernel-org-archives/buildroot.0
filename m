Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2084CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 18:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2F16089F;
	Tue,  7 Oct 2025 18:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwiJTU4mzKHM; Tue,  7 Oct 2025 18:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA2296086C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA2296086C;
	Tue,  7 Oct 2025 18:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BDBCDD84
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B3F880F93
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGGHObLtzNXK for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 18:12:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C00AF80F50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00AF80F50
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C00AF80F50
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:12:23 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6CAevIulPcq1h6CAfv9UVn; Tue, 07 Oct 2025 20:12:21 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue,  7 Oct 2025 20:12:20 +0200
Message-ID: <20251007181220.2696681-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251007181220.2696681-1-giulio.benetti@benettiengineering.com>
References: <20251007181220.2696681-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAjd5ALdy+QcP36RKHOV8cZw2f92zC1C2AigxTS3vOCpLN0NGxrfVkGH3I9vuk4+ndzQugKW+MgZYlJpqfIaSOrggtQJ3JG+Fe6yMDIvt6xT8+37QPul
 2WWQbFx5R4lNRltYz3mvjevO1NrwavoU8hR6NR9/YpJj/ygfc5dY7p3k36loNcl+7EuQkgd+ak0M6WLSdq92qje3wVKLEFMPW0EUd3pTO1TbqKKO7DyIBPmq
 ucWoauLGrYY/vhmxYkNUO9p704ebTGJVRZerjzIdkF+D1TvSSriCF1R3qPLBv3QtONq1UArA2x9DUAFtl2rOdLV6rY4E7c400HZYPzeC51H0SofJjhPs+5H1
 wmSCjxFO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759860741; bh=DurV54Fxn0exDHd6lwCDDP/mldaPQxYAISxAPHHT5fc=;
 h=From:To:Subject:Date:MIME-Version;
 b=NOeHbD2qaPc2X2k9USg1Zq361JCjXtEAf0/fJ+BaSQzF+5BCe2LQ4nIPUvAq7WKDt
 MImM9FafbPuRRlE+irdKiVq13XSBLyAX2pUozhtf56+cQoHOzRrT3eiFbD5OEVunoB
 qe6nDQI+hBtzYc0gdtYvFW/8FqB0fwmMEfDCxviPfgp5nH4J/LV4E2FoUEwdSRKD+o
 osA0jAcTfile2/O1Iy+Z6PmW1iOs9YIwQShgg1tV+qYl+jZ7UBUsNMQIwUSDNwnHpY
 Lsaj1r3z2AsEtpntP8EEillcy5vYWt8oRz5PCyaGycjPReDM7Y67reX53dxAC7CRrE
 4Kd06C1xwm8XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=NOeHbD2q
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2025-09-26
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

With this version we can build with Linux 6.17.

Fixes:
still not occured.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 1e1691e535..1640c1697e 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8209950e00716c4731675bbf5ee6ee8d54b010e70f86245c70d5c85fddee5694  rtl8189fs-d0f15f392570499f3e48f6d157c89cadf393a739.tar.gz
+sha256  4d8495b1b5a0c42ff0df775b16abd38103ad8532c53c0527f416484f8c2d477f  rtl8189fs-876e627a5b6a8021700391b4249a4a31edfebe5c.tar.gz
\ No newline at end of file
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index abd159f22f..45ad24e392 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = d0f15f392570499f3e48f6d157c89cadf393a739
+RTL8189FS_VERSION = 876e627a5b6a8021700391b4249a4a31edfebe5c
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
