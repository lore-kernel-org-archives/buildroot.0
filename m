Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3FCC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 16:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2850A40900;
	Sat, 10 Jun 2023 16:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2850A40900
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9E-PgrD1u4Ze; Sat, 10 Jun 2023 16:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E48A40903;
	Sat, 10 Jun 2023 16:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E48A40903
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA3771BF32E
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C01AF60F8C
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 16:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C01AF60F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36shUrF0Y0Mh for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 16:58:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A34960F89
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A34960F89
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 16:58:25 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.169.92.5])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5942F6013E;
 Sat, 10 Jun 2023 18:58:20 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 18:58:12 +0200
Message-ID: <20230610165813.357109-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686416301;
 bh=xdRH6SCB2MYSscDqKQdRU6DT988PndFFECRjakmYsRE=;
 h=From:To:Cc:Subject:Date:From;
 b=oFRKSXZcb0CsnpEMb/DLOqmAE8L/fpCMPr+5o3nSp+nNBW8gIuVJNYuCVIQ1Vjoo6
 HKSHk+G2plfRWcA6UzXeSDq5XGewFCWZfo3xWKYfxlVvpZ1Z6I8hrdKzJf2HINVPp6
 WHA3TLCtAL49K/u50wxDO7wGnv3yaknCQj4fw6lT8hvqXhAmOhmpJla/qRNY5zxtuR
 f7jGxx6+zNqshnKybLJBp0uVQERDmu2rF5G6MQQVL+mEqsjs9ZLSi56YaeDrbE3oBE
 4sjm3vgvHkQHAYi6a5VVLH9PfzVDVOo0Wi1nt1t1DsbzmFxN59gDjF9ha0E+QElGj4
 F0A/Tb5qAIbmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oFRKSXZc
Subject: [Buildroot] [PATCH 1/2] package/perftest: bump to version
 23.04.0-0.23
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://github.com/linux-rdma/perftest/releases/tag/23.04.0-0.23

Note: the version scheme changed since the previous version, from
"v4.5-0.20" to "23.04.0-0.23" (the "v" was removed).

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index 4333231c44..a9ea10ef44 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32e667dac1c0dd41a3951c5a54b961a8e28db5d9478caea2dfc268a312968c99  perftest-4.5-0.20.tar.gz
+sha256  c76f0fd5524a3486c335897357c596d0a6d4f82680f93fc1bc7120670fabd5f9  perftest-23.04.0-0.23.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 7ad20d0974..7101e318aa 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 4.5-0.20
-PERFTEST_SITE = $(call github,linux-rdma,perftest,v$(PERFTEST_VERSION))
+PERFTEST_VERSION = 23.04.0-0.23
+PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
 PERFTEST_DEPENDENCIES = pciutils rdma-core
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
