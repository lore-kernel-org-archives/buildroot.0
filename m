Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F0CC77B7D
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD3B4160F;
	Sat, 13 May 2023 20:53:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD3B4160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpILzWk09gSA; Sat, 13 May 2023 20:53:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9423415FF;
	Sat, 13 May 2023 20:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9423415FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D14BD1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7B7160030
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:53:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B7160030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KW-AAvnqnvO7 for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:53:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B793D60761
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B793D60761
 for <buildroot@buildroot.org>; Sat, 13 May 2023 20:53:23 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.247.97])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 490CE78032A;
 Sat, 13 May 2023 22:53:19 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 22:53:12 +0200
Message-Id: <20230513205312.408050-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684011200;
 bh=n2N8Y2OOYQLyrg1n1DgyFd4mL6FD9w7VATSCv4DKGYk=;
 h=From:To:Cc:Subject:Date:From;
 b=bxv+mZqPHFuPYTfyZGO93P5ZubXKnccCPwkkcf2gvTOgZG1uFe8L3H3FLF3vn9rK4
 HmO89+SsredMdqKMRv0ZQSV1leFPL7PEDg0sY5QAPaDMG0GCtBFDK6KVdfHItR8iJu
 yhS8oANqu9p/aoitnyRFTJAtRLqzqmZhuIyn/g0VP6FL+ggSa5XcNVXfuN5GqVtivc
 x8IUZ2cVR0Pu5pstJR7/smI4MiBplMkLJ1xFcqSVvljf1IjHJejCZdmK/XYu00HHOv
 M9ybHvh6VRhjN438PwBSHv5jppKD1cK07MXIQLA//5kn7sznNBxFq9i2p8SoAbqKE0
 DhStNHsrUUGfA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bxv+mZqP
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v46.0
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
https://github.com/linux-rdma/rdma-core/releases/tag/v46.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d1b8e72 with commands:

    utils/docker-run make check-package
    382270 lines processed
    0 warnings generated

    utils/test-pkg -p rdma-core
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

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
index 128ca54e3e..b6ded0af5b 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  8725cf10f05579585c9fdebdce5613120e632f204fc098a77d24f5974a0c4321  rdma-core-45.0.tar.gz
+sha256  23fd2a5a656f7d147796660c3d3728b31287bc70a3e913e28ea5da7f39269229  rdma-core-46.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 0cbe22d043..acacc0320a 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 45.0
+RDMA_CORE_VERSION = 46.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
