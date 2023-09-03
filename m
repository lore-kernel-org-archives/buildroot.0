Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A360C83F2D
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 20:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D1F41503;
	Sun,  3 Sep 2023 20:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97D1F41503
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Zw413_zXbST; Sun,  3 Sep 2023 20:06:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD0E14151C;
	Sun,  3 Sep 2023 20:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD0E14151C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAD421BF3BC
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 20:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9402A401F3
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 20:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9402A401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sBePoptMDWfq for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 20:06:15 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D47C140012
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 20:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D47C140012
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AB54E13F879;
 Sun,  3 Sep 2023 22:06:10 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  3 Sep 2023 22:06:05 +0200
Message-ID: <20230903200605.32530-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693771571;
 bh=8sOyamW/YGh4bxc1Y3BHciBfEv9OrOb0fer+n2PTCwI=;
 h=From:To:Cc:Subject:Date:From;
 b=tl0H0TbF4DVE31MVBu/xc7pmSjXR2d5CCKgQOEFQu5q8GAUTyzKl2aLhqCi/Q5SYq
 nAWz41LYSasm5V0c/ggVTAAgcF2o4eC07D5Ub0AMoT9Bp1IdgwQ1yrSHt4ZM1CwyVz
 /yXNLM2K+qoAEwu2EZRfKMCkOCbhVgAUUvb8K9zMRUIWw2BjqwEm4N100SeAHLHl55
 VyaF0ii+GFF+K8PabolWvfE+koehv3G6vjm9/Gavh2UYGOMQ1bBo95lGTXQ6D27Xmj
 MomdZKXB/wKnBicLt6Kw8qAE7PMHkcfJ4zkfiqM+jiMDOYhjFzHtDYwQupbJ099D5o
 NTwTuteBgidOw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tl0H0TbF
Subject: [Buildroot] [PATCH 1/1] package/dt: fix Kconfig package URL
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The old package URL is no longer working. This commit updates it to
the one advertised at [1].

[1] https://github.com/RobinTMiller/dt/blob/b30eb7a123cfba900f26ceda413ea8ae49c3817e/html/dt.html#L33

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dt/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dt/Config.in b/package/dt/Config.in
index 826a66ebd5..af20cc9bca 100644
--- a/package/dt/Config.in
+++ b/package/dt/Config.in
@@ -18,4 +18,4 @@ config BR2_PACKAGE_DT
 	  before exiting. Since verification of data is performed,
 	  dt can be thought of as a generic diagnostic tool.
 
-	  http://www.scsifaq.org/RMiller_Tools/dt.html
+	  https://github.com/RobinTMiller/dt
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
