Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAE6C0218F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 13:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBDD81011;
	Fri, 31 Jan 2025 13:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ca44hG3bBfuM; Fri, 31 Jan 2025 13:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF73581FFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF73581FFA;
	Fri, 31 Jan 2025 13:56:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C92F16C
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AD7C40730
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ztNLyFXsz-1s for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 13:56:49 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 31 Jan 2025 13:56:47 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D30004066E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D30004066E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D30004066E
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id drOttxjEyFcEPdrOttgA5y; Fri, 31 Jan 2025 14:49:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 31 Jan 2025 14:49:35 +0100
Message-Id: <20250131134936.113567-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBop67sbyL+stgwhKE5oZ9jdRtX1S0FZG3cbnGdJubk+BBeGBysyRVjyofYHxq2CmQ1k8vW9PSppUlSopfi5Xh126wAudea9KcqQA5pTcS8hlbR0H4vS
 IQ5F8WkJMZJU9IisgVumfql4/X23lZZ4o8+T0mJfM6/CTMenEi4T2xQZ1HFrRyzI4uDgFCoW7UWVOPRc4TePTpxzhqgjrSqkwlTNoKJaEP9HdyfgkUOH5hEf
 TAMeUA9Fe21oqKQXX4AIiyNmFFcmOlz7NFd3y9q4y9hXHT+aNGc89ak/bWHq/WWEiMW7NB6C4WiD5rmD7srzZ/zWOpBPE6DrWXsg9/0spxH5aOKmLiijIJ9z
 zO9H48b9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1738331379; bh=IYRaxLT9E91GbZ7vLA8szS+wgHFkQ9ExjkCESyidCpU=;
 h=From:To:Subject:Date:MIME-Version;
 b=PMZ/4GhQ2emonL60w7rA5xSe/yscgerReSb3B0w3koRUflkC7r22PKN2j9rEWJfYz
 HUeNgHjc48OgRGvnAJTjX+p61D87YOyaAlgzWzCyItErip4lX0bqtKMLnzegIW5NOB
 p3r0EeLohnvuJ3UQfQG2dKXkEr4wYWrPvhxWHsHKz6WVcCP5W6uiJhVAGQARKvnGFD
 +rAMccMJmGdJfCUwnd7+1ihcNVXHQ2uJNvj2LRz/YLttnZHTrxerwPrssGlB0hOLAO
 +QVftpZYgw+5OT0gSC8qz+mQVeFFaz2oEXswYqPBQWQrWDlK3jT4zq3WFuxVqT9U0n
 WbxGG7mjH3WOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PMZ/4GhQ
Subject: [Buildroot] [PATCH] package/rtl8189es: bump to version 2024-12-29
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

With this version we can build with Linux 6.13.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189es/rtl8189es.hash | 2 +-
 package/rtl8189es/rtl8189es.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
index 1b1aefdd5c..4b176b56a5 100644
--- a/package/rtl8189es/rtl8189es.hash
+++ b/package/rtl8189es/rtl8189es.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5ab565057ac81527ac579edfdd2a1e42b9ceb2f2924b2ade88a11849443789e4  rtl8189es-30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa.tar.gz
+sha256  12bbf8e8c67722f6d350727aea3e9aeadfa9234e64756f3342fd3aac417a88f4  rtl8189es-6b4cfb5c37f10c099d330ece54436706161c2f2e.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
index 11735ba112..cbbfebe675 100644
--- a/package/rtl8189es/rtl8189es.mk
+++ b/package/rtl8189es/rtl8189es.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189ES_VERSION = 30a52f789a0b933c4a7eb06cbf4a4d21c8e581aa
+RTL8189ES_VERSION = 6b4cfb5c37f10c099d330ece54436706161c2f2e
 RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
 RTL8189ES_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
