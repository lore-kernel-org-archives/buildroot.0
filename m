Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E56EC636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 13:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2841B41745;
	Sun,  5 Feb 2023 13:04:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2841B41745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dX0dS4AJsxxS; Sun,  5 Feb 2023 13:04:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1035941743;
	Sun,  5 Feb 2023 13:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1035941743
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8BCF11BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E98A41743
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 13:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E98A41743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kMI0GfnPdR_s for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 13:04:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40412414A2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 40412414A2
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 13:04:08 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.66.0])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 447452003B4;
 Sun,  5 Feb 2023 14:04:03 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  5 Feb 2023 14:03:55 +0100
Message-Id: <20230205130355.797050-1-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675602244;
 bh=JLtiVegPP6r0pw2pdN5kUX3Ph6mQkLpCGhoZBdzxzPw=;
 h=From:To:Cc:Subject:Date:From;
 b=KbGl1JlH/pvnHUPO7XNCRXkkDdvv/YgnrkkoldKkp6XnXYi/NKcGa3Bh8YaiwXAFn
 AeDDeLi0W0VwwcE9c/9upVMd6xyXDZbhvGq0+neQOed7bmu8VebNoKxZxtULGPIGtN
 anx3ycq1Xl1BP9jMk1nW/ykW5Bl1bdw7DEJ0N8NLJcZxlnF4ZYVA1XBIW0/3KR62cG
 6+haRiOm8Le95LCczT3/4y52KJmY7jmFKEkd2ClJVas1NeLwgVwgjuLOXcT9l8JRTE
 MK27XA5pmrzifiVUotDRqpRN7CZOxED/ffG30DDghi4RsDIEvTH4bbR9TaOcQ6exq0
 a2SsQQoqSwPCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KbGl1JlH
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.1
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

For change log since v4.12.0, see:
- https://github.com/Z3Prover/z3/releases/tag/z3-4.12.1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 8bb9627 with commands:

    make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_z3
    ...
    OK

    ./utils/test-pkg -p z3
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index 517e2f4923..8a511c3fe5 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5f575f0a3950760436217da1cc1a714569b6d4f664a75bb6775876328cf0a580  z3-4.12.0.tar.gz
+sha256  a3735fabf00e1341adcc70394993c05fd3e2ae167a3e9bb46045e33084eb64a3  z3-4.12.1.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index ecd79325dc..45c412ad12 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.0
+Z3_VERSION = 4.12.1
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
