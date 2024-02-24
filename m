Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850A5C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E185400F1;
	Sat, 24 Feb 2024 21:41:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6s9keTeNknd; Sat, 24 Feb 2024 21:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C205840242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C205840242;
	Sat, 24 Feb 2024 21:41:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A147B1BF471
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDC3400F1
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 21:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BDRJyr3IGCz3 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 21:41:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 40A2340242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40A2340242
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 40A2340242
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 21:41:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dzlhrJdaWQ6eAdzlhrtk9X; Sat, 24 Feb 2024 22:41:13 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 22:41:13 +0100
Message-Id: <20240224214113.58103-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKPvEbUAYox9iYAeccTfgO12WOdfLowg7ihUjjw7EI7yaRmGvcc0OpIupnDGnv/VNvbrpOYPJg9JaOcvAvAN2pZ5ClnPLDcBQEtOr0ZY1ds2nFcafC+Q
 lBG28PRtm9RsFE5/Uk8+vIFbW4FJ2nfMXM4bLfhwu52cWYJAGTypBTJp45CqBiZLvyUPooll81Bz+8aFoJrYiqnqMsZv4vywGAV8xbjIyI8tdOwYjKY6mWIL
 onEO0wTlRLmjjxhG+EkHKieD5SLBhOdlv6U6iZdMOjNuSlK3rlyMdN2U5vHWvoJbFaSTEDjGxZZaMcXNUjxG+A==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708810873; bh=xU4h/l1NUHqR0NmbCFLCg91gG5roOSpRkyfh6v50tFw=;
 h=From:To:Subject:Date:MIME-Version;
 b=lxh5VWcEOrYiqQ+YriNm+AZoikJIWzLyJ1tWSA2rrB2dGa+Sh2BjmpGR+pK4GC/I+
 Iv+s5qUHXtgNwvFbI44rf+4HiErQMQlvFWRCSDh9Dy2LpBr0tIbqq0Q6Jx7ijUJHlo
 JmlnmI5AnYBOluC7L6y/SnfGd3RX+KkfMCtffGIt3QEBFClUkFJpxG7h9RIXjNND6D
 EzIAUy38fYN4WZn5CpAdqddqpCNm3OUap5NeDtkffkg8Sg0KdYT6c+vDO9do+uyIb7
 9XQJUAKeDpA0pLbeXNB6IblhofLzOWe5BO7xx+2gwTqBI+sgFti9fqxn3KZYgk2EJ3
 LpuuXp3oclVXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lxh5VWcE
Subject: [Buildroot] [PATCH] package/mongoose: bump to version 7.13
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/cesanta/mongoose/releases/tag/7.13

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/mongoose/mongoose.hash | 2 +-
 package/mongoose/mongoose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
index ed5db5ebf6..716833eeed 100644
--- a/package/mongoose/mongoose.hash
+++ b/package/mongoose/mongoose.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  91e719e164816b349be3cb71293927f3f6abbe3fb02187e2d9b5e56f542c2063  mongoose-7.12.tar.gz
+sha256  5c9dc8d1d1762ef483b6d2fbf5234e421ca944b722225bb533d2d0507b118a0f  mongoose-7.13.tar.gz
 sha256  4ba646f5a7012d8b52f3a74398e446f56960dde0572f7241a2215430da5dd5a2  LICENSE
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
index 74594ff48c..e2e3be790a 100644
--- a/package/mongoose/mongoose.mk
+++ b/package/mongoose/mongoose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONGOOSE_VERSION = 7.12
+MONGOOSE_VERSION = 7.13
 MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
 MONGOOSE_LICENSE = GPL-2.0
 MONGOOSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
