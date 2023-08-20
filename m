Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF21EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 11:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1236D81B17;
	Sun, 20 Aug 2023 11:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1236D81B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wTVd10MmHZQ; Sun, 20 Aug 2023 11:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EC948196E;
	Sun, 20 Aug 2023 11:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EC948196E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 735C21BF2F5
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 11:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5223C60B90
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 11:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5223C60B90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hi13NM_aq4SL for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 11:35:38 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14AB160A6D
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 11:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14AB160A6D
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1D4E113F87F;
 Sun, 20 Aug 2023 13:35:34 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 13:35:27 +0200
Message-ID: <20230820113527.505124-1-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692531335;
 bh=MEU9DgW9V27oXmMQCBE+tXVMMDDyvsS5yHHUlbmmTII=;
 h=From:To:Cc:Subject:Date:From;
 b=Yn022h5LLJC8aq6gm8AG4ZO42BFMq9tJfUbrRKfuzerOZH1m6G70UO4bGaBBIeM2U
 5WmDdlc54neKV0QjDRGAcxsQ37vUCEgoeJkaFMD/YbMsAV1m6FLM+uQyJM4Z0G4Q3W
 3PbQEnG6cyuI722RIwkLEPS7XCwepu97Ov9ZzXazUaKLBZI3V8+sEkujvJnTTrGWvK
 WMW7IrdeY6SyuzWXE5+siqmrydBsA3fmY7S8MksKJnotxxoFq6re7yq6PI6aBNZUYW
 0QdyTINgPaOmSSHjTGmFy3ZOt8pGRweLgOe1d8RKgCX2jQQJ5QPmlamVW2tgBrGwS7
 Lnl/VDCV1TtPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Yn022h5L
Subject: [Buildroot] [PATCH next 1/1] package/perftest: bump to version
 23.07.0-0.27
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
https://github.com/linux-rdma/perftest/releases/tag/23.07.0-0.27

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch next at commit c614a7d with commands:

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.package.test_perftest
    ...
    OK
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index a9ea10ef44..e771d4f463 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c76f0fd5524a3486c335897357c596d0a6d4f82680f93fc1bc7120670fabd5f9  perftest-23.04.0-0.23.tar.gz
+sha256  c5b437734b7f9d31dac0b044cd8510b5580eb932080871b470aeae7309884d3b  perftest-23.07.0-0.27.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 7101e318aa..d3259face5 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 23.04.0-0.23
+PERFTEST_VERSION = 23.07.0-0.27
 PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
