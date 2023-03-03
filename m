Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3BDC61DA3
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 22:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBCDC400D7;
	Fri,  3 Mar 2023 22:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBCDC400D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52QW1v1lFKic; Fri,  3 Mar 2023 22:27:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F8E64012E;
	Fri,  3 Mar 2023 22:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8E64012E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105211BF4DB
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 22:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE3494012E
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 22:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE3494012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xxxdcmA5bvo1 for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 22:27:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E878E400D7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E878E400D7
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 22:27:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.171.206.117])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 69B9CB0051E;
 Fri,  3 Mar 2023 23:27:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 23:26:57 +0100
Message-Id: <20230303222658.157671-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1677882463;
 bh=COtoF6fmIilv5UQjb5lilcSrC9kT3m+oxsptGy9pYvs=;
 h=From:To:Cc:Subject:Date:From;
 b=BX45EMKqr4dwWePr6wIzS+DtLoO43/wOclVAGFJ/OlO2WlA+951hr1BBkyj3zC5oX
 wv81f79C2p4VMFfaTCmcxab0MsauzBtepdrPox7Wwb+2RewzbPlH9j0DixtiCc5MbD
 nj9WMc+yvBs8mumOwvJLbBmLMTH5r9/wucfjzQfwaj1Ws1im4L/WtX+sEn3Nc3AUK6
 wgtanIYMAKH3KCQp6pp04fgfEkZPPE9J8aWJjv8OnRdbpseQ2ubPDRPq75Z20892nH
 ImQkwlSzLoFAP3J2RDgBLfxUxNDsn/n5oH7TmRh5+JdP9aaiV00F1gW+jHnxt3qbcc
 KOzpQLcdjxovQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BX45EMKq
Subject: [Buildroot] [PATCH next 1/2] DEVELOPERS: add Julien Olivain for
 package/kexec
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

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d052e59122..21ea2b53e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1693,6 +1693,7 @@ F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/gnupg2/
 F:	package/highway/
+F:	package/kexec/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
