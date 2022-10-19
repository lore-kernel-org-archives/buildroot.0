Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E762FC43217
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 19:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623E883F6D;
	Wed, 19 Oct 2022 19:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 623E883F6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xro0fJsy3smQ; Wed, 19 Oct 2022 19:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28B0883F66;
	Wed, 19 Oct 2022 19:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28B0883F66
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC4641BF41F
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 19:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C9EC41D06
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 19:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C9EC41D06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0HtkvroxQxb for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 19:55:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F10BC41953
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id F10BC41953
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 19:55:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id lF9ro9ANesjaWlF9roRV0b; Wed, 19 Oct 2022 21:55:20 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 21:55:19 +0200
Message-Id: <20221019195519.28536-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKKUepyOY3dupHArxr04B+db07NlYr31ixVG0Pm5kfNWqx/FLe4sCTCWznvdJB0xaqQxzArYrx56R0RcAKdcdNv9/QOSZNOuMnI5+cf0LPiJD3/eZfpF
 yibAGVslsVYh1Pk755zhGXGybgSSaTQjN7LWDb+jV7Oe3UV2+f8jxQ2Mm3w3L4nP7ZCjrmCsMRhIJ+SiSeH+s2Z1vuWmD/B5BiQJ5xSS3cvvpEsTFKqq1cg0
 WVfWUjiH87Xo2+2gg52xg2r07+XwAikTst/mkv86RFNaEyoh92t3XhroBB1EBKioDRf2DT3w0VZ+c/CnV+seUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666209320; bh=eq2TOR7lXqMIa+4cHsSorZVaUx35gIEBdFOfVh20BTE=;
 h=From:To:Subject:Date:MIME-Version;
 b=nstsYFyKq18Qf1KLFGN26V0SS6m7B5/hAjy4fg+ghvMubGusQQ1LjwY6kRyxiU4u7
 bHBCWKou7eA34zLqvtHpfP0HdJvgIcT98gjiSD3TgLukkuPjvmQR4xqvTvQMvzCU6b
 f+A2I3yLNwct5e0A5JmMLJ0qCgY0+Gyq1hMhYQNgP3tRVS5JIFQEGIGX+wK4XwxW8X
 CA44AjmsTo5gIKNXHytsLhzrlrX9XywRcShAbZgQPzSXCctyicMQQZzTq5DbBsaSFh
 cjcF7czeDIlpOGsNLZGPLpUCAVSjjLHHQiqSCDz2OciUMFC0s7f5FbGwipTqWon1WA
 LuU2esdpgDb5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nstsYFyK
Subject: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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

Fixes:
http://autobuild.buildroot.net/results/433/4335d0d8454035a8f74645ba8d6c2329ab2e5480/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 041b2cfc56..a613006f70 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -15,8 +15,8 @@ LIBNSS_LICENSE_FILES = nss/COPYING
 LIBNSS_CPE_ID_VENDOR = mozilla
 LIBNSS_CPE_ID_PRODUCT = nss
 
-# Don't parallel build if make version = 4.3
-ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
+# Don't parallel build if make version = 4.3 or 4.4
+ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3 4.4),)
 LIBNSS_MAKE = $(MAKE1)
 else
 LIBNSS_MAKE = $(MAKE)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
