Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F59C00528
	for <buildroot@archiver.kernel.org>; Mon, 24 Jul 2023 17:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 676E1417DA;
	Mon, 24 Jul 2023 17:29:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 676E1417DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1NlcjvK-4hQ; Mon, 24 Jul 2023 17:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE81417D6;
	Mon, 24 Jul 2023 17:29:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE81417D6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D81C1BF488
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 415B6608A6
 for <buildroot@lists.busybox.net>; Mon, 24 Jul 2023 17:28:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 415B6608A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FePx80z7H2Il for <buildroot@lists.busybox.net>;
 Mon, 24 Jul 2023 17:28:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62D7060BA9
 for <buildroot@buildroot.org>; Mon, 24 Jul 2023 17:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D7060BA9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 24D4513F81D;
 Mon, 24 Jul 2023 19:28:52 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 24 Jul 2023 19:28:47 +0200
Message-ID: <20230724172847.51864-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690219733;
 bh=x641p6sw2WC+nERUUiG5sBApHbLqNbr1VfcsWWGcjFY=;
 h=From:To:Cc:Subject:Date:From;
 b=pnRuiJx4G1Q5c5sjszpqNuXbTgnUzrzRLtdLrrzbfRBtt/yWrxQw0Lk04rBwajukw
 YInUmRsg4RUsjDVYDQVs7NdeLwnJ+VUcacvDIs6NtONRs56OwPzd5nnqyK0uVJV94J
 /dzxs1hmWScCIx1opQVXpHQtK33zNK1DHnarVTWeEnOeSOV+j0GG2y8OCcRWFvcZWM
 stjZH7/A97s+m++K7OU7TjwoFTCJepRpNbTGpDzc685iGCK46cROZHLte07jQ4VoKY
 JCZ270MltiuTTfr38muRbvM5DRjt+gPnC2AaxwF34PRq0dZkp3X4Fd1fvmCvHsj7tg
 P4oWMeYFA95jw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pnRuiJx4
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v47.0
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

For change log, see:
https://github.com/linux-rdma/rdma-core/releases/tag/v47.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit f359791 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p rdma-core
    ...
    45 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rdma_core
    ...
    OK
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index b6ded0af5b..0dfcce7fe4 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  23fd2a5a656f7d147796660c3d3728b31287bc70a3e913e28ea5da7f39269229  rdma-core-46.0.tar.gz
+sha256  c1d84405e05e00bfd99732bdc1b8394ac1332ffd0eedbf0af99f926732f67044  rdma-core-47.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index acacc0320a..9cc9434744 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 46.0
+RDMA_CORE_VERSION = 47.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
