Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFBCC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 19:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB81341DD2;
	Wed, 29 Mar 2023 19:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB81341DD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mFNUWZz_aGx; Wed, 29 Mar 2023 19:13:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0295741E0A;
	Wed, 29 Mar 2023 19:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0295741E0A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0A7B1BF339
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9906081E85
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9906081E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlOGQ5tYcsri for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 19:13:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D0C281E3E
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D0C281E3E
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 19:13:36 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.33.200])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0930AB03116;
 Wed, 29 Mar 2023 21:13:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 21:13:22 +0200
Message-Id: <20230329191323.733704-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680117213;
 bh=rPlGPVmHrN/Sez9UGRIIBDyalJm4bwGJC/8LwF9A8+s=;
 h=From:To:Cc:Subject:Date:From;
 b=IOeMeROdIXvp7eaaVhp+7zvLwXeUIaeiLoBPY6EbIfcXx5p++5UKRfojHYSgddHsl
 VUiagMkAdS4NdfscRM53hiN56dtTMidqIRuZ68qwEI27YRWrsb6Laz5kNpFdizP6+n
 ufHJvK6SxpTQYVSHlZlZDCjrmkT6ZJPSebnZBt9dIJicP8/8BKSavT0SA3UuzCe92s
 +mLTszVAyHMgmHk1O6AbkDRm3GnsaN5bHSnr18Q3ggUPlMccdlKALbVbiP9luFpfL+
 SBId+xazuD3EO2+C8lS3wN8bzJUXXIIxVy+DloSlfb0jl/DkICcKWGMA4ZWk8dRtxL
 6cuOQzeDuevUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IOeMeROd
Subject: [Buildroot] [PATCH 1/2] DEVELOPERS: add Julien Olivain for
 package/openblas
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

The package has been orphan since commit ee58353 (2018-12-22).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 67c6004ddf..d66bf79c6e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1712,6 +1712,7 @@ F:	package/kexec/
 F:	package/libjxl/
 F:	package/octave/
 F:	package/ola/
+F:	package/openblas/
 F:	package/openmpi/
 F:	package/perftest/
 F:	package/ptm2human/
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
