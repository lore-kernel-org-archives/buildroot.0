Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D5FCD80CD
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1796C41B97;
	Tue, 10 Oct 2023 13:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1796C41B97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2PAVIhihgoj; Tue, 10 Oct 2023 13:22:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3C11409B1;
	Tue, 10 Oct 2023 13:22:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3C11409B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E42F61BF3DF
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDA8681EC0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDA8681EC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vnGaB6wdR4XM for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 13:22:11 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8040981EBF
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8040981EBF
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1N4i3j-1rXTIm0p4Z-011mlt; Tue, 10 Oct 2023 15:17:03 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 15:16:26 +0200
Message-ID: <20231010131626.1128436-2-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010131626.1128436-1-thomas.claveirole@green-communications.fr>
References: <20231010131626.1128436-1-thomas.claveirole@green-communications.fr>
MIME-Version: 1.0
X-Provags-ID: V03:K1:DhfRk0C1SNQK7O3MH4VJhju9kj/9MeCVa/NT26RHE9Wjdbcd46/
 PaV1zulFVoldzvf30ia8VNeFIotkU92IV5rdQ0DWZaCB+8v0sVHLsyI0Aembx1kuLiAXHTR
 hRiOKwqBDQhZ88CtbjTzGEzB8E7HDk+WuKLtLryDECC8kRQZsxE6TXVuNv8Ol1rUwmAusEO
 w+FEANd7GeRM8+kBrAJtQ==
UI-OutboundReport: notjunk:1;M01:P0:zg4nwKexEFk=;DLDaf3wnbK+nHFdYzCplpKtXO+y
 vULI5oCUzj72AAbjmeWAnG0zbj64y8Nz6TRVuTxfbVPB+4c3Kle7r0i9LAtDjKGZOVgPaAOYX
 UPxMj2DgmNpoJLsVpFm1eM1Sw8wAQaN7V4ah7WgBRJ8uy4/4+siPKptlo8mfVVEBn6KkNQZgj
 6NHIef/9wYbMjoGn+lAutGJJsPvRVLVxmrA9gXzRLsGj92hCmseejRpr5CTi6s7nWT5nM+eao
 8DbUj8o9VvFwOq6nhpZwd7Lv+z2vv7uTm22rwDIhH+sulh++9gBttzIn26NK7kgcThWKCwEw9
 zC3cvY1jqeLqZ01yJxgNvMoDm0/tZMnkT2AXVtALWmp+0Tm7ZYeQ+mM3QG7ZwxfQtG60T+5yg
 dervTn/RFgxHShsJS5TVmO3pNWkU7DrmilAn/7o5u8AfUr6tMLvUthGer0GSmnpUDzbZqbjwM
 t9ElfDuruicoMXAWkPHsp9mYfaS5ZM/dGHBzgMsGtUylCA1w9DmsoulTWSucg4oy96KgXRKl/
 4/UOPzi6pmRUWMzH+4nBZwWB9b0DrBgFWEG4nYryODOvX1YjdiExtAAnDuPd5rVc0d4FPp42b
 gurHaKk24IWD1twQEnLyiKghN1vDHTRICPXZoWeOh+lxCBLvXGPbsqCIo157PGNgFIMJYkii7
 xUGc1VaCjWHU4JqsbnKG4TM+rsMiff8gn8A6zTgj3QIVLqQ3c4kPoK3uGOqMBWw9hueAeQ2fy
 5BtjtK5Fv8ovx/f3Naof64YMbISx2tYBU8OsvlYZ+v97kotrvBAKdx+NU2qbj+8sauSB31NV3
 5++1bu4zeGIFT+uukR8or4VCaMOLhjD1yjfVixz2tBbLYeUNZzVFovv3BjHOuqu9xXqZCT8PT
 RScAh88gZ3Gb74A==
Subject: [Buildroot] [PATCH 2/2] package/vuejs-router: bump to version 4.2.5
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
index d9468e722d..f87d18f7ed 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b044e304367baaaf60fd2ee6880fb02d4e9875bc4321a4e2672a60ad4c5c55b2  vue-router-4.2.0.tgz
+sha256  61dc033860c42a2f3af046d461ef14348b1fe9094b27d107f7be6d1420d39b11  vue-router-4.2.5.tgz
 sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
index 2737134919..7f73fed5d5 100644
--- a/package/vuejs-router/vuejs-router.mk
+++ b/package/vuejs-router/vuejs-router.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_ROUTER_VERSION = 4.2.0
+VUEJS_ROUTER_VERSION = 4.2.5
 VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
 VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
 VUEJS_ROUTER_LICENSE = MIT
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
