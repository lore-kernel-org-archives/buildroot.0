Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 239B1C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 19:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B5A40946;
	Sun, 19 Mar 2023 19:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2B5A40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dT4LM1sn5JS; Sun, 19 Mar 2023 19:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD918402CA;
	Sun, 19 Mar 2023 19:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD918402CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C107E1BF59D
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7621402CA
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 19:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7621402CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENZ5PlhXmDMa for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 19:44:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CF1940068
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CF1940068
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 19:44:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.96.213])
 by Aruba Outgoing Smtp  with ESMTPSA
 id dywmpm7TP7jrRdywmp4Qhe; Sun, 19 Mar 2023 20:44:04 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 20:44:03 +0100
Message-Id: <20230319194403.450205-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFvrKskd6IF4PsF9+kOSJy2E0fizt0Ie/5sj8F/vr/oau1Ws24DCB4MsOVU9XBFwQDT9GJC/wX0JY0KVnVwZ8slX4sIXOPQaddv5G2Qn97upqd1o99Ou
 Jqo5XuOOIgWXlyURGuHk3R3BCV4L6fpBjyLfnlF7n8kHLx33EgTtJqzRY8WETSU2xgHFYRpEcu672HLQSdewtvjMT8UkV7s9HNHvedJbFvFblXSWX+J67IA6
 Zo3TVrHwEumqF0t9Mm2tbd7adT7r5vLrf3S7gJWIcxTym9vccjFAM2s3VhIUEOq8A9kqmTlg6wT9/DNeKJmRVA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679255044; bh=kpF0WOpMq3HbBcq+r6g8aGhs0igFyCUCA5rVxIVqmR0=;
 h=From:To:Subject:Date:MIME-Version;
 b=nEW2wxTXLBaDuJStgfg+EJg5bR2VYtoYgxY/f6FDc87ps/7RTkD4Bmk+3TwncaA1K
 9c5gE/wqet07UPtFYsU5PKMgNShtd46lF8JEO3kmKh8zvFcIgWdrRPv5cBioM8qcSn
 cpkeB40iE96zAzzjBWllLsaC0BUT5i+xbolRGh/HZINj19kvyMlc781q2mwDbtlKL7
 x+2XK/HaqSlddrWQm/v5t6IIok3FNYm6Wb0d7NVGJ9x9A7NNXQtS5jzsSOEsBxiwA3
 rg6NKTv/p2C+lY41mHi3wC1+nkA4S3c8MeNY4owAdetbF1q9fQMtplQxEB2O0JbpVZ
 g5zTbaluvSvDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nEW2wxTX
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2023-03-19
 on main branch
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this bump Linux 6.3 is supported.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 4 ++--
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index e2d83adc0f..45460d6d12 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d090da292c3f9322603846467a80278670211fcde3354dcabfe32c449992493  rtl8821cu-69c903b75bde36293c66b25c051916a74dbadf58.tar.gz
-sha256  af54d00efc57cfce664171ac8be2a20c0f290b1b5c1a67bb2eba7b6380276c4e  LICENSE
+sha256  32589c3ac3ffde6de3ecaca83570ab07a2b92a66e3265294b0469375b007a480  rtl8821cu-80781de376007ecd778dfb2bef05533e3a6cc7c6.tar.gz
+sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 5a93376c20..953da1f01c 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 69c903b75bde36293c66b25c051916a74dbadf58
+RTL8821CU_VERSION = 80781de376007ecd778dfb2bef05533e3a6cc7c6
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
