Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D251ECD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88F774054E;
	Sun, 17 Sep 2023 20:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88F774054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzQ9UIS-AL8e; Sun, 17 Sep 2023 20:29:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87ADD411A1;
	Sun, 17 Sep 2023 20:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87ADD411A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFD8B1BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 883AB40936
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 883AB40936
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uo-XaTyPq2Fq for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:29:36 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7097840921
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7097840921
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 48FDE13F88F;
 Sun, 17 Sep 2023 22:29:32 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:29:26 +0200
Message-ID: <20230917202926.10930-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694982573;
 bh=zex8K3/3THFwBT3m4PREr37HAb1ENcAfJmc2I7rObaA=;
 h=From:To:Cc:Subject:Date:From;
 b=FqXO6Hm9v1S/SLZ+m/Dpiwkbb/VJMvfLc+2Jej+xdmq+FgqwOaZy9KJPOCAPJRqRn
 4XInXpUnJns0q57eLn1StyNT554yMB1My7GHWiElNoUJNZ7RtwYG8nQAJAA1IknvN2
 Kl4WjTTnrsvy/tQzhtxnMoGs3uQaf8xqG8BCBuwfMc7jQxmfLXYdqccLSwrUJIuaZC
 3nhYp8WQZGEDXRxWO2ptONTTI2Vk3MpWm4FbRQUN1/V1/9//k+c3Ti/I+sDHDPogCD
 MiIrjJiHaDcUdaKxmf8jAq7j/vg1EgerM2x9SCoNiX93n86hmaLUly0FNIZfBpVDKV
 UXS1FlW54QIRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FqXO6Hm9
Subject: [Buildroot] [PATCH 1/1] package/expect: update Kconfig package URL
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

The old expect homepage URL [1] is now redirecting to [2]. This commit
updates the URL to the new one.

[1] http://expect.sourceforge.net/
[2] https://core.tcl.tk/expect/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expect/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/expect/Config.in b/package/expect/Config.in
index 5557f4aee6..67dfe643b2 100644
--- a/package/expect/Config.in
+++ b/package/expect/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_EXPECT
 	  Expect is a tool for automating interactive applications
 	  such as telnet, ftp, passwd, fsck, rlogin, ssh, tip, etc.
 
-	  http://expect.sourceforge.net/
+	  https://core.tcl.tk/expect/
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
