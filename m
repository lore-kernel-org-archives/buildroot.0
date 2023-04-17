Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64862C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 19:15:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B5514098D;
	Mon, 17 Apr 2023 19:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B5514098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HfLI27QIBlro; Mon, 17 Apr 2023 19:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76FE7409F0;
	Mon, 17 Apr 2023 19:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76FE7409F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD231BF20D
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D56401C9
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 19:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D56401C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vao3QbAnw5t6 for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 19:15:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B75D34018A
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B75D34018A
 for <buildroot@buildroot.org>; Mon, 17 Apr 2023 19:15:11 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-6d4fd494cf-btbzl
 (smtpc-mxd-6d4fd494cf-btbzl [2a02:598:128:8a00::1000:483])
 id 23148e329534316923133045; Mon, 17 Apr 2023 21:14:57 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-6f4cd59c79-r2mvj (smtpd/2.0.10) with ESMTPA
 id afa64c0c-a6dc-4477-b043-cc86d66f93c8;
 Mon, 17 Apr 2023 21:14:50 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Mon, 17 Apr 2023 21:14:47 +0200
Message-Id: <20230417191447.2439214-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1681758897;
 bh=E7ziftOBadHOigR66+/0VDMI7csNEtkSLQL8TORXIUc=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=FHRxIFTTGrq8TwB0fdT2eozGASgwWD415w6LPNjy+2jFiqVwQjE/Hh39i53CHQTns
 +ZdJpZstRJaX2dPu6sJAVSazGgUSn+JbKk2n9I4IN2trji2X7p1SBzkhvbAawP7Z0K
 7Aby82BRPu/0/x3yxdkcy+SGcGLJvLCpdDxsgzjD+J0I1kW27iHp6UTHeo+c58slQ9
 GLz++9bkZxT3ZDq2IleOcw+WdKnFkcM/BFnaE1RSJOWt3XNCkmc+Yw12jMgikqYD3U
 PdV4++5RSRLdGZAKOiIBQC3ngHSdH5ATmr3UVfEp1qnbK7gX5KVewvHRiEvM0eSEIj
 drmaXJajKZ10g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=FHRxIFTT
Subject: [Buildroot] [PATCH] package/ltp-testsuite: remove 5.11 headers
 requirement for musl
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

5e1c238b72 ("package/ltp-testsuite: require 5.11 headers for musl")
added a 5.11 headers requirement for musl, which contains fix
a85cbe6159ff ("uapi: move constants from <linux/kernel.h> to <linux/const.h>").

This effectively disables LTP on all musl based toolchains from
toolchain-configs.csv:

      bootlin-armv7-musl [ 7/45]: SKIPPED
    bootlin-riscv64-musl [19/45]: SKIPPED
     bootlin-x86-64-musl [26/45]: SKIPPED
br-i386-pentium-mmx-musl [31/45]: SKIPPED

But these toolchains are based on 4.9.255 kernel headers, which have
backported fix as 834d8b96cd85 in 4.9.250 and LTP can be compiled with
them. Because there is currently no way to specify also older stable
releases with fix, it's better to remove this requirement. If people are
really using unfixed kernels we can reintroduce the workaround which was
removed in 5e1c238b72 or even ask upstream to carry it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm sorry for not checking the build properly. v1 and v2 of LTP update
were without this because I did check them properly and saw that 5.11
version requirement for musl was not needed (thanks to Thomas, who in
the past after my asking for that had found a time and updated toolchains).

Kind regards,
Petr

 package/ltp-testsuite/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index b42082e2cc..272c2ede37 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -12,7 +12,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_TOOLCHAIN_USES_MUSL || BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	depends on BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_MUSL_FTS if !BR2_TOOLCHAIN_USES_GLIBC
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
