Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A1AC001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 05:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 580A8415BB;
	Thu, 10 Aug 2023 05:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 580A8415BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EL98EL2ffzG2; Thu, 10 Aug 2023 05:51:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7093C4158B;
	Thu, 10 Aug 2023 05:51:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7093C4158B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62A581BF3F6
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C57840B20
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 05:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C57840B20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RONP2jKvaSF6 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 05:50:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 27896408D0
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27896408D0
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.223.222]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHoRK-1qXmBZ2oUw-00EyWQ; Thu, 10 Aug 2023 07:50:11 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 07:48:51 +0200
Message-ID: <20230810054856.100816-7-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810054856.100816-1-dalang@gmx.at>
References: <20230810054856.100816-1-dalang@gmx.at>
MIME-Version: 1.0
X-Provags-ID: V03:K1:SLQOBbj9dWMT21Klmw7TxNpo1SXCl+9KPbs5zETgKLZei03bEB1
 4jqWfeH8DBSFrTo/4M3+dYVQg7O7rpXP7XqaUhM1lr00crKNIi0NiNFEyGo9G3RPXeIioQz
 Qu7MsbHXxnQEdM3ClahX2Vbtm0JStHuaWIVCS4AHpw/VHdSlYSzNh+ny59wTH41znOB+pG7
 s6Q7xqBMAVJDNqSxXe4NA==
UI-OutboundReport: notjunk:1;M01:P0:XNvHwiOBwFI=;XCGSSkiXWzBwIvsHXX06YkE4EIg
 40GuMnLnwl7XimG0B7JjKIh5KFkvARj9jwt2b01BqUUF/dQ3NZ3oqq0thgaIFEWB0QatNKKz0
 QvbBRRILQfuuWWemPAO2Zgf7HAul+pokuYx+vi/qiKBkSOc/ohokcxIa70Jyiu1nYgl7o0cud
 l6YtKsfZPUiGfl40f0H1AwCT0hjOKmBmLLXL+Nd8KdR+JZlFHsXviAcsARR72xkR/MmKxW6Yu
 QiF8tkEwztoONJFqy80hE7iZ+6BsqTgSwEJoRSiT7ufr0bZ3pMl7/lu3JhjBPyRurUcdnLHLJ
 ouuXAdaK06yaF8z4RTs0f1D6VDzdw0IdTAfdo6SnJtrnkVCBjOJHMbQANhMC7LVx96PFAvPcn
 uIvty3D6KD6v6Svt+y0+OCpq1wu5O27Xyxo8EjLlW60Md3ytn0x7R2BfHSfedzfBdtrCj3FDA
 XoQ4e0S+b1SQJVDIxwg+Z8ArrGuWj5m7OzWV2o1NQDol5D7VJe05YmQPL1uglvK4ubUlCwWuQ
 Wbb7PVTTL+1veTHrLr4XcpHp9wnHjWQoUVbFvOhjXJpvg/ReMTuQd56gBoMOpAlQYMSwnDddw
 lXmXQ2oBuLS+mbkgp58rZu13R0uim3Bd8pTdxPBRkUJ1GdTFU1x9iokTP729ZYSQHeKZmlR52
 nf+wriMdbrRDHF2vgPNDesQRcVGej6SqJOysxYPTEg0uYzcNDwIlVmVNT1QCc9BzHAt2ZRU3S
 m+k7vFQOJ1O+gcvBHYXqnk2M8vgOoErrEIX6MrxwXlfgFX79TInJpPkwIqwuK+FDRvZh8m9cs
 OrqOm8xKhgjBxfUcYNiISL0FvJfr+WycOarmEtbDSeSmePxSw5QJBd2y6jIxZSf4h/zJmzhIq
 7nMaa9ggSSpjOP28EOVXa2/hC99fuWfKOJGWb0jxQF1g4CotFh8/V6GamfVTp1fyRfzjIVoaA
 x1gzE0f59bAMjaP31n5GwDkNIJk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691646611; x=1692251411; i=dalang@gmx.at;
 bh=XbPrWAoFGtINvY183ydPe8H8StMtsqNHr7YfFZDb6S8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ttLER0QNkBr5t8t5VwfZZn4bl/hsVlxf+kcTkcWx0zID1XPAHm1rNT96hIWEZhH9EZuIP0/
 uJ+dnjyZegvHfqc2wwdvdzGdGx0Zz8fnhCVyrYrGD0Tv1Kd+jFbygTuIvRfusoJ4/kZiV3o1H
 a0fsgXcAZ07gmmeC1z9O2PcEalK78T+jMdDEK8+ArH7jWVrQdi3DLC4Gl4LcLbf9Z3FS9hME9
 2d+mDqTgIKUxDNznELRuTOTF/rtUvNVimpTcWWafu6GZQxtFuIksgQEP3oODVcJLNEGS5kfDj
 MNN3sIiIT1XFXtV3XVjXerjT0mXkTO997YPE815H1PFNSshkzzCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=ttLER0QN
Subject: [Buildroot] [PATCH v2 7/7] support/scripts/pkg-stats: Only match
 CPE vendor and product
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of checking if the whole CPE string is known in the database,
only check if a string with the same vendor and product exists.

Reported-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 support/scripts/pkg-stats | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 2b23681946..c4b9c5d3b9 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -650,11 +650,12 @@ def check_package_cves(nvd_path, packages):
 
 def check_package_cpes(nvd_path, packages):
     cpe_api = CPE_API(nvd_path)
-    cpes = cpe_api.load_ids()
+    cpe_api.load_ids()
+    cpe_api.generate_partials()
     for p in packages:
         if not p.cpeid:
             continue
-        if p.cpeid in cpes:
+        if cpe_api.find_partial(p.cpeid):
             p.status['cpe'] = ("ok", "verified CPE identifier")
         else:
             p.status['cpe'] = ("error", "CPE version unknown in CPE database")
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
