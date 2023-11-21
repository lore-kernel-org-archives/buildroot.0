Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA5BC61D85
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 18:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E4680BFB;
	Tue, 21 Nov 2023 18:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05E4680BFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPlkvwWVZdP3; Tue, 21 Nov 2023 18:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56C81812DB;
	Tue, 21 Nov 2023 18:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C81812DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252CE1BF5D7
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3584113A
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 18:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3584113A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtfNRFohZrRx for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 18:03:50 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9123840C08
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 18:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9123840C08
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3B0FF13FA41;
 Tue, 21 Nov 2023 19:03:46 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 19:03:39 +0100
Message-ID: <20231121180339.3015360-1-ju.o@free.fr>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700589827;
 bh=wvjfbSgLK7/XjyXjbfzmyyuSYOPxN+r4ppMTIwS5Xdo=;
 h=From:To:Cc:Subject:Date:From;
 b=qVgrMg6zeWcd29Eyc4A63zShyws5Gof3hl350j3hxkdAK/7MPK55hMRw98Q6wRtPo
 2IcyY6gX5U5hbP9Wf9/2hd6scMfWcFVz8H3P4mF4vcWkk3kqzyG6MDS6n9OsBhwpWv
 ajBBJXyfZwvJS2C0BFTBAXBJFzqbing8i9BNHu+r0MRT5TpXH9YGQ/WjdC4bpWKTxd
 unlJ2TbibR1Ao8VzeGZl2NzBsW0yI6bbpcvkLJpHQ7O9aKaudfNfJUBxWm6HcEYH5d
 WPlkNhfru6kEKp8nyULj0jPbm0x0W4MjCsWV4iFGIypl8/RisuXhgboq/by+JtFYQr
 hcp7mjSfuGl6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qVgrMg6z
Subject: [Buildroot] [PATCH next 1/1] package/rdma-core: bump to version
 v49.0
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
https://github.com/linux-rdma/rdma-core/releases/tag/v49.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit a743087 with commands:

    make check-package
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
index f0f2448a8f..fc1d319123 100644
--- a/package/rdma-core/rdma-core.hash
+++ b/package/rdma-core/rdma-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e78abaa3ed16771bc6c40b538fe27082429363b86b6ce47636bb57a59238b2be  rdma-core-48.0.tar.gz
+sha256  1ea2c2678d48be0b179871e9ae8c58ceab11a0c5b69315a332ff51dd607180b7  rdma-core-49.0.tar.gz
 sha256  99e0df1d009a21d0dfb031600c550fd8f4efc0c6b2a4ef8b34a995aa6f79c9f4  COPYING.BSD_MIT
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPL2
 sha256  c46a557f25b8ef9bec76526c4e593fc13e6cba27e7ba30d73b6497a689cf06f6  COPYING.md
diff --git a/package/rdma-core/rdma-core.mk b/package/rdma-core/rdma-core.mk
index 41f10d44f6..5f8989b3bd 100644
--- a/package/rdma-core/rdma-core.mk
+++ b/package/rdma-core/rdma-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RDMA_CORE_VERSION = 48.0
+RDMA_CORE_VERSION = 49.0
 RDMA_CORE_SITE = $(call github,linux-rdma,rdma-core,v$(RDMA_CORE_VERSION))
 RDMA_CORE_LICENSE = GPL-2.0 or BSD-2-Clause
 RDMA_CORE_LICENSE_FILES = COPYING.GPL2 COPYING.BSD_MIT COPYING.md
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
