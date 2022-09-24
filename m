Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20303C6FA83
	for <buildroot@archiver.kernel.org>; Sat, 24 Sep 2022 08:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62B4402AF;
	Sat, 24 Sep 2022 08:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62B4402AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joVHwpj0Hvy8; Sat, 24 Sep 2022 08:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8691B40193;
	Sat, 24 Sep 2022 08:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8691B40193
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 364361BF861
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1181683F78
 for <buildroot@lists.busybox.net>; Sat, 24 Sep 2022 08:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1181683F78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id antkclXw9WAf for <buildroot@lists.busybox.net>;
 Sat, 24 Sep 2022 08:31:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53BBC83F70
 for <buildroot@buildroot.org>; Sat, 24 Sep 2022 08:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BBC83F70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1BF85F97; Sat, 24 Sep 2022 08:31:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 24 Sep 2022 10:31:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8c8886f7be7db00e70bd0362e3473a2c54663b5
X-Git-Newrev: 68c32ce33806c5e9ffc89851e28e6a817d7e9706
X-Patchwork-Hint: ignore
Message-Id: <20220924083119.3C1BF85F97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: build
 getcontext01.c on musl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68c32ce33806c5e9ffc89851e28e6a817d7e9706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was fixed for musl during conversion to the new API in 0f519d0da
(released in 20220527).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ef70174a55..23be3d25c9 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -81,7 +81,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
-	testcases/kernel/syscalls/getcontext/getcontext01.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
