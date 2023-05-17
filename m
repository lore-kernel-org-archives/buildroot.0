Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE43BC77B7A
	for <buildroot@archiver.kernel.org>; Wed, 17 May 2023 21:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B936FEE6;
	Wed, 17 May 2023 21:47:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B936FEE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hG4vqBgKtWOi; Wed, 17 May 2023 21:47:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6BCB6FEE7;
	Wed, 17 May 2023 21:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BCB6FEE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 578B41BF29D
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 21:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2530D40395
 for <buildroot@lists.busybox.net>; Wed, 17 May 2023 21:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2530D40395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzX6M4J0u6Pw for <buildroot@lists.busybox.net>;
 Wed, 17 May 2023 21:47:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4388740144
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4388740144
 for <buildroot@buildroot.org>; Wed, 17 May 2023 21:47:03 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.166.160.179])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2997213F8AE;
 Wed, 17 May 2023 23:46:57 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 17 May 2023 23:46:48 +0200
Message-Id: <20230517214648.137270-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684360020;
 bh=s8tvi+jSopujnewZqPNETOjlI5ou2negVuE+kIAft+c=;
 h=From:To:Cc:Subject:Date:From;
 b=UNgsPfz8EI9Lc5MVyCY6ay4Jyt+k/7jTQsXnVCLjCsHFwZr4/vc9cUruXJA09PSNS
 pR4dBJ7ZEBd25beedzcMtV/WWsebC1jnYAQ2so5SAyhR5Oz8CW+eG7JD0Rl1KNwBkg
 8N3+oPWnXUhnyBZj2prbDGIhxsHrfQPw9hUpKQ2qsk0ReQp2Qeiweka2++p75Podmf
 pp+ZiLXGsjlaemF7to4sZsTPuFL/8rFQq+g/s45LZVm/2fu50zaJ3nJqowGOcGyYfl
 uPXOD+w1LcQLrLghCxyWjKed0GkBGY8r1vQtzsQ0+PhM+ua/F76xigmpRWTtRTLX4b
 n475CHzxPiD2g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UNgsPfz8
Subject: [Buildroot] [PATCH 1/1] package/z3: bump to version 4.12.2
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

For change log since v4.12.1, see:
- https://github.com/Z3Prover/z3/releases/tag/z3-4.12.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 603df32 with commands:

    utils/docker-run make check-package
    382092 lines processed
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_z3
    ...
    OK
---
 package/z3/z3.hash | 2 +-
 package/z3/z3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/z3/z3.hash b/package/z3/z3.hash
index 8a511c3fe5..bddf3066ba 100644
--- a/package/z3/z3.hash
+++ b/package/z3/z3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3735fabf00e1341adcc70394993c05fd3e2ae167a3e9bb46045e33084eb64a3  z3-4.12.1.tar.gz
+sha256  9f58f3710bd2094085951a75791550f547903d75fe7e2fcb373c5f03fc761b8f  z3-4.12.2.tar.gz
 sha256  e617cad2ab9347e3129c2b171e87909332174e17961c5c3412d0799469111337  LICENSE.txt
diff --git a/package/z3/z3.mk b/package/z3/z3.mk
index 45c412ad12..501d9ee61a 100644
--- a/package/z3/z3.mk
+++ b/package/z3/z3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-Z3_VERSION = 4.12.1
+Z3_VERSION = 4.12.2
 Z3_SITE = $(call github,Z3Prover,z3,z3-$(Z3_VERSION))
 Z3_LICENSE = MIT
 Z3_LICENSE_FILES = LICENSE.txt
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
