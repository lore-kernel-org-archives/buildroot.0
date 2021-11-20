Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58764C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 15:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E914740179;
	Sat, 20 Nov 2021 15:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eAAp-gKI79hb; Sat, 20 Nov 2021 15:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD03540395;
	Sat, 20 Nov 2021 15:05:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2EB81BF470
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 15:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9294B41BE4
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 15:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2ZfQaHf7W2f6 for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 15:05:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D980740998
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 15:05:09 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout02.t-online.de (Postfix) with SMTP id 8E2014848;
 Sat, 20 Nov 2021 16:04:59 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.220]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1moRv6-1JKtub0; Sat, 20 Nov 2021 16:04:48 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45110)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1moRv5-0006Zz-Rb;
 Sat, 20 Nov 2021 16:04:48 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 20 Nov 2021 16:04:46 +0100
Message-Id: <20211120150446.447240-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211120150446.447240-1-bernd.kuhls@t-online.de>
References: <20211120150446.447240-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1637420688-00001460-41D4EDA6/0/0 CLEAN NORMAL
X-TOI-MSGID: 467c2b8a-4e93-4bb9-ab58-c7190c14aeb8
Subject: [Buildroot] [PATCH/next 2/2] package/x265: enable parallel build
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
Cc: Thijs Vermeir <thijsvermeir@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Parallel builds were disabled in 2018:
https://git.buildroot.net/buildroot/commit/?id=03bfbc5ab26c9aed0c0cfce55341a1d1f05deca3

Build-testing the version bump to 3.5 showed no errors with 32 threads.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x265/x265.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 85c4ade768..51c39df4cd 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -12,7 +12,6 @@ X265_LICENSE_FILES = COPYING
 X265_CPE_ID_VENDOR = multicorewareinc
 X265_SUBDIR = source
 X265_INSTALL_STAGING = YES
-X265_MAKE = $(MAKE1)
 
 ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-nasm
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
