Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5F0C71153
	for <buildroot@archiver.kernel.org>; Mon,  4 Sep 2023 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDCE610CB;
	Mon,  4 Sep 2023 22:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDCE610CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gT50d7UaoV9X; Mon,  4 Sep 2023 22:16:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A87F610D7;
	Mon,  4 Sep 2023 22:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A87F610D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 105DA1BF33F
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC3FB4088C
 for <buildroot@lists.busybox.net>; Mon,  4 Sep 2023 22:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC3FB4088C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u5qdIfnNAHgs for <buildroot@lists.busybox.net>;
 Mon,  4 Sep 2023 22:16:02 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACE84086F
 for <buildroot@buildroot.org>; Mon,  4 Sep 2023 22:16:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2ACE84086F
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EFE3A13F88F;
 Tue,  5 Sep 2023 00:15:57 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 00:15:49 +0200
Message-ID: <20230904221549.42938-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1693865759;
 bh=WHSqNamMK63sgqJixviQNa4bTUCo19/4fYTRouF9ZqA=;
 h=From:To:Cc:Subject:Date:From;
 b=ddCO1GNrC601CLGu3AV+rVOt8K0TITgM/3d8XUIK8bbdvElOrBV5D9a3rAhDI+z/5
 lB0aD0kF/0fIvUftrbS+JCzHoKBeVQWpCtpV5RyZTDpDvfbRHgAJidlrgt0lteJV3X
 ZFJ7KaIeRWl6JtHeFUgM6VShA5nUdZgbvkY1PRa9QEdX3TA8ytngI1Xt1SWd4wAhqh
 JMnTmxKzvUTJ7MSQLdL+Ix8zwVyQXN+JHUfa30vfp9qKssmL1kWPFK/oLzULYmr50R
 IsTvDuyPdgnTKNblUSzqUySp17WFXPZb9W2pM2842+zQpo4Xb3+fS8qYuMoOxFrHGy
 mbFh73NHaJscA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ddCO1GNr
Subject: [Buildroot] [PATCH next 1/1] package/openblas: bump to version
 v0.3.24
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

For change log since v0.3.23, see:
https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit 3fa1ae0 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_openblas
    ...
    OK

    utils/test-pkg -a -p openblas
    ...
    45 builds, 25 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 2e5fa8865f..8e416f98f6 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.23
-md5  115634b39007de71eb7e75cf7591dfb2  openblas-0.3.23.tar.gz
+# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.24
+md5  23599a30e4ce887590957d94896789c8  openblas-0.3.24.tar.gz
 # Locally calculated
-sha256  5d9491d07168a5d00116cdc068a40022c3455bf9293c7cb86a65b1054d7e5114  openblas-0.3.23.tar.gz
+sha256  ceadc5065da97bd92404cac7254da66cc6eb192679cf1002098688978d4d5132  openblas-0.3.24.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index d8fcb4a2c6..0d0e8e56dd 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.23
+OPENBLAS_VERSION = 0.3.24
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
