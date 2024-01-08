Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12796C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B78AF8214B;
	Mon,  8 Jan 2024 20:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B78AF8214B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmrwKAkv7CxT; Mon,  8 Jan 2024 20:52:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11782820D7;
	Mon,  8 Jan 2024 20:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11782820D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F4471BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 143B642033
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 143B642033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-Mf9q_iBcsM for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:51:58 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBECC41F99
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBECC41F99
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9550413F8A9;
 Mon,  8 Jan 2024 21:51:55 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Jan 2024 21:51:50 +0100
Message-ID: <20240108205150.783168-1-ju.o@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704747116;
 bh=q7pRBZVqKod/d/1FnwEVEOeSPHeJXl4QOBrA9B4wuJE=;
 h=From:To:Cc:Subject:Date:From;
 b=bXz0fwBhevaTpZp88uxQuhI6acKPLUVrocGPitlD9JdW6xGI9CpCPjrZc/xZqxz6i
 3KjWdAuca9P0lHUKU2AQUoSn1jTATXCvQuQy1RIrEH1XObUlAryaHMoffIcjpbeL4X
 SIdxJMVXQmAk7YL3MqCBhZZ9Ttsmu89NUHQGoOlZzf8bdf4i3A+jdZQUGYmDLg7qH+
 7x2A9D9fQeXBGGaAoAcKdxk0Ud64b7cTYSJm20TwJaEbuUQGuRkVUJWD0Wu8W6c/H9
 BOVWSOnry6jA2n2GO+Fq0njdudpZL5plbnHOMWLMvfzaYMum4NIrDYvwy4Zm1WEk9y
 HQ155YmDgdNYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bXz0fwBh
Subject: [Buildroot] [PATCH 1/1] package/openblas: bump to version v0.3.26
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

For change log since v0.3.25, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26

This commit also update _SITE url to follow download url published on
the homepage https://www.openblas.net/

Also https://github.com/xianyi/OpenBLAS is now redirecting to
https://github.com/OpenMathLib/OpenBLAS

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 1d97f8c with commands:

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
    45 builds, 23 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index d946ae7296..a0f054dab7 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.25
-md5  48384e324cd1cdcfbdb0d2e16ca55327  openblas-0.3.25.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.26
+md5  bd496a1c81769ed19a161c1f8f904ccd  openblas-0.3.26.tar.gz
 # Locally calculated
-sha256  4c25cb30c4bb23eddca05d7d0a85997b8db6144f5464ba7f8c09ce91e2f35543  openblas-0.3.25.tar.gz
+sha256  4e6e4f5cb14c209262e33e6816d70221a2fe49eb69eaf0a06f065598ac602c68  openblas-0.3.26.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 76833121a9..2d6cdaa7bb 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.25
-OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
+OPENBLAS_VERSION = 0.3.26
+OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
 OPENBLAS_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
