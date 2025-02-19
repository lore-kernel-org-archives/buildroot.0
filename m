Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82912C021AA
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 21:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063F1610E7;
	Wed, 19 Feb 2025 21:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-7yqMbM3N4U; Wed, 19 Feb 2025 21:05:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B8F16116C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B8F16116C;
	Wed, 19 Feb 2025 21:05:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA8FCF
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A698E606A6
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:05:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3fIS3pQoeIo for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 21:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 592CC610E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 592CC610E7
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 592CC610E7
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 21:04:50 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id krFQtzoMrtr9dkrFQtXaia; Wed, 19 Feb 2025 22:04:48 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Wed, 19 Feb 2025 22:04:02 +0100
Message-Id: <20250219210402.146462-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDtwbJq2cFVgdoAjqCoeydzj6407PvFZMl5uI/HTl4KXNiU+dgSANPaZ4ud2RzMT1y00oTtMRzsjorOhuR486TTnky5gDfs0JWhKuUZUQMc7mpcVqDR+
 yw4SBU5v1/nhA9fjXD1o86cp7mPFzlFNZEAycfX4w+bZTjbFhgf07o/bEGed10PTRlDgMJuC/xFNTF6mR27xnD5YE+yf+B1xxaHXuRcbNgZBoDsgMK01aFsn
 JrpspORI9auZGNC+S/w+Tkbfkngo9aZEwvzmCRPkQQKzyfVq/eu3TuC68jFdSIA43i5y/Sp6ZRjAX/HKHydjcg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1739999088; bh=kvnziuCB0/pYp+Nzq8tkyZPnbJmKx9lkXAAWt7eqJjY=;
 h=From:To:Subject:Date:MIME-Version;
 b=nEhngdM9JfIfLDcI7HbeERoEXVbM76llQ2Gq+cY8wEC1n1SAZRgoet91ExTw+2iPe
 E63+uvjd5E/3XFFtDNdRG1Vg2hkJ5xSf15rcqjzvfKFZQaedCktZKxF3sG82M+4Stz
 v3CqKpZPu6+68BYkIfRUIhXXNQm5sD0/nVsSS0qK6IXbC1ipRMNQoeIbqO6p06TV7v
 bNDN4gTS6ivu7Y9D19x5JtcjTib7jE1MfV5qFCC8TrejIY9CyxKnG5dLrkz+mzOGC4
 p8UROdbIhtZ60Wgda2BUYBD19r1fGftkosgYo5TPtRCpogLGUJRCSV9HsFjg4OiMcV
 kSDrsxXmYoGUA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nEhngdM9
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.17
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

https://github.com/cesanta/mongoose/releases/tag/7.17

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 4 ++--
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index 15aa2b35ba..18b5e222ac 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f2c42135f7bc34b3d10b6401e9326a20ba5dd42d4721b6a526826ba31c1679fd  mongoose-7.16.tar.gz
-sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  LICENSE
+sha256  b6a6f69912c2cd0c67f85633c6b578d4dcdf385c3628acdcd21de28787c676e5  mongoose-7.17.tar.gz
+sha256  9abc2509d90c01ff2a0c91abf73582cdbcf1d2dbcc0b7973097eced43cf4cdd4  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 9ec6423e93..b41f6a054d 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.16
+MONGOOSE_VERSION = 7.17
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
