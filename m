Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D816FC6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 26 Mar 2024 10:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 727B0404ED;
	Tue, 26 Mar 2024 10:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzKLZYlfFZzp; Tue, 26 Mar 2024 10:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F2E540578
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2E540578;
	Tue, 26 Mar 2024 10:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 618061BF383
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8D840578
 for <buildroot@lists.busybox.net>; Tue, 26 Mar 2024 10:26:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phtDcZu9d0yS for <buildroot@lists.busybox.net>;
 Tue, 26 Mar 2024 10:26:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.187;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D3A86404ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3A86404ED
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3A86404ED
 for <buildroot@buildroot.org>; Tue, 26 Mar 2024 10:26:45 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MRmwM-1sH9Vh0QCQ-00TEZp; Tue, 26 Mar 2024 11:26:43 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Mar 2024 11:26:34 +0100
Message-ID: <20240326102635.273072-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:YlkAlpn8TrMJ1rCpZAm/UWdiZnjCuXPonuzVD1UsEku4VcHWFOJ
 S4kpstKtXRpxaba/i/OTUrLlpPFD/vKMDdlRKyQNlPdFOET7jUsT7e05BhMTEKbMZkSfjmO
 sMJgGSlQagE98/qGAXq1h5nXgTF1mPJJVjL8NATzHj+P5HiQD52lkgS/Y6j9rwT0GuZeB4r
 bDStGn81aSmG8qAzlfCdA==
UI-OutboundReport: notjunk:1;M01:P0:ZFn7bAWW2CA=;3BYWPZb2lXt4d8UvpOSdM1hX6u0
 RGuNsuGKyBaP9kl46mWtrUQTEC5MF1DX2pa562m2JpxcZvTOXs8CDeIh4Rwcw8lh40GAD0dZU
 t2UB6NQyUlnjdEZyT2xCcZZ3PYroILU3m+AWh13W+ZRrLcNNJAqMigOKzLs+lDYhSfsbnw5S1
 mGwbkG8dfSKnflFpVO9j08/CGs15PEaK1hNY/cftj9h17uhBWM9pAUEXzst/p18TzkY2aVK21
 bsS2sBdbV/4wi5AK/HzkuA8aPN6ASevrChkohXA1sL4LgT5vMHukIonuBB+5RE2rauabDV3Ek
 pArWCFHdmyMriLzs8GC5ULmIoGmRnqSdPNmt7ZqlW5XEAdDwas8epeGHWJxPSYheOaFfFPxoi
 w7W8jlhfRfMuDNBhmIt5YGBfzYQxUDNYLMcFH6oQxqz7OY+T3Ssb2Ub388RgyA0EEvZ8ZsL5s
 LvJNAErmFNsVgYFnMklFR0+HquynXpexEB89QYDPAXE+4CKa1imEMb8zM9i0+Z07YxnTjf2PE
 HLJnm/dC4qlP27Pm1nX13lhNKxVz4FG+JeL4lkYK2++NTDhcRInm3wCkOczEYxdbCYZGgfpoo
 ktwCoV+sxfWerAl+tTI08UOcuVkM6doPZRgKELXskMlGfSnQCatB+jKXSS1FaOcwYgC8q9xLd
 vPNmCjFbVQgxta30iDyERHiipUjqLk4UuTuc2bozqHwOWEGMpWu3iZOms4VwmnimPylga/aTk
 ld+wjx+3l4TRdizAVopITbTdX0J+RAbDGM1EqXxp2aCqoPmGndZH40=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.4.21
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index d3bca46803..2785a24eca 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5d3ab0144d5b8eaf28ccfbf27500669a91463226c4767041c7293ce76065171a  vue-3.3.4.tgz
+sha256  5772054f07ee4d86b831b963a889b9b3e60764f4fe909c1ccddd00fd628bc6c7  vue-3.4.21.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 29bf3bc66b..3ab7182083 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.3.4
+VUEJS_VERSION = 3.4.21
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
