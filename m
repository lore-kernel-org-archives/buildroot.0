Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB9AC19F4F
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 15:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F5D06077D;
	Wed,  8 May 2024 15:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWIEzew-nF6A; Wed,  8 May 2024 15:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F7F607BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F7F607BA;
	Wed,  8 May 2024 15:57:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EB6121BF5A4
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D688681E23
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 15:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Uwtswx7-0Hl for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 15:57:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5F1B81DF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5F1B81DF6
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5F1B81DF6
 for <buildroot@buildroot.org>; Wed,  8 May 2024 15:57:52 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BB125B004FF;
 Wed,  8 May 2024 17:57:47 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  8 May 2024 17:57:42 +0200
Message-ID: <20240508155742.273787-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715183869;
 bh=NQJrExWEqHZqGZpMskVKfwHKFYI+Bp2J8Cp0lAHCKhM=;
 h=From:To:Cc:Subject:Date:From;
 b=h/NeI/YXY51OEci/KumGrgzKHZY1tEKjiDubnjvQ9aUaUYjFAOVN92Met+zJmtU1z
 Ac/jcwRJT4+9F7xbgmGJBY7WSeJDeENU/I9A8HKHhtaUbYKCsNlYzpp6ajWqk7vBmP
 jKty16T3KDp25uzoIFFH9MUKOHWMDs8rU6CdvivKk4hhnZbX0L0Kl0c3O133x6Uwwn
 1Twm9D+BgWWKFYezrGULrmrlvT3BWkuYUgc1HHdmR36gkqbXQK2hO3KXRylK+iTV3O
 kniwkklNxlFcZ7AgoR3Op8O7llTR5HM0GwwDrPiBKNg3bCxUpJovbski5z1xqQ7Wyy
 6sXRTOU53mYOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=h/NeI/YX
Subject: [Buildroot] [PATCH 1/1] package/perftest: bump to version
 24.04.0-0.41
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

For change log since 23.10.0-0.29, see:
https://github.com/linux-rdma/perftest/releases/tag/24.01.0-0.38
https://github.com/linux-rdma/perftest/releases/tag/24.04.0-0.41

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 2e07cd5 with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -p perftest
    ...
    6 builds, 4 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

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
index 2fa8c63493d..f40d1d1e965 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  79bcbb4a62a578408379e89d73f4ceea8f272a139e8a634611f92b1d9ac911a0  perftest-23.10.0-0.29.tar.gz
+sha256  d398cb7a364735485b5ae033b242d7cf0bedcdb5f4d512e54b18c9a3e7a98b87  perftest-24.04.0-0.41.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 9e0424e47ec..36cb775254c 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 23.10.0-0.29
+PERFTEST_VERSION = 24.04.0-0.41
 PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
