Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F4BC07545
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 19:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE30C81E62;
	Wed, 25 Oct 2023 19:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE30C81E62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cpkn4qAH4O-M; Wed, 25 Oct 2023 19:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C80FE81E03;
	Wed, 25 Oct 2023 19:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C80FE81E03
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 731FD1BF976
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C12E81E00
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 19:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C12E81E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPaRwVJBygci for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 19:26:08 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C3AF81DF9
 for <buildroot@buildroot.org>; Wed, 25 Oct 2023 19:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C3AF81DF9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 650BA13F838;
 Wed, 25 Oct 2023 21:26:04 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 25 Oct 2023 21:25:53 +0200
Message-ID: <20231025192553.370253-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698261965;
 bh=LTDH7vVoiRcl5foQtOuVyaV9IdgjK7z+gu4KjRyste8=;
 h=From:To:Cc:Subject:Date:From;
 b=lCzB++svzxsZ3iRBPuJi6QcQ0Od2kg1PqBtDEvttyh+MjKZXJUfc0RKdlMkN4yesJ
 7jaofPPFDDHHD8rdJqREtUc0OwU2qGwkLl1XohJtt04PKM69by+ZqUGJv7PTkgmxlB
 iv0ijfankIcHhB+rZ6m/cowearYJVyNH55rhrp9mmHlmqrCRa2Mz981pc6d04vU9F9
 UQXLYO5hrJSdhW0Aj2ybca9EMxN//fe8/LrFptRR8AQU9/QBvAc44X3FLE0/4XQT4W
 ji2lWo7DmKicOweeL8UfpCeMW0wcu7fU1T87pIhLWBVgZ+1PRpiceifBnHeP69x/oW
 jx8kLLWxf8diw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lCzB++sv
Subject: [Buildroot] [PATCH 1/1] package/rdma-core: bump to version v48.0
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
https://github.com/linux-rdma/rdma-core/releases/tag/v48.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 75fa573 with commands:

    make check-package
    ...
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
index 0dfcce7fe4..f0f2448a8f 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c1d84405e05e00bfd99732bdc1b8394ac1332ffd0eedbf0af99f926732f67044  rdma-core-47.0.tar.gz
+sha256  e78abaa3ed16771bc6c40b538fe27082429363b86b6ce47636bb57a59238b2be  rdma-core-48.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 9cc9434744..41f10d44f6 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 47.0
+RDMA_CORE_VERSION = 48.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
