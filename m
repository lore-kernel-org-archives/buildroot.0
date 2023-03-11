Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DA5C6FD1C
	for <buildroot@archiver.kernel.org>; Sat, 11 Mar 2023 18:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CA0041B31;
	Sat, 11 Mar 2023 18:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CA0041B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETu_pNBD_TtT; Sat, 11 Mar 2023 18:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EC24418FC;
	Sat, 11 Mar 2023 18:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EC24418FC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 771D11BF42C
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 18:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F435418E8
 for <buildroot@lists.busybox.net>; Sat, 11 Mar 2023 18:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F435418E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UPUuIIhDdnxu for <buildroot@lists.busybox.net>;
 Sat, 11 Mar 2023 18:43:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1EBB4155E
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A1EBB4155E
 for <buildroot@buildroot.org>; Sat, 11 Mar 2023 18:43:49 +0000 (UTC)
Received: from localhost.localdomain ([84.33.142.131])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b4C2pANNvcONCb4C3puixW; Sat, 11 Mar 2023 19:43:47 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 11 Mar 2023 19:43:46 +0100
Message-Id: <20230311184346.829785-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfItGCTLH2nz9ztdrWSdpqHG9hB0cEC9NddnMGv8d/24UL+Bvt1nzI26JgwKXPUXgFpgfClEDiV140PhHXEEEqleuea29x7XqrfHU5dLfx3yoSl0Irsbs
 3AMwLMYlA4GSbDQcFufdQTui9yl5KZ1uRcAwRQCTuDydM9V4L/nsodAPUxZhOeBNUmemgAaeOd39DjAwR2vREqhc1+G7piIglXB7OiZPigvxmuukSS7WJn62
 sXaIbGQ/7rV9GjmNE4m/vgyVtUNS7eaJUF5QYwp+Yv1hM+pGkpC9JMyil+bNoXmiXzMiXzCVB3hWs2r5dpQYPA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1678560227; bh=Dq634Vjkrllg+xCVhq70nayYmJmeRoesqK5LIxi9RqY=;
 h=From:To:Subject:Date:MIME-Version;
 b=HQIS53WbL0uFgz10cPFgkxgwr2bKRP6CMOPMnN2ixRmBxgUMOaYnVSwP+MJI1Uthw
 Xv813eLVPXOXl+XEPtNgvIPK4i71ZebBO3JSyr7mY1JTHnahCWcdGshRUCFazg8Tzm
 Bh7fgdubDazjeaM3jRSTxE2OwgOha/pU1A6esm6kQwB30WKgn5rNIE1Kk+I3t+tzlS
 h6xXX0QB8ohhK3ar6Zs7TuHH43B9lnHlGlciU7rjMRqbePHwi23d0Hi1UI7pJwVe25
 +Rtq8uJv0Lrilo7DLH/hB6Gx21ixmE0zUXvLaQM9SaZ8HHqMmClF7vYW1JkU7v+2Yy
 Kk1NtU35qMH2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=HQIS53Wb
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure due to
 mixed endianness
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit cde69c668d6692114845a927c8c5534ed78019db bumped version where
Makefile changed CONFIG_PLATFORM_GENERIC to CONFIG_PLATFORM_AUTODETECT.
This way overriding the default platform doesn't work anymore resulting in
wrong CFLAGS including endianness macro and leading to a build failure.
So let's rename CONFIG_PLATFORM_GENERIC to CONFIG_PLATFORM_AUTODETECT to
fix.

Fixes:
http://autobuild.buildroot.net/results/2a8432646926b3b69383d204673c4113aae9de12

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index b3e4ad3fc8..5a93376c20 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -24,7 +24,7 @@ RTL8821CU_USER_EXTRA_CFLAGS = \
 	-Wno-error
 
 RTL8821CU_MODULE_MAKE_OPTS = \
-	CONFIG_PLATFORM_GENERIC=n \
+	CONFIG_PLATFORM_AUTODETECT=n \
 	CONFIG_RTL8821CU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
