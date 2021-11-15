Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31ACC433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:18:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CAF361B04
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CAF361B04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F6E440218;
	Mon, 15 Nov 2021 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fi4bt2W5Nykn; Mon, 15 Nov 2021 15:18:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74358401EF;
	Mon, 15 Nov 2021 15:18:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CDAE71BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B915240178
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fGn14BYHp77T for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:18:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5ED7A40106
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:18:29 +0000 (UTC)
Received: from hardbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis)
 id 1MQMdz-1n01h03PCT-00MKZ4; Mon, 15 Nov 2021 16:13:19 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 16:13:04 +0100
Message-Id: <20211115151305.61340-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:7C22JCNDqBiiGjbjN52EAD3FWvphR495g+CpD43UWPiU7ii81e+
 UyREA7JzqvCrXq262g+wBPEFrE4jGAEqH6xkEpqO9KWvs7FXZHWFHU+Wg0FlK9Pk51PZSE3
 Z8CGEac9Ky5ECqZIvvf+QooExlNtip49kQ+whHK3MCNBhYsOOrDzuQ5zJ2OlPpErNrpnOGl
 fs/VPKbKL43d/bMHpSH8Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DvcAw6OB/94=:yyGumzfV3EfVskYxP8tjwH
 7wiAHKu8agGvIjrFcCsX3inPsK85Osf2o/VEdbsu9OOtQTLmfb+5Mrgzn4jb7eVwgJtbKrEot
 +z4Nx7l2oChi/q8TWt/5fNditf2Os08mDxVMGPINu0pA9KI1Y9umzxCUlBoVYd4FZR89wuXBr
 BlP2j1NC6ufu/AoUAtyWMOmbkpSJQJjvmHi1fJktKMiEw1z9t/AYcgRYc8a66JBpsB0OMz2Tj
 WM3mAJTCZ8i4K4OFvz4/rte1wHMZ3b2XX3f35+fYVEyqOuT47cE1vG9KDGE5mSkdLXRvpUY2g
 hAJbKPGKdriHHpokbbgVaiEY75pz8BBaQAgVeZhU8WI+5QQNs7bfGL6+P7M5fx4u3Btri3oaj
 p1KvBRrLzOWGqZATO3DmD+IvakcSDfOaWxA89xjQTliopyeBH7EZKG3QQvjCjdNi0M+USwwZ2
 uW+kJoWMK2Ic/CFbOBZ3xtnmdhAiWShB5RuODSepHkIX5EjtMCLkG0w1nlq9YFYWRBb7Tw5xi
 ZwewCJSl4LoLwapbeJYRxgSX9xn8Xd0JAiG1iqptYGt8YSmkwq1kQ7sOYGOsI7VuI2RCGQVCt
 GLAuHoGEum2desULyBF9uGh6BX0yPaUaZQ0bA7MAsMyVN5O8mXUFSD9YoI2VdTM/r7LZ34M68
 hI+kNb1dPSLwyFoir1wIddlJQUmOwQqtHGI4aHnRWV4z/DflraWWYBwLJvX6CYHCHrU/Ivd+P
 7IL0W32FouLp460IskhG/qKkUsow4b4Nem8MnQ==
Subject: [Buildroot] [PATCH 1/2] package/vuejs: bump to version 3.2.22
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
index 1801a0c6e9..9dd0fb548b 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  464ea5fdbcb51eee0b5f4762f169024b36a3bcd2c039ea8608b17fdd8a8595e9  vue-3.2.6.tgz
+sha256  770ff74851f7454977f084becd76b05b3fad4d52f048df5405d41849c125956c  vue-3.2.22.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index e2fc2c2dfb..b74002e932 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.6
+VUEJS_VERSION = 3.2.22
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
