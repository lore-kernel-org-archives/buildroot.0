Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BD4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 14:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 546774031F;
	Thu, 12 May 2022 14:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-JR_cZmWZD0; Thu, 12 May 2022 14:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 285BD4025D;
	Thu, 12 May 2022 14:37:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E612A1BF3D7
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 14:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4585405B1
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 14:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lQ1tuvyr6r6 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 14:37:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93F3540025
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:37:09 +0000 (UTC)
Received: from harderbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis)
 id 1MXGes-1nHgvE30N4-00YhSD; Thu, 12 May 2022 16:37:06 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 16:36:47 +0200
Message-Id: <20220512143647.49989-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:FZV/HBYx3vtzKi0q+bPfcEeU79f518i/USVXNo7K84+wWh7qUwt
 gIvhcObCAnrO/hNFhhQjMvyH/JoSHtCMO3S0dXcZz/sVQZTqT5L5LFz+pVUDxWShBnihhoS
 UbwoPzIt3zDhtnoyUtojHR4IpWWr0x7PSdhkFqrnNJV6TP1+yD5jKr44B65qc5HW7e2nVRg
 kpIgQk+fbYiURmBGVktgQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PDZ0mGRJxZY=:dwA/zk3/xJfZzRU2t9UyDc
 zprTbQmV9dTJ3tELuiSoV5YQO4oq3gpTm+RG1kEnLCJMDdL0fSHnwIfSuVv2ljSOB9fOxClqY
 uCStiks7vZ6pXhhDoP3ZJapkfylukpzdwDCqjs0eHH5WiqZNAF23U+1TIKDm87R/AKfu//BE2
 55BKpWGXJcvYJJ2q4FMvFkhAiH3FuvVgxsylfQL8+jZ2QazndHGLn9jK7x1uRmg0BIleGTLy+
 s4YM91vekNyB/gqVYMaZmwX1p6VGFqGX4qSPQQY8ef5A3ku86sc2MLxuj39iN47hiUWVtcKB0
 0eP1PvY7s7HhJpnwHn9EFYa/621c5JHJHZL+RXcznfWyLjrEFYqIVf6llaYimQxRX9F49nyy/
 kHGY90aCuPgVMmcmizBmqI3xdfWlSa5RFzSCjnZPh9au/MzaTqsyPuqY4UUBVvE+srqLlllro
 LcwBmGgYFP13bgH7hBZ2Wi1/zGXdbWapdHVT9F5aA59UmknSH9z50EVThdQ5lqwra6NeFt6F9
 ZVsT3gkMXOiHKEeQFJz9lURF2Dat2rQQvCzQ9OnFlDOy+bYHrh9UxTz+/ZJV+zLDbrkbioBeO
 k+LAQvEndRLs0kCf9nAC/3D0gveF1Vg14Qx8NX5qwwm6PeQ6SKh6YCZ93uavKGE4hgV0viigO
 poMuIOFH4CpvQNT57XYWtM9FqJ4ei/20QnYEjwkGGNrMNGHXmOcSCrRYSDSNqD9vlzH4hpZDq
 VYeMJ116/TpD/8Z9w/jx53m149NxfJe91tsmxg==
Subject: [Buildroot] [PATCH 1/1] package/vuejs-router: bump to version 4.0.15
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
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
index fe270a6062..ba8f09b508 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6adff85db2045a092ba4bf37e95cdc3c661cfe4f3e7f7cbc36082a57c05c6365  vue-router-4.0.14.tgz
+sha256  59d6f3e237e68953fc4e4e22463b487b9fde5733b3ff3392eec488c0cc84976b  vue-router-4.0.15.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 397a78e1a7..562c698157 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.14
+VUEJS_ROUTER_VERSION = 4.0.15
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
