Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC6CC197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 13:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D3C80E73;
	Mon, 20 Nov 2023 13:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12D3C80E73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f4HpxGulYvoS; Mon, 20 Nov 2023 13:55:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C4C680C1C;
	Mon, 20 Nov 2023 13:54:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C4C680C1C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E885D1BF340
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 13:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23AD80BF6
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 13:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23AD80BF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWwwf64QC4hk for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 13:54:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EE4C80BC7
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 13:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EE4C80BC7
Received: from pwmachine.numericable.fr (85-170-33-133.rev.numericable.fr
 [85.170.33.133])
 by linux.microsoft.com (Postfix) with ESMTPSA id C34A120B74C1;
 Mon, 20 Nov 2023 05:54:53 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C34A120B74C1
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Mon, 20 Nov 2023 14:54:43 +0100
Message-Id: <20231120135443.45265-1-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.microsoft.com; 
 s=default; t=1700488494;
 bh=DWnuRKl8Hmzqo2fCoRRl19oQGwMAv9NfA4IfnpR6SL8=;
 h=From:To:Cc:Subject:Date:From;
 b=nGHonYM/fTXQ6QeS/rRL4WjNWSOkQl1nJSIFa4qHoGNcJ+BgWmAE6lmu9V/GNWmyn
 1KXDS1ZDf+YSis3jYgxKzSZNk/IvEFnTuDsyZrocRxT43FrkVePXa9AsXSyf2CxtLs
 jmuZD8pntG02Rs007CROqVFew+Rj7hdM19mjyppQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
 header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default
 header.b=nGHonYM/
Subject: [Buildroot] [PATCH] package/tbb: bump to version 2021.11.0.
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/tbb/tbb.hash | 2 +-
 package/tbb/tbb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 085d54109a..4d2cb10da8 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  487023a955e5a3cc6d3a0d5f89179f9b6c0ae7222613a7185b0227ba0c83700b  tbb-2021.10.0.tar.gz
+sha256  782ce0cab62df9ea125cdea253a50534862b563f1d85d4cda7ad4e77550ac363  tbb-2021.11.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index 75cca5e99d..1b0afbb889 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.10.0
+TBB_VERSION = 2021.11.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
