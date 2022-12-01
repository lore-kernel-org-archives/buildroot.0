Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD325C43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 13:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 375D081F26;
	Thu,  1 Dec 2022 13:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 375D081F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hRNIGY6GML9q; Thu,  1 Dec 2022 13:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7768381E3A;
	Thu,  1 Dec 2022 13:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7768381E3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 94F2A1BF3A7
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 13:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C763418D2
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 13:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C763418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1_MpbsUQr95 for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 13:55:28 +0000 (UTC)
X-Greylist: delayed 00:05:09 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D82E1418C8
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D82E1418C8
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 13:55:27 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MaIvT-1pWvxn0sq5-00WFBI; Thu, 01 Dec 2022 14:50:18 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 14:48:39 +0100
Message-Id: <20221201134840.18838-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221201134840.18838-1-thomas.claveirole@green-communications.fr>
References: <20221201134840.18838-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+9AGR6jquVLCvgaqlLm1UuTVS2QpBZVlNfp1/BxwkKnFjJxNHEG
 dHcN0FpzFCbtbI5Ob/6m2G2w7LaMn4s7KMyV5VLtgx03+PnqaBRn1TdbFplR4XEq6GVB/7N
 /8v9TDbdxkInkKclPsoON5VitrkEQR+apnk2rIBAnYsip3mA1OPbI+drK6FBAoSOzXbW3BP
 ZHqiY0l1quJH54PtTkT1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BWTtF23TGgM=:FAlBJzUqlckBAKwRV+eSt9
 OFlGl4HKNUOLtuviieMCU0lEE5Zs67skgm5x072xicYEfwaa8yNtq99IsKoCKK5AhbkPuSJGY
 VyzRZkER8947eCZtrLqOmHuhOHXk/YC3vBHMYMzB/fqXa/7URljapm4FuGGEh9C3m6XlbySvS
 tDa6GJUjD7uPHF0avtSeGlF7fnyiMC4eEe+vFsZM/fgM9EXVIq6rLAyucjKJi2blx5a5T32AG
 0bfvWkaLnLHTR2skvKi388mCaqAUFNf2kOFYUy1jYrpRXyIiRR3PhTZd15Aqv1l+RSIWW5MS5
 pb2SY7aUwTWM6nVDDOHANlkJy4KiTlW8OhErt9KxNxaeKilXTLZSdYmWJ6pTWJYLq2w2G0AGS
 HHkBi88Uqz6SPiB7PPu+BValeJ7wtzKhQ/KZe3g3u0+oCNuSnAkQD9cwJFLKwvQ3TR0MkT/oo
 Wcbxm+JV4bnO5XHIG0yzNdhxV5z1/hD9qlBosXuqipEObbGOo8BXj0egc99z6VEqw5o0+qNsb
 C4XXftKRKE3wrrlYLWeeshLeFLX2eFQUaN9CackLLuCO9fdzYDItSJzVnxKTEP+5yBvF2FVu1
 6D2mLdxJ+aErmRIHYnuB6cuLto7sCPEG+uysLYJkYcwHc5RgS9GIvc8x8mZOUEVMzDv9+rg5R
 5dqho8sNeZ4usJcxUdSPVBFcVrHoYtlXVDmDRlGZDkJ+7nEALJaPlpq+1W77Oj9ILsXr2FS3K
 V0uerIZB4G1DdJFPtyiuy5rPdSLuzOIoIbyzSqMdg1KQX9WUbqrVikIbwMVFNZ8uMFJc/kXlY
 rLgokCefL5J+daJTLIRQIvKnIHtbm/HE0PtfAJKhZzbjMZlA0E=
Subject: [Buildroot] [PATCH 2/3] package/vuejs-router: bump version to 4.1.6
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
 package/vuejs-router/vuejs-router.hash | 2 +-
 package/vuejs-router/vuejs-router.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index ba8f09b508..147e730f20 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  59d6f3e237e68953fc4e4e22463b487b9fde5733b3ff3392eec488c0cc84976b  vue-router-4.0.15.tgz
+sha256  437558a84b99d0d89743d4897ec16a90a96a1d3a6786e697a8808a044bcb9b8f  vue-router-4.1.6.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 562c698157..de7e9c30c5 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.15
+VUEJS_ROUTER_VERSION = 4.1.6
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
