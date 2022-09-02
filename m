Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D7CECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 22:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD0F82C38;
	Fri,  2 Sep 2022 22:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AD0F82C38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzSACbvk0l6n; Fri,  2 Sep 2022 22:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A9E5829B6;
	Fri,  2 Sep 2022 22:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A9E5829B6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 380B01BF392
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 22:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11FF1415DB
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 22:35:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11FF1415DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJjCtYlcAbAo for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 22:35:06 +0000 (UTC)
X-Greylist: delayed 00:06:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC810408DE
Received: from a1552.mx.srv.dfn.de (a1552.mx.srv.dfn.de [194.95.233.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC810408DE
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 22:35:05 +0000 (UTC)
Received: from jessica.hrz.tu-chemnitz.de (jessica.hrz.tu-chemnitz.de
 [IPv6:2001:638:911:b0e:134:109:228:65])
 by a1552.mx.srv.dfn.de (Postfix) with ESMTPS id D8E3E420077;
 Sat,  3 Sep 2022 00:28:53 +0200 (CEST)
Received: from [2001:638:911:b01:134:109:133:20] (helo=mail.tu-chemnitz.de)
 by jessica.hrz.tu-chemnitz.de with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1oUF9h-006x8V-7k; Sat, 03 Sep 2022 00:28:53 +0200
Received: from frettchen.hrz.tu-chemnitz.de ([134.109.228.189])
 by mail.tu-chemnitz.de with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.94.2) (envelope-from <mario.haustein@hrz.tu-chemnitz.de>)
 id 1oUF9h-000O9n-5L; Sat, 03 Sep 2022 00:28:53 +0200
Received: by frettchen.hrz.tu-chemnitz.de (Postfix, from userid 53682)
 id 1C225F5; Sat,  3 Sep 2022 00:28:53 +0200 (CEST)
From: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
To: buildroot@buildroot.org
Date: Sat,  3 Sep 2022 00:28:49 +0200
Message-Id: <20220902222849.1098641-1-mario.haustein@hrz.tu-chemnitz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Scan-AV: mail.tu-chemnitz.de; 2022-09-03 00:28:53;
 cc409f3c49b587c1293e23f91d302b24
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=rsa-dkim2022; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5gQBwjQYxjHVVpAiVY2rp3ZoaEA9hNXLeSzq5Iy7YMQ=; b=vDTR843+5P68IJvhfIzbHGr/MP
 qM6py0lm/Bty91d18WOoMZ9j2tn2VCHugZ89f+03PJLZgUhfYQ5D0Rgk6P7zymMOsBlDzuER/hGxu
 ZiNfMql10BquygRDuk1XDDLNnLqd3tfxOkoQzKZxR5CK/UUkvRl6FICn24ThO2GGHUq1oXGQCoIio
 lOL8xFWpwBz2KxjYpAp1VvyMyP84dH31ftAzolPTT2WNNgLSZ38QOEthUDao/le5zQ7n4PCWNoaUn
 a0h3LlKs7+tRUbJNR1PgOcx1tjcKSgyBVJuHwlVS5T851V9HN6NcTYVwi4sqdLH7sHWzO7zs2uf5U
 G6EfzPlQ==;
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=tu-chemnitz.de; s=ec-dkim2022; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5gQBwjQYxjHVVpAiVY2rp3ZoaEA9hNXLeSzq5Iy7YMQ=; b=Q0IU8F9FU/O4hkA644wc0xtE+w
 nPM/x2iy/yiseGSMp1Emy3KeM9IaEtnwRQTGOcAgnz6+ydWK+INrbQ92XnAA==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=rsa-sha256 header.s=rsa-dkim2022 header.b=vDTR843+; 
 dkim=pass header.d=tu-chemnitz.de header.i=@tu-chemnitz.de
 header.a=ed25519-sha256 header.s=ec-dkim2022 header.b=Q0IU8F9F
Subject: [Buildroot] [PATCH 1/1] package/dcron: fix /etc/cron.d/system cron
 jobs
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
Cc: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jobs with the syntax @hourly, @daily, ... were not executed since the
recent version bump. This patch fixes the bug downstream.

Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
---
 package/dcron/0002-system-crontab.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/dcron/0002-system-crontab.patch

diff --git a/package/dcron/0002-system-crontab.patch b/package/dcron/0002-system-crontab.patch
new file mode 100644
index 0000000000..5573c68111
--- /dev/null
+++ b/package/dcron/0002-system-crontab.patch
@@ -0,0 +1,23 @@
+commit 1fd99b71b063b1573beaf9f6b801ec5be2fbe24f
+Author: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+Date:   Fri Sep 2 23:20:14 2022 +0200
+
+    Make @hourly, @daily, ... work again
+    
+    closes #15
+    
+    Signed-off-by: Mario Haustein <mario.haustein@hrz.tu-chemnitz.de>
+
+diff --git a/database.c b/database.c
+index 37cf17a..6ec720e 100644
+--- a/database.c
++++ b/database.c
+@@ -455,6 +455,8 @@ SynchronizeFile(const char *dpath, const char *fileName, const char *userName)
+ 							line.cl_Days[j] = 1;
+ 						for (j=0; j<12; ++j)
+ 							line.cl_Mons[j] = 1;
++						for (j=0; j<7; ++j)
++							line.cl_Dow[j] = ALL_DOW;
+ 					}
+ 
+ 					while (*ptr == ' ' || *ptr == '\t')
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
