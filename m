Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3966C02199
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 20:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CFF4417D0;
	Wed,  5 Feb 2025 20:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7mpwpLLgftmq; Wed,  5 Feb 2025 20:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F1042514
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F1042514;
	Wed,  5 Feb 2025 20:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A29FE12A
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 928EA837C0
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXcXQ6uIXm3C for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 20:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.86;
 helo=smtpcmd0986.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B597783748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B597783748
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B597783748
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 20:33:57 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id fm5qtcXXKS934fm5rtLkaB; Wed, 05 Feb 2025 21:33:55 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed,  5 Feb 2025 21:33:54 +0100
Message-Id: <20250205203354.95410-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBrVLRAOtppQlHZqxPM+XcuTgZue3tjcPcCcZTQB77ZR5NMtoDSZ4xYeG9j6VgEoR+C3wdpzBvOcGRA3ae8ZrKMzyXwLP4UZmkbB4qjRBU2tyXxOlPpt
 67MyfUDHsJWcF3Rz2/DO+4iWll82eFCX3nGh7yNzndequFpIIp5v2impXYeBjCGY9fVIS8e7ewuU1Enm7G9/+sKXOXhfvbMRRVgT2Aw2WOPFHpNOviSJswme
 3aoODfHd9S7BsB3rb873xa/FO6VpwxJ2B9ByIk2LO/9g9AQJuVmZCCCGoeDnXNeK4vYKFDTFhYqz3Hseg3EB1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1738787635; bh=C4Z48vMep6zn1Hrdisawtz/f5C4oVmSvSwhxRVZBtDs=;
 h=From:To:Subject:Date:MIME-Version;
 b=THdyYPq/uwgS90BPRffuqoe22B6dMrXK/tszX+4HBBvW14g/AyitvgU2FhvR+GHO9
 NVZOGIQFutDAZwnFfNu7aZYQpZYx0AuPtrPe1cpWQAwM/8KkkhbplaYfPEJL6970p2
 sELg8EI38a6Wpk0YcUz3YwHtOluHYFn05IbL2u/IkHQXDSDA6TkxY+jzowCw3IywY+
 vbuC2b4fSxZcp4E/TQr50MtUOJjJwx+b3RCINJBkLQoRA3R0AQM/6bQ9YxIwLzn8mJ
 lnzZBu0ajZEtwiAZJbnEihfrc0hib+1ZNCeMiJiLKbhuXok7mTh+gy/WGMcHwMaOMk
 QoYScxNvI8GWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=THdyYPq/
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to 2025-02-03 version
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

This version allows to build with Linux 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 250cd556b1..0a6b643e94 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  dbd565edc8d52a1429d8551795fb4da3ca44cf27867466010e0e6d00c86aef5c  rtl8192eu-6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb.tar.gz
+sha256  b5568e5a48e99839ec76359e11da29705e80cbfcae210c68eaea4bf433760f6d  rtl8192eu-c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965.tar.gz
\ No newline at end of file
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 9cd88060ce..de54f03bc9 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = 6755ce9c15bbcb5dcffbca7f6f08e661ccdaacdb
+RTL8192EU_VERSION = c56c37f7ce8b8f1fd17c9719a9ea668dc1e45965
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
