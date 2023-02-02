Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED410C05027
	for <buildroot@archiver.kernel.org>; Thu,  2 Feb 2023 15:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71C8781FF7;
	Thu,  2 Feb 2023 15:43:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71C8781FF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4B__8by99y0; Thu,  2 Feb 2023 15:43:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37CB81FF6;
	Thu,  2 Feb 2023 15:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37CB81FF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 310EE1BF405
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 752A140120
 for <buildroot@lists.busybox.net>; Thu,  2 Feb 2023 15:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 752A140120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mS-kY5hfaO3V for <buildroot@lists.busybox.net>;
 Thu,  2 Feb 2023 15:42:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA39240C82
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA39240C82
 for <buildroot@buildroot.org>; Thu,  2 Feb 2023 15:42:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id NbjUpSrPB75JfNbjVpfspg; Thu, 02 Feb 2023 16:42:41 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  2 Feb 2023 16:42:38 +0100
Message-Id: <20230202154239.325711-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfDFUlPgWRi24nOlHc3zg9LtExhA1hQDQOKnZXbOr7Xvp4jXQTwJ4GfqYRsJl/CJfk+z3FBj1V5zcUJAlAhEALIqIA69nBDJWsLpwNH7HD7marjI5eoMr
 qbFu3LiEs2WcwfmiyonTg4sb2fdlXpKPFBZGzR+179WqFB957F2OPeiVAt4a9wjJA7s55vy/X0HVdS4hxoZ5XWEpHbgLu7+5cE9fClQ1ddOdQoCojSnk0McI
 7mXdVy2dbEcQDQloac3wl1ixgSxHiVOdpyhgEVI2hZV99EBV7vkzOq+BTcmoaxj6m6dBBC1ZGkP59gkIZ0PVLggWrCAOM+uDxot3kZypJbwmIWE4UBa2oIH6
 z3CZh3kqVywgZHtWKBk5uHJ2VrtyY2dzzma8u9H1VSUzXV6dRVvMHKsTSZ1IHKb6e70XldZmdGREPWxwTEPcms6O/i7WGg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1675352561; bh=Zergt4lqFCjmk2ton5d+2WWVvHYKq1fWzY/He2oMJ2Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=YNDDLZbr2qfJuZq2BkpMz6w3B014RZ4dKcooo7ISH5dNiLAffZFzGY3tK5pHvxO0M
 NeANIE0AQDxxHtO7IUcRawfy0gVIP+sqU1yL8rICY9ut0YDnEdxy+OLmrNwQ0zOdRu
 hAigIFq514kF2cs5s71jqlHXRsG5aooYtpvFOu9skKc/CW8X++mexgNvUBI5rP6lR/
 S/tK46Py2MYWh+AWZO3ct8PYPf7jlMIcPfWS/Odg+HPymK6aT3zxhKXHJWqc5Jn2gl
 P2PQ2meS7EH22wuuHXIJZYh2YKO6uUKMbQrZDmXilyRC1VYjT2m6gLFukIrD+XRgT/
 YNdQ4eTxjU96g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YNDDLZbr
Subject: [Buildroot] [PATCH 1/2] toolchain/Config.in: extend gcc bug 43744
 to every sh architecture
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 544b423001..01215e0e96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -115,7 +115,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_43744
 	bool
 	default y if !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	default y if BR2_TOOLCHAIN_GCC_AT_LEAST_9
-	depends on BR2_sh4
+	depends on BR2_sh
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63261. This bug no
 # longer exists in gcc 8.x.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
