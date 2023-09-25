Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CD0CD54BF
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 20:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF5F34171C;
	Mon, 25 Sep 2023 20:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5F34171C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UaGIt1eP_w3o; Mon, 25 Sep 2023 20:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A31640352;
	Mon, 25 Sep 2023 20:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A31640352
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C12D21BF334
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96897408BB
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96897408BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IckHXy-pXEIC for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 20:03:06 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A1DC408B5
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 20:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A1DC408B5
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id krnKqX8r6DAHrkrnLqB715; Mon, 25 Sep 2023 22:03:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 22:03:01 +0200
Message-Id: <20230925200301.2790925-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
References: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA303DfX2JDQZ0zYCxukpV7+clXJR8W7A3u5oI4ctPflQ2JF+beMvc0eTgvRGEmYlp/vZ4h5kpAz9eXqY0LHgroBvnYK9acWnIniQRV7rSmOLL+4EPim
 myGgCXpWUqTr4tpbTrd2vJEC4bzUPLMHTk+3V0zCH2vNYMiZIKpvt2xtOTZnKFO0xXCrhltJ/jzBpeXROmZ796obHh0APvMjb1GYzxxPSYEfae2clC1FfwqE
 yI6qOpPCStAdzxHqFky7W5r5y6cV3jTdODTZbwE98ZmqKYjc8vIxULKaN1k6ogvDUIbksddVvRaQd0cL6YgxFKHC2ZmBKWnfchoHB6RD4m6pHWjPT2KKXMfw
 va9ogFQxrLAduZPR6ak43UicX3IiiA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695672183; bh=UF9nrBBvD+MLEi2WX2OvS5G/KTifNoJgdm1d87nct0w=;
 h=From:To:Subject:Date:MIME-Version;
 b=KhJHr6i1mgZAgHb5YSlLAEK5YPtaDNxK0kNBmGd5a+cfDtlTBPPheTbRzhfOyLfk/
 T5bJMK8z5u2RQKBqmW166EnJDIOPNwma0+f3GqWxvEv5Zp/OquesK1LeeJl0eDKI4w
 XIt6ZRTrNWS2oRkyHOHFCUi3gG9Tc7pWMeChIPKANSGqug1HZk2I9IM/Ja1N2FFE71
 0wJGWT46MNteFHlsqEWmsl+UZFFUXF+xYSTkZF+0UNDMnpszec3CG0JJOLe1Nw7NlO
 p/2V41vK6c7mhPJYjNhCdxgkVv0sGyYfn5blsZB8N51TDu/Wv2Kv/9VS8E5skOgnSC
 w/dUZG4NC5V/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=KhJHr6i1
Subject: [Buildroot] [PATCH 4/4] DEVELOPERS: add Giulio Benetti to
 libblockdev
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8927a2653b..38973a75dc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1204,6 +1204,7 @@ F:	package/erlang-jiffy/
 F:	package/esp-hosted/
 F:	package/gcc/
 F:	package/harfbuzz/
+F:	package/libblockdev/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
