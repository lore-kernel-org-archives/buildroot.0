Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2F0C677F1
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 18:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B29A840B88;
	Mon, 16 Jan 2023 18:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29A840B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6_t75PO2U3U; Mon, 16 Jan 2023 18:44:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0BF740B84;
	Mon, 16 Jan 2023 18:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BF740B84
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D6F171BF3D6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B249E81DE2
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 18:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B249E81DE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fplyDzIAeUQj for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 18:44:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A5B88195C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A5B88195C
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 18:44:01 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.132.245])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1EF1A19F59E;
 Mon, 16 Jan 2023 19:43:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Jan 2023 19:43:48 +0100
Message-Id: <20230116184348.7593-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673894638;
 bh=Upyqh8LZJc3Qj9DnLiKvwMI+sA5diHQ/95tERITVFV0=;
 h=From:To:Cc:Subject:Date:From;
 b=pDPJmPvm2LFTrqqGvtDf72xnItYhG+HJ3jE2DQxeBgxFEkaN++bczzodKdQ0VOjvq
 Hbf0ETPSilzA/xVQGeFHerSfV+OggJBgC5oUOjBZcI+Sn16N9Mca3WFcVgxyTqmPel
 p6jaJ36l+/MUtVX48J0bW9FYnWXKu6DHcABB8F9SA5OgjtY93HUZFJVLxB3+k3RgDm
 r0aowrjKMEseQNSZTa1K72T3jayq1fNeid97Ye5TNbZmx6F+fekHwHjX+1ffuLbKUK
 6UTQo+QDQx4hm5b3KUiVbwJv6+sMjHgXTVeXMTVHvIvgYlIr56MqlQt+2qQoa4pFON
 k43e0L2qJ4q1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pDPJmPvm
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.0
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

For change log since v4.11.2, see:
- https://github.com/Z3Prover/z3/releases/tag/z3-4.12.0

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 627c38c with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_z3.TestZ3
    ...
    OK

    ./utils/test-pkg -a -p z3
    ...
    44 builds, 26 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index d38c5f1971..517e2f4923 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3a82431b95412408a9c994466fad7252135c8ed3f719c986cd75c8c5f234c7e  z3-4.11.2.tar.gz
+sha256  5f575f0a3950760436217da1cc1a714569b6d4f664a75bb6775876328cf0a580  z3-4.12.0.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 2252e05395..ecd79325dc 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.11.2
+Z3_VERSION = 4.12.0
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
