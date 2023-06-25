Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42822EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 17:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C4681DFE;
	Sun, 25 Jun 2023 17:57:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C4681DFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a84fO-AqBtiZ; Sun, 25 Jun 2023 17:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2323781E21;
	Sun, 25 Jun 2023 17:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2323781E21
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B09381BF3BF
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A08040190
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 17:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A08040190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2krDYQVr3Rdh for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 17:57:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A985E4015E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A985E4015E
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 17:57:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 17F08A4C00B7;
 Sun, 25 Jun 2023 19:57:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59624)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDTz0-000529-2Q;
 Sun, 25 Jun 2023 19:57:06 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 19:57:05 +0200
Message-Id: <20230625175706.319901-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687715827;
 bh=Ki0SdWOn0FyPU/pWRl5YftTmtffcEqz0z5IN/bjYIYk=;
 h=From:To:Cc:Subject:Date:From;
 b=tPzNqzvqj1aC7ycdSCacL+RLu4ivntZEXJMHy2VqrWbMnUS2xddsVAThMAtA9+qWu
 ROSqTnWZftglp7WLCEWy8bqg9e/JyOktFt759aiiLK5HLAgDHMFVpjHB9rlyPUD//V
 aWWRfPjnJN2hoEh5T7yLHCE68Lg09dhlR5jPbrqQGtE4fdmvQ/Nl+SQiuFReQkPtes
 t3njACIFpTHNHZrVWOs+61n9+getklNbHeTbvTFHqSZL2+6yTotNzBcvn9xE22JKkE
 UiYCHLzoJGBfIyOUNB9m2b+8rchyDxS8GTubcxPXclOudI3i7+tDHimhdMx1tH2zve
 pQY9HEKrKy8tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tPzNqzvq
Subject: [Buildroot] [PATCH 1/2] package/quickjs: disable on microblaze
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

quickjs unconditionally uses FE_{DOWN,UP}WARD and so fails to build on
microblaze since its addition in commit
5d50793659acb95050c110d5fc05399df20ce30b

Fixes:
http://autobuild.buildroot.net/results/3b1/3b1b1f91998bfdec65f3e6fb8931df9c8871b953/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/quickjs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/quickjs/Config.in b/package/quickjs/Config.in
index dc466241ba..292dba86d0 100644
--- a/package/quickjs/Config.in
+++ b/package/quickjs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QUICKJS
 	bool "quickjs"
+	depends on !BR2_microblaze # fenv.h lacks FE_{DOWN,UP}WARD
 	depends on !BR2_nios2 # fenv.h lacks FE_{DOWN,UP}WARD on nios2
 	depends on !BR2_STATIC_LIBS
 	# No way to check for fenv support.
@@ -15,6 +16,7 @@ config BR2_PACKAGE_QUICKJS
 	  https://bellard.org/quickjs/
 
 comment "quickjs needs a glibc or musl toolchain w/ gcc >= 4.9, host gcc >= 4.9, dynamic library"
+	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_UCLIBC || \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
