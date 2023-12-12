Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E86DC4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 19:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D443E40370;
	Tue, 12 Dec 2023 19:01:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D443E40370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afsTkcX5-9zN; Tue, 12 Dec 2023 19:01:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D15944048A;
	Tue, 12 Dec 2023 19:01:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D15944048A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88B061BF29F
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 19:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C7E441B42
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 19:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C7E441B42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DYPXDNCnqQBb for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 19:01:46 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B7FD41B40
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 19:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B7FD41B40
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A302313F8C8;
 Tue, 12 Dec 2023 20:01:41 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 20:01:23 +0100
Message-ID: <20231212190123.7226-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702407703;
 bh=E2bw/v0Bmj/SVyiTyMV5cpRH7HV7ND4OsWMIaexwhTM=;
 h=From:To:Cc:Subject:Date:From;
 b=P4PwwtjbKsxXcXcZD23xunZdP/ZgC5FeIq80NDhW12NoCydXKCgUHuBnpSKN2wpOQ
 whqJE6AotjIO4sUX6CkIrBQrWKlBckcYRDTQSWe2Q5rNue82B2QEVUoyupA/THPz2v
 K8pCHaRjxvIbza4c//eD/oOLEedquVrBGtMxMwa2+b+5JjHTcEqgv44/lQRIEFFT2b
 s0yNldflMXteelvf4ePisJbyIsdlqEA33sKJt7Z1iHdSM2Rc/3NZ+1kMz+UPdHkrn7
 FGnd0IWJZcZIrfKRsCmJtz4ipnTmlw5SbloyNLl17gBMcKJgxz4/REOi8LzQnLiTMu
 OA1Cuqz86g2/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P4Pwwtjb
Subject: [Buildroot] [PATCH 1/1] package/perftest: bump to version
 23.10.0-0.29
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
https://github.com/linux-rdma/perftest/releases/tag/23.10.0-0.29

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit b79fb3c with commands:

    make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p perftest
    ...
    45 builds, 28 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

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
index e771d4f463..2fa8c63493 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c5b437734b7f9d31dac0b044cd8510b5580eb932080871b470aeae7309884d3b  perftest-23.07.0-0.27.tar.gz
+sha256  79bcbb4a62a578408379e89d73f4ceea8f272a139e8a634611f92b1d9ac911a0  perftest-23.10.0-0.29.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index d3259face5..9e0424e47e 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 23.07.0-0.27
+PERFTEST_VERSION = 23.10.0-0.29
 PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
