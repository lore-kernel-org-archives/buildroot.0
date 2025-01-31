Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C70BC02194
	for <buildroot@archiver.kernel.org>; Fri, 31 Jan 2025 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 087B84066E;
	Fri, 31 Jan 2025 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5Y_1Gj8YSD3; Fri, 31 Jan 2025 13:56:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFEB740730
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFEB740730;
	Fri, 31 Jan 2025 13:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A588B16F
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 954E381FFA
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjcnA3l5uHhI for <buildroot@buildroot.org>;
 Fri, 31 Jan 2025 13:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.177;
 helo=smtpcmd15177.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4AA381011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4AA381011
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4AA381011
 for <buildroot@buildroot.org>; Fri, 31 Jan 2025 13:56:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id drOttxjEyFcEPdrOttgA67; Fri, 31 Jan 2025 14:49:39 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Date: Fri, 31 Jan 2025 14:49:36 +0100
Message-Id: <20250131134936.113567-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250131134936.113567-1-giulio.benetti@benettiengineering.com>
References: <20250131134936.113567-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfBop67sbyL+stgwhKE5oZ9jdRtX1S0FZG3cbnGdJubk+BBeGBysyRVjyofYHxq2CmQ1k8vW9PSppUlSopfi5Xh126wAudea9KcqQA5pTcS8hlbR0H4vS
 IQ5F8WkJMZJU9IisgVumfql4/X23lZZ4o8+T0mJfM6/CTMenEi4T2xQZ1HFrRyzI4uDgFCoW7UWVOPRc4TePTpxzhqgjrSqkwlTNoKJaEP9HdyfgkUOH5hEf
 TAMeUA9Fe21oqKQXX4AIiyNmFFcmOlz7NFd3y9q4y9hXHT+aNGc89ak/bWHq/WWEiMW7NB6C4WiD5rmD7srzZ/zWOpBPE6DrWXsg9/0spxH5aOKmLiijIJ9z
 zO9H48b9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1738331379; bh=RqvmU5ZA19TPQaP4m5iYu7MCYTkjAe1ul4x6Xe+kZ0E=;
 h=From:To:Subject:Date:MIME-Version;
 b=lABrKQCSbanieW5xJfdktAce0UPL4rD6/we58w9VxBqSx7xg9KeZ6HJiQxdXuQAQ9
 9AHJjzQfCvQNDFI6BkWKRZGkI5QV6r1jZb2XBvFvgaFEbZZkVNeVD+4g196BnaTaoO
 oupPCp4kjBkAqIy2I5lJlY0soYEJPh0pWLts5XSRtoDNgjXjoV1awLmFCm9YEMqumM
 /EzFSeIQbNKwQ6rzBn/veDLgyXqSBUhkkSH/6e9JjKd9oQMRpxy2bpKcC9W/klIwB5
 H7ky+ymRxGYmeuD8pNJZMMcqHC1Yd0yVT7Nuu7hnEALYmCRd/qnctT4TgWSwvPCS6V
 a6oGab0VshkNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lABrKQCS
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2025-01-13
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
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 5ed0bbd376..cca58ee3cc 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a5063b1554acd08bcc084926d1ff80148fe8521a6aefb7061cae68b7c4a7cdb1  rtl8189fs-9a82349c2c40515f9d20b9f6721670f76b4e1c7a.tar.gz
+sha256  a621c0df9372d952449a06abb82f1edb806ad3200f9b1dd54fa9beab08d81b92  rtl8189fs-94cc959d56c1425fbca4f6e49e949cf58ec5dc8d.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index afb8685bac..33afb011e1 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 9a82349c2c40515f9d20b9f6721670f76b4e1c7a
+RTL8189FS_VERSION = 94cc959d56c1425fbca4f6e49e949cf58ec5dc8d
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
