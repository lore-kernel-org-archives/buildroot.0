Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11292C83F01
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 11:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67EDC4042D;
	Sat, 26 Aug 2023 11:23:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67EDC4042D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ak6WwuidiGrI; Sat, 26 Aug 2023 11:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF23E4038E;
	Sat, 26 Aug 2023 11:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF23E4038E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57EF71BF5EA
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 11:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E92383AB8
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 11:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E92383AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SvA69wdo4Hh1 for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 11:23:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 957E883A8D
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 11:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 957E883A8D
Received: from fli4l.lan.fli4l (p54a1bff9.dip0.t-ipconnect.de [84.161.191.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0833A4C0980;
 Sat, 26 Aug 2023 13:23:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40526)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZrNx-00051N-1q;
 Sat, 26 Aug 2023 13:23:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 13:23:21 +0200
Message-Id: <20230826112321.91916-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693049002;
 bh=oZ8gyWPjlUQcCeOxhXpIXY5Nzu4nHTEmNSyvnEirxkw=;
 h=From:To:Cc:Subject:Date:From;
 b=S0aF++4TW/Fol5RqIcntjEItaSSQM54GWvwj3/3Sd0rWGKc5/FAcHvkHVt23T5jLa
 AEBKLGddrKpA4dq38EgWL5fp7EGiECmGsejBpeKAvQUxkN1gBNMgz3157IyvTQaEOB
 b7o2JXKJ/ncR83zVQ8I1wNF+c+xP26V0IEwyQXC9C82zQG2ylRMaoRCFmRX3ULdgqJ
 Ty0SP8LxfvC40xzbhXOMrstAQgIbtwZqTtlTBWuKc+AKSpe7IbgnS4YRQp60K6DIZ3
 hFm1Uwiol5Y+1KIcBqnmaN+iYkoNgyGbZYrq7Im0i/LRJ+8jtPLuG5BDb2xbsd7du8
 7EPvAtypesSGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=S0aF++4T
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump version to
 3.11.5
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added md5 hash provided by upstream.

Release notes: https://www.python.org/downloads/release/python-3115/

Fixes CVE-2023-40217.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 4 +++-
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 6c43e01a44..1a0fee3290 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,5 @@
+# From https://www.python.org/downloads/release/python-3115/
+md5  393856f1b7713aa8bba4b642ab9985d3  Python-3.11.5.tar.xz
 # Locally computed
-sha256  2f0e409df2ab57aa9fc4cbddfb976af44e4e55bf6f619eee6bc5c2297264a7f6  Python-3.11.4.tar.xz
+sha256  85cd12e9cf1d6d5a45f17f7afe1cebe7ee628d3282281c492e86adf636defa3f  Python-3.11.5.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index bdb7cfd22f..5f8fa5b58d 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.11
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).4
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
