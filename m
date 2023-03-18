Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E1C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 00:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A0960B60;
	Sat, 18 Mar 2023 00:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27A0960B60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPoATyqq-op2; Sat, 18 Mar 2023 00:04:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 615AA60C33;
	Sat, 18 Mar 2023 00:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 615AA60C33
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFC051BF420
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 00:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C828D4092C
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 00:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C828D4092C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cJleu49fyPl8 for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 00:04:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2695C4092B
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2695C4092B
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 00:04:51 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.31.86])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9F2FB2003B4;
 Sat, 18 Mar 2023 01:04:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 01:04:39 +0100
Message-Id: <20230318000439.2710306-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679097887;
 bh=HwAfalsWdPkx8FqrLmDRd76PDhab3Pd3rU/rdwPLHFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=WxkRjBrXKHkUk7QNkccU0K3PWgDnF+INrTYp1HPkUEbQzfep/FdvSqEsrIJysUpHm
 TYVkqDbu3vej3T11cvoRwkhWCqDlExC5UNsbs6Kb38/eb6rh7VrVGeDV9+QlWvEGoq
 p6s/QPggqlEXTMg2qAI0nATnjXO2MbLub/VJ+Zx/jeyfv9u0QupFmQUkU4w5IQAGJF
 7Za0G9QcdlOVe96fxn0zXO+KAvZ2jHDS+isBY3ItIarxQ5eR1L0UfqPCUXgLpZXQ6x
 VdPLpJ18SJuYN0EhrVhW7E+LIvxthgnclYETDpm2Vw5oGgvA2tvIIVYyy1GG+h8f4+
 jmBUKQnGYKxDA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WxkRjBrX
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v45.0
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
https://github.com/linux-rdma/rdma-core/releases/tag/v45.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d305189 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_rdma_core
    ...
    OK

    utils/test-pkg -a -p rdma-core
    ...
    45 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/rdma-core/rdma-core.hash | 2 +-
 package/rdma-core/rdma-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rdma-core/rdma-core.hash b/package/rdma-core/rdma-core.hash
index 1aff44f7f4..128ca54e3e 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  4a2eec55b37ac25f25e7680a372f71c1781c23808542bd31fb68dc0448b8cba2  rdma-core-44.0.tar.gz
+sha256  8725cf10f05579585c9fdebdce5613120e632f204fc098a77d24f5974a0c4321  rdma-core-45.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 885821bf98..0cbe22d043 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 44.0
+RDMA_CORE_VERSION = 45.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
