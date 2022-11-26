Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43255C43217
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 22:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E8C41607;
	Sat, 26 Nov 2022 22:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E8C41607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6hXfW73Tf-F1; Sat, 26 Nov 2022 22:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76F2415FE;
	Sat, 26 Nov 2022 22:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C76F2415FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 605FB1BF29A
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 22:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F72F40448
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 22:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F72F40448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1NNf5nUoDI1 for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 22:00:08 +0000 (UTC)
X-Greylist: delayed 00:05:22 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBAB64011C
Received: from aven.230ruedubac.fr (aven.230ruedubac.fr [163.172.52.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CBAB64011C
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 22:00:07 +0000 (UTC)
Received: from aven.230ruedubac.fr (localhost [127.0.0.1])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTP id 7BF01565508
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 21:54:41 +0000 (UTC)
Received: from knet.local (knet.230ruedubac.fr [45.83.230.42])
 by aven.230ruedubac.fr (230ruedubac.fr domain) with ESMTPS id 6FE915654F3
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 21:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id 3DFF7F09F
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 22:54:41 +0100 (CET)
Received: from knet.local ([127.0.0.1])
 by localhost (knet.local [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BICypn31p5dj for <buildroot@buildroot.org>;
 Sat, 26 Nov 2022 22:54:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by knet.local (Postfix) with ESMTP id EA64F11E63
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 22:54:38 +0100 (CET)
Received: from nb043690.eth.internal (unknown [192.168.2.253])
 by knet.local (Postfix) with ESMTPSA id AE220F09F;
 Sat, 26 Nov 2022 22:54:38 +0100 (CET)
From: David Barbion <davidb@230ruedubac.fr>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 22:54:36 +0100
Message-Id: <20221126215436.2078346-1-davidb@230ruedubac.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=230ruedubac.fr; s=mail; t=1669499681;
 bh=rxl6uUtZsVwXux08HFCITSdM5eT0xaewfrnQNaItLik=;
 h=From:To:Cc:Subject:Date:From;
 b=ou1WkN15rNKKbzUnuNAdAB64P+r4jyL6kVeh99XO5MlLQ3k4CoWiYdlsR0CDKNXAc
 ZqcyHMtXJCRY94h3nIyb/7jZ6fgmKRizHBcSscUQ7qtLqXHFBrnxrI9ECD6gmABitb
 AUHVEXNdhDDgOXu4uwv5YRUT31iLT80jSK70UQmU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=230ruedubac.fr header.i=@230ruedubac.fr
 header.a=rsa-sha256 header.s=mail header.b=ou1WkN15
X-Mailman-Original-Authentication-Results: aven.230ruedubac.fr;
 dmarc=fail (p=none dis=none)
 header.from=230ruedubac.fr
Subject: [Buildroot] [PATCH 1/1] package/x265: fix armv6 cross compilation
 issue
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 David Barbion <davidb@230ruedubac.fr>, Thijs Vermeir <thijsvermeir@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When running a program that depends on x265, it crashes with the
message: illegal instruction

The package x265 was forcibly compiled with the gcc flag -mfpu=neon even
if the target CPU does not support the neon instruction set.
This fix adds the cmake flag CROSS_COMPILE_ARM to correctly set gcc flags
when compiling for ARM architecture.

Signed-off-by: David Barbion <davidb@230ruedubac.fr>
---
 package/x265/x265.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 51c39df4cd..e3a4acc6e5 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -35,4 +35,8 @@ else
 X265_CONF_OPTS += -DENABLE_CLI=OFF
 endif
 
+ifeq ($(BR2_arm)$(BR2_aarch64),y)
+X265_CONF_OPTS += -DCROSS_COMPILE_ARM=1
+endif
+
 $(eval $(cmake-package))
-- 
2.38.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
