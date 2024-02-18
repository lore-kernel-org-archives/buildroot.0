Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A9EC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 18:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C19DC82160;
	Sun, 18 Feb 2024 18:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYAv41mJpW5W; Sun, 18 Feb 2024 18:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCB1F81F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCB1F81F41;
	Sun, 18 Feb 2024 18:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 822E01BF41F
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E929400CF
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 18:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0vARav1ZmEo for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 18:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33098400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33098400C8
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33098400C8
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 18:45:41 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id bmASrFAK1ce1vbmAVrHZJh; Sun, 18 Feb 2024 19:45:40 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 18 Feb 2024 19:45:34 +0100
Message-Id: <20240218184536.1922309-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPD5j9wmPlTkWrcMaGf2I30KURWS0NCKMGBRQBVsETU4+xjeqOzDLsSGUYEW8bjU9xa5iibmq1vDcIfNLpDcqoUbQwSNh0rvmpY+BQ9uCChM3hslicps
 F8kh0CymdfvNpm/cWyF4DQvYsw7CMyaf/F+wVXB2FGCjL4vZG+2VAcm3rX1ulSr6yW154AMtKS56ZrezK84qp5+38RoukuJyvRi0BGJXEZTdrCgSo2SENkmM
 NLEKzHOMGu1C9YRY0dDRX5kihWr8b2ozGhuZWhi0QyW8aOHls3BJC6eRXL9+Fcf7aHLMmSjJ9QHvIAYsHl83/rTgoodCMKsxrObBMpMar3UEg02d4tA2xw/w
 StIoF8DrV8A0MDNItXOQcBP3cH6AGDkE3MDvY7PtbMSlBlplXgYqhT9rBSdQVIDPnIcN8DAa1BG2jVtHalppLslWyX2urvSznpJHvbg6Q9TlFYj3J6Qaaqh3
 q6PT4cULZLgYlHhaEa9Gs58Wi9oA73tpLHqCi1HKV2n/4zctSuvBrNEq1B3i/yZudZDufacwKqVT/Ha5Nt6GQb/+9Rz9U6eGtDdTTVOC1aQt5pR/7UiKDHwm
 21Q=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708281940; bh=0dGDQMJ+5q6XdAZcrkMg4EHrcmjQEDpOO48yZPxP0Fs=;
 h=From:To:Subject:Date:MIME-Version;
 b=I7cjvalw9ONmmOnlBYlwBVQmcsimioOQl2u2dCnxQEdjswhcG8rZZT8/KTmxn2bDL
 9ik3dmxdIj7CJW7OSbczqtck8K7d5ONyIPl6u9+RR9LeYJQWRlkRZ+SPGr038+SNr2
 cGZRx2NFYjzp6Tq1NmwTg7qTLOxc7/JAUKgQ8b557GeaU30szjm9EGi/pmxvy2aRvI
 +1mtzWQDnFgxJJeZ4gS2RWN1HyxdQmcDmS9zz9cxO8cf5Dz4iYY2tM0ATckQiv6oFw
 dD9S96PFqj3uD1o/hfU1hN4FDiujQEFFF6sghtKTFrZmSglivcvBrZ7Bte3bgsc0PN
 SIXlL1pf5ny4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=I7cjvalw
Subject: [Buildroot] [PATCH 6/8] package/pistache: drop nios2 binutils bug
 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pistache/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 3acf1f53f0..ca2d2833cd 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
@@ -13,9 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
