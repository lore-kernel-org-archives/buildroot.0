Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FA2D6A221
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 19:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 461E2407C5;
	Thu, 14 Nov 2024 19:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adD-cLfEZkdf; Thu, 14 Nov 2024 19:02:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 049F3407CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 049F3407CC;
	Thu, 14 Nov 2024 19:02:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B66FF968
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 19:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98367407CD
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 19:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3pwyUikjFOo for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 19:02:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E41B5407C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E41B5407C5
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E41B5407C5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 19:02:21 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 74E20440FAC;
 Thu, 14 Nov 2024 20:58:45 +0200 (IST)
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 21:02:10 +0200
Message-ID: <f1012c843a68027c24f3e7f482a63f7d23a3f13e.1731610930.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1731610725;
 bh=ibMSj+yWF0dEbonQAHhn2H4cClTRGQz+oF2+Bk5lEkM=;
 h=From:To:Cc:Subject:Date:From;
 b=yXBMahyjsDtGbFRU6F3P5uhglmnmTaYlHS2kyMtCtacP3K2x5jUCsc0QZFD/pJcYp
 BVZK3fbu8iO5QfZAatAKc42KtKVc6jkVq9EKKJ3UONw7fNYwkAMI0fJSKFRGW1IjvA
 WOmdpDk1A7y9ArjM14BVew4GK4U1Ub+9geDsvvzRpOvA0sOr4f9pP3dE0mIE0o8jwS
 Qwz8Yoqh/mVby3c8cSqzVQwXMler4OXjkIZAIVVzfEjgknDQmb7DD5NtlYHriDR/ro
 jrK1zgVn5FMRRe1hihOecm4s08qqm0RSMus34cGtWdKwrlUrN6onMLYPr4OICTgVZc
 QgKY6QTbjYl4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=yXBMahyj
Subject: [Buildroot] [PATCH] package/socat: bump to version 1.8.0.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update README hash for changes unrelated to license.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/socat/socat.hash | 6 +++---
 package/socat/socat.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/socat/socat.hash b/package/socat/socat.hash
index 2a14d7530301..70c6e6a8f1c5 100644
--- a/package/socat/socat.hash
+++ b/package/socat/socat.hash
@@ -1,8 +1,8 @@
 # From http://www.dest-unreach.org/socat/download.md5sum
-md5  51f9ecdf5d942d0a3c150ea400eb89ef  socat-1.8.0.0.tar.bz2
+md5  e53a6e8e8594ac87476fe4ae361bbcd1  socat-1.8.0.1.tar.bz2
 # From http://www.dest-unreach.org/socat/download.sha256sum
-sha256  e1de683dd22ee0e3a6c6bbff269abe18ab0c9d7eb650204f125155b9005faca7  socat-1.8.0.0.tar.bz2
+sha256  6a283565db7cf86292c6f70504c58abb03e29888adeed5a6c5f3457e803c1b81  socat-1.8.0.1.tar.bz2
 # Locally calculated
-sha256  de9d702354b2e748ea87eb20d18c3d90ebede5dc6d2fc3c2e0645d139a5181bc  README
+sha256  6c07bae42bf0a919c9dd6583f76cc9020a472652dcdad3e84923074a1f412d75  README
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  fd9e48ca316a5032069b9521f4f4b4d9b1c60365012bae1e62286bcd5bd2e761  COPYING.OpenSSL
diff --git a/package/socat/socat.mk b/package/socat/socat.mk
index 7f634c28f09e..84d9cd3cf84d 100644
--- a/package/socat/socat.mk
+++ b/package/socat/socat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCAT_VERSION = 1.8.0.0
+SOCAT_VERSION = 1.8.0.1
 SOCAT_SOURCE = socat-$(SOCAT_VERSION).tar.bz2
 SOCAT_SITE = http://www.dest-unreach.org/socat/download
 SOCAT_LICENSE = GPL-2.0 with OpenSSL exception
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
