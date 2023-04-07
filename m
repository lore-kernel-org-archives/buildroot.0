Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648D6C77B61
	for <buildroot@archiver.kernel.org>; Fri,  7 Apr 2023 14:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB87784421;
	Fri,  7 Apr 2023 14:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB87784421
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wh8S168A5sH1; Fri,  7 Apr 2023 14:19:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08C1284402;
	Fri,  7 Apr 2023 14:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C1284402
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 47B001C2E25
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 14:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2125C4052C
 for <buildroot@lists.busybox.net>; Fri,  7 Apr 2023 14:19:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2125C4052C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58NCQbsI_1NP for <buildroot@lists.busybox.net>;
 Fri,  7 Apr 2023 14:19:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D622400D6
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D622400D6
 for <buildroot@buildroot.org>; Fri,  7 Apr 2023 14:19:42 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id B3DC45FD0A;
 Fri,  7 Apr 2023 17:19:40 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Fri,  7 Apr 2023 17:19:40 +0300 (MSK)
From: Oleg Lyovin <ovlevin@sberdevices.ru>
To: <buildroot@buildroot.org>
Date: Fri, 7 Apr 2023 17:19:29 +0300
Message-ID: <20230407141930.694756-1-ovlevin@sberdevices.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/04/07 12:09:00 #21057308
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1680877180;
 bh=MNF2TS76jz/NpsPBFJJ6nKyxW2XZaCvukR1qGpNyREg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=iGywfWrMitn1j9gJtB9u/14DJjodhPDmnkqQNXvQfOCh2eycRiutkTEKk/EdXeCSb
 FAYeAz99ET/429L05sAcVxmsug/4LyWzrheTgUO9Fii0qawXboMHm3NCGFqlWf5G+t
 tYKt+AFPCuizCV9LDB/S96ApkXnEOm9kl1QAMqnXsv5s6o0ASxG95KQNT+Pb16A1Wl
 TyrewDV08z2KUdtYo//zUOd9cnkaZRLcf4k6BPnEc82BXWl1FDbql8O6P3CxoVUnAI
 iTQVELnESmadvnzJTfNbZXNB93GhROs8pftUX2VK9EY8Cp3LKZtLtQuySPJSaFSHAF
 wJ9Y3ytm0mIGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=iGywfWrM
Subject: [Buildroot] [PATCH 1/2] package/linux-headers: use host-make
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
Cc: olegartys@gmail.com, Oleg Lyovin <ovlevin@sberdevices.ru>,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GNU make package from the host machine may be too old,
so use the one built by buildroot.

Signed-off-by: Oleg Lyovin <ovlevin@sberdevices.ru>
---
 package/linux-headers/linux-headers.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index e2a0b7a7c9..439f003530 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -125,6 +125,8 @@ LINUX_HEADERS_INSTALL_STAGING = YES
 # linux-headers is part of the toolchain so disable the toolchain dependency
 LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 
+LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
+
 # For some architectures (eg. Arc, Cris, Hexagon, ia64, parisc,
 # score and xtensa), the Linux buildsystem tries to call the
 # cross-compiler, although it is not needed at all.
@@ -137,7 +139,7 @@ LINUX_HEADERS_ADD_TOOLCHAIN_DEPENDENCY = NO
 # of "its" headers
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(MAKE) \
+		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -148,7 +150,7 @@ endef
 
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
-		$(TARGET_MAKE_ENV) $(MAKE) \
+		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
