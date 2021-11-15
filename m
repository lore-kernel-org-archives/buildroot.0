Return-Path: <SRS0=AoHb=QC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFE1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:13:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7FCB6126A
	for <buildroot@archiver.kernel.org>; Mon, 15 Nov 2021 15:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D7FCB6126A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EE98605E1;
	Mon, 15 Nov 2021 15:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOym3jOzJR88; Mon, 15 Nov 2021 15:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B69600C4;
	Mon, 15 Nov 2021 15:13:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 130E11BF3BA
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F81E600C4
 for <buildroot@lists.busybox.net>; Mon, 15 Nov 2021 15:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zk46ttpmGjYG for <buildroot@lists.busybox.net>;
 Mon, 15 Nov 2021 15:13:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C04426005E
 for <buildroot@buildroot.org>; Mon, 15 Nov 2021 15:13:26 +0000 (UTC)
Received: from hardbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.184]) with ESMTPSA (Nemesis)
 id 1MrxfX-1mJJ0I2w3Z-00nzty; Mon, 15 Nov 2021 16:13:23 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Nov 2021 16:13:05 +0100
Message-Id: <20211115151305.61340-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211115151305.61340-1-thomas.claveirole@green-communications.fr>
References: <20211115151305.61340-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zsa0jO4Em1tlbFU7W3beMHbZR64Mu67YfXYChHpqf4uTCoPqWGH
 jairUfIv+pBRs7EeCyV0/nBkhyMqDTaTXK8/zkHBa+NbiLD+NLEfnz4YcF3+JJQC/1sDKOr
 fMqMWZHUxiPR4k+VTR34C4yNm2+YWdvoLixiMOtsNApSaeTQ4NbsH8i005ZrukMQnLVeMHE
 aco1IQoaw4dAI8gjq2eiQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SlyXicdGUtw=:dfe6JbqRMRQkQUPPoqf2Zo
 HoS7Lg5BNIh/7dma1Y8HhqQde9xMS2/ZBk8zkNf2U/G/ZIuEnNIqu14nxWyjUUGQCLu3ZIOfy
 SJpRQo26ed1PovFelc9ILdO1bLaE5vZ9B85Xn3SsPYngdZd+s2X+vOBh6G/3d9P9Wug8JGmwg
 HbvAWsvxNtbznhaHYG4cEltz+ELTa1LubPrgEA54JksM8fYktmupfji8M2gx36CU5LVtg6wXe
 nrb5KkvWa9dgoh/EBPvNGT/KlSWRkJQuLNmP0NLKt0FwcvhkM6bubpVBhBxC/QbjvBZcaw6MO
 0WdXIrz0rWgZEgngonGzvemRI8z7FKVbnhiE2S/GKbatVua++9VhIkSW4I5qP3ZlcRgoVkuQj
 8GRT19xLsbfTZNpzSbXCsWsqXq8WaGWGWSh4rBFBxf2FwEThM8MNO8oCQIQbyiW4Nojs7p3/E
 tlPaRaJZcdzThMKPzkzluBVtJe5BeTVfi2hO2ICvePG1PsEI2k5Qw/D6xI5tLJD0wM59TInSI
 UNn27Wj5eUvq+UaCjEiH9VcN+E1dHD9EDLkJtw59gtzbjUJjRwwuG/KhdLoV7WrLw9+aODgDk
 ZHkfiy7wzNrJ911PFjEmBItN5W39urfnKsy6/XSbGILWH3Y+HxAfM9YVnJ4+9elOzLqx7fRk1
 baqKNjezy2ooCxnJLePTV0s14VYymMy5A7agxUXn7wSRN/cD9aF9cLgowLCTJecziL++8TvNt
 HO4sG21zuPFF0jgcVB+2c0mMaAjsD9GORe+8Bw==
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.0.12
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
index 1e5f850ca6..13ce97d32c 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  317ae9b916b9a8c5ec521697c345bef15759887d63342ddf19c18ff05ca279b9  vue-router-4.0.11.tgz
+sha256  baf5e9dfb0a1e344f0f460a5cd521e17fd3842386ce36b8e6d53c1053d49cf1e  vue-router-4.0.12.tgz
 sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 3f6bcc5067..9c7dcc76bf 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.0.11
+VUEJS_ROUTER_VERSION = 4.0.12
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
