Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B2C5B552
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 10:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1B3341EA4;
	Tue, 10 Jun 2025 10:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZIQ5oyceqDU; Tue, 10 Jun 2025 10:12:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF77F41E7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF77F41E7C;
	Tue, 10 Jun 2025 10:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A53D1F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BD4583139
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9bgF_3GLPr6 for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 10:12:08 +0000 (UTC)
X-Greylist: delayed 305 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Jun 2025 10:12:07 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 089F882C98
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 089F882C98
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de;
 envelope-from=thomas.claveirole@green-communications.fr; receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 089F882C98
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 10:12:07 +0000 (UTC)
Received: from lesya.tangerine ([185.213.154.178]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MAgIQ-1uVZjH0Gj2-007NDV; Tue, 10 Jun 2025 12:06:59 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Cc: Johan Oudinet <johan.oudinet@gmail.com>,
 Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Tue, 10 Jun 2025 12:06:21 +0200
Message-ID: <20250610100622.1755003-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:thGSuN2VQOtd4B88zJ2+9u9V6ZOhvetcH0HmCjAU48sVpstqtsk
 NBwwJSP7yFbi5JrxacP4HZeMUInQ6upY8ppOzM0ElsBdgcRH0CfGR/wZFHmUnJzMxJ6ys54
 DL8f/VQFZC8gaDNxxMusPI+M5rpMCyScI/pxGD2NtfFOH213knc0m6Ygodl/3LV3K/I5hGJ
 kJaWO3eb8Y0Tz3AG45PHA==
UI-OutboundReport: notjunk:1;M01:P0:1bpDoGAi9V8=;iH6C+8S8wMRm7y5GjAey2HCYmsT
 qd6v0f3Dj1P6yJot0DjV/takGuyn3fSoYRuVyg2NKZL3jV8LsQKkBfpnMAe9nzSPQprr4rHfG
 uBZ/hjS4U7owdwcQeXBw+ylyuefyPICVR+lSFSlwPvp2taBCBWnypWyjWPHEh2bPHL/6ULSNa
 +w9Phl2Zpo11Y0jhDHptNSScuaGLKlnY6FPL6QP+E+nlgbe7DvbDqSpmCDOgGuI/tki5MxhnV
 0jShvOoPK6h8T6vLEmsAdn7uA3Rb0w7V2dkeoGiOhtlbPjUcehAyCs7XMi/FLAFIO9ZvaR7Sy
 MLikzfZ6jks2Mn3q9375FslNNQA2EDrUwVD5A6wuv6mhwgkiLHJ7O5oeFXDAmgkfF6tpIg+rd
 g6Y4RBDDuIOf6kJT2a9kNkdZCbsnFqLnCABlwtVV56/cToW/euzc3uNqHTdl5X4qALjIEFUlt
 RJOSKMohUiocReBT3xdCltq3NJrkyIxZ5uMH6F/4UlqvdfaSbR5eKolwwCcqH9XhFVnufrbr8
 oyXj3+3d712IwhWLGgUtEoBIwk3MGqy8u+d4ECWVabDnLT0wcEDV+kXurjY4h5qKXGZWLn6v3
 Sg7E8lDf/4Aq4eAWvX0QsSRjVxy8hebFBQZbSY/00brUYjJyURCWKLWvT1CfWW+JOl0OV2V+J
 rRAfH6mMakiCQJHz9qbNb+fCHPYwhaOImyQdS8UYI4pLMFTYIL0zIxLbfiUqgLfJ02Izy3E6c
 xBEZbqQpnvAHAx8UX8gkLdeu628CVvZ8VvASD9vMo19fYlYru9JrtxqoRkYuh59JeJjFKBSvd
 tPspAz3HqNto13JWgIs8rVkovAkNF3ZYDtbaWMCW4U06Pgt03FTCOJpxSCc76S/pC5cWdme+G
 9KsEt/kGnfaCzkBMASjPJPQRSIzNfwo+7HjPI1PpNKre5Y7jLej4FzzAWr6pFTqvQjp1pLylw
 H+GqQz3Lf5REDPtooaqzien3JC0HLB9D1VEo8nOjjJurkG5omIkGTm/m4QwVulkScLb1FLV2K
 z94mbfSfRldbsa1VPH2YmbjEnzLBxTu3TbaTuTj/58gaBrPrQqej1RQRAAy50YLV8Y3FB+iJS
 RqTAKJchVrUnTe0fP1UnKYKIyK3X1LCcX5xctMme5HhcmYGeYlDdkYmGdD164Xi3lK8Oyqd67
 t/AjxXuzMFR0HFHfa70tkAeTVNxAXAQDTe+0uUt2+TCv2DdC21wpx8IIUctfaCWrU3TgXRK56
 WIYmS0O+yCrXs+Du7qrtfQoV0aNUZCtuvz/47M89sig7RvYPv0Djs1u2dmZKrB9aXgG32mMaX
 m+0AEAaTHY0qAa/6tw/FyPJoF0+WUzEsf2pYTUSvaokxsya/FCal9onSipWxypO5fWk952mCz
 CZPAF9bT/gi0wY0YZIHQfjJvWVubAPn5Bdf2zbAbjDVv/6oZwZg5k2e5v7IL6jkY4GnSeP6nY
 tof6a0AOlFJ1y7Y2gnFCJWxDp39c=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.5.16
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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
index 127d6201a3..894eaa4874 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca13a1928f3c57c6b84f64c84c066e410f91c4f3c25ae61f5fce1557210b9927  vue-3.5.12.tgz
+sha256  afddbe7bb09a00bb23e738c2a5354819bf662955fd4a06abc630a3d1acc41a8b  vue-3.5.16.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index f2b5168c9f..8f5c002548 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.5.12
+VUEJS_VERSION = 3.5.16
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
