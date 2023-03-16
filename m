Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F42C74A5B
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 22:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A92BD41B30;
	Thu, 16 Mar 2023 22:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A92BD41B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8FjHrC-o4y4; Thu, 16 Mar 2023 22:12:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8813541B2D;
	Thu, 16 Mar 2023 22:12:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8813541B2D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3E5821BF83C
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 22:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 250E961389
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 22:11:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 250E961389
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sbqJ75BKK0z for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 22:11:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F36861352
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F36861352
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 22:11:58 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.31.40])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E8DE7B00539;
 Thu, 16 Mar 2023 23:11:51 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 23:11:45 +0100
Message-Id: <20230316221145.302179-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1679004714;
 bh=K11WYXpHcjV4oLvKucBoONfgOdEw6ADblM3upmUaB8c=;
 h=From:To:Cc:Subject:Date:From;
 b=svnnDlsQBEiSaWbm+UqA1VKuOZlKzTWh95yMOM6RqVJmBdDL9gUMyXQlW0IAhVUIM
 ICmPFTPWFRgqAPevlwxstueM6H0wdLqbhm4m/jwht32TB9j9J6dxhpNZwGbjrj0un5
 3ReNoMYx+V5qEE6Lw5jV0CsF5EyA+JTA5qIoLsa4Y5/Ny84VPC5AjhSy72DgqmKcyS
 czm0e10MuU7A7c+T9/JYO5ltex6JAKA8tk8+mC5f1t2Qq1axZ/xgw7KUssHWVjSWxX
 qWuPnUjX9xXbWq3htxZVljCgxuAJbp+QqjxpHV83tnoVq5utRE0wg4guC8Mv0ZdsCk
 DvGyVEkuml/ZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=svnnDlsQ
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.9.0
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
Cc: Steven Noonan <steven@uplinklabs.net>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
- https://github.com/open-mpi/hwloc/blob/hwloc-2.9.0/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit d305189, with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p hwloc
    ...
    6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_hwloc
    ...
    OK
---
 package/hwloc/hwloc.hash | 8 ++++----
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index b146472195..963a1fd930 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,6 +1,6 @@
-# From https://www.open-mpi.org/software/hwloc/v2.8/
-md5  1d40ecdded67bbe4bafc8f8e8479376c  hwloc-2.8.0.tar.bz2
-sha1  314faaeda9f1982da97fca93b83307bc34d5b414  hwloc-2.8.0.tar.bz2
-sha256  348a72fcd48c32a823ee1da149ae992203e7ad033549e64aed6ea6eeb01f42c1  hwloc-2.8.0.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.9/
+md5  49869a8e19754299db512572abc5eb2b  hwloc-2.9.0.tar.bz2
+sha1  ee178b64234fdbf70f576b79963459ab80880583  hwloc-2.9.0.tar.bz2
+sha256  2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887  hwloc-2.9.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 3f73b3ecc8..c97e46999c 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.8
+HWLOC_VERSION_MAJOR = 2.9
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
