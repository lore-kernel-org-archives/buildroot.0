Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA903C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C4C66112D
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 21:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C4C66112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78076078F;
	Mon, 18 Oct 2021 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hNgxzbH0d4Fp; Mon, 18 Oct 2021 21:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CF4F60787;
	Mon, 18 Oct 2021 21:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C6401BF36A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B0F5402AE
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 21:40:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 579EzxnLGXXz for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 21:40:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from da1vs04.rockwellcollins.com (da1vs04.rockwellcollins.com
 [205.175.227.52])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B35940154
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:40:17 +0000 (UTC)
IronPort-SDR: 36saruytCW9VTMmAPnH9KmxfXdvWKjtuPWx9koPf7VZ96JMDQn6Kn/qKOYGhG+ZrgVqTgy0s+K
 Y2DipMzq2FL6B8CcK/o0/vueSlwV8O+F8cP9qx+Irgug6puWDrRj8RLmzfAqonE82O56Yw1oX7
 CaqApSE8TxiiuC/cbVwTFLCByIVZxTaeuP4lm7EuN6cp+Nn5Lr+eVaTfwatdq2V1I5wA6Bjlno
 jjnUHcZuYsd94ZpquvJdabQrw8tpBnGbymP/6rdV1bpUSR+rxQY8aXoUlQJrMAFCTs9pyG0yws
 U60=
Received: from ofwda1n02.rockwellcollins.com (HELO
 dtulimr01.rockwellcollins.com) ([205.175.227.14])
 by da1vs04.rockwellcollins.com with ESMTP; 18 Oct 2021 16:40:17 -0500
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 5E98360325;
 Mon, 18 Oct 2021 16:40:16 -0500 (CDT)
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 16:40:14 -0500
Message-Id: <20211018214014.1202-2-matthew.weber@collins.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018214014.1202-1-matthew.weber@collins.com>
References: <20211018214014.1202-1-matthew.weber@collins.com>
Subject: [Buildroot] [PATCH 2/2] package/lightning: [revert]ignore not
 applicable CVE-2020-7747
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Matthew Weber <matthew.weber@collins.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 613953f8217bf5b27489e0a939147ef7c74c3f7a.

A new CPE ID was assigned by NIST and this whitelist can be
dropped as the package is setup to use the correct CPE (Not
to be confused with the other lightning-* packages which show
up when a free txt search is used to find the CVE.)

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 package/lightning/lightning.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index c0036e5cd1..da8c07e61f 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -13,10 +13,6 @@ LIGHTNING_CPE_ID_VENDOR = gnu
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
-# CVE-2020-7747 is for the Javascript lightning-server project, and not for
-# GNU Lightning.
-LIGHTNING_IGNORE_CVES = CVE-2020-7747
-
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
