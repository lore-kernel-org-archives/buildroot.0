Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F09C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 10:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0F7F400FB;
	Sat, 15 Jun 2024 10:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMievlBpSK5m; Sat, 15 Jun 2024 10:01:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1DC540103
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DC540103;
	Sat, 15 Jun 2024 10:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58ADE1BF30A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 10:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43E0A8343F
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 10:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wW1AgQVlwDL3 for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 10:01:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47DA382C89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DA382C89
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47DA382C89
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 10:01:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 49E40B005AC;
 Sat, 15 Jun 2024 12:01:31 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 12:01:23 +0200
Message-ID: <20240615100123.641349-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718445692;
 bh=k3agq9+lJVWRe35KeNl+JLX4n4lWwaszxWv9xwPqX/g=;
 h=From:To:Cc:Subject:Date:From;
 b=L7mCAHgvhF9bp7WNlGfgZYwSL/c/8JlF5fXehqRVMbASru4J8vzF/OC7dF23OGmFg
 MM+WEm8HNJSRRJ4wQXjFCZYnmT6jlipgZXCddWaMtEiFUChCX2pvOdGxZEUJea5CH7
 C1ilgWj4nq3oaXvI9WHidSIjFtpfvtmUAUIcct/b53BMZo93Y0q1HHFPcWNaiqtdHI
 AqSATIw/tXWHHB5gcodVFHIwptrm3s9aedqHHE+BJFDKsix2sIz93oI0rTc1sscb5Y
 oQ7Bbg6KELVLe2P6vSwtpTvfjOXkHH1r7Espq8tzym9UMmPbwjvvYGXql3mhWV6+hF
 DhGEsFrW7A1IA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L7mCAHgv
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 9.2.0
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

See release announce:
https://octave.org/news/release/2024/06/07/octave-9.2.0-released.html

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit a4d38ef, with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -p octave
    ...
    6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

    support/testing/run-tests \
        -d dl \
        -o output_folder \
        tests.package.test_octave
    ...
    OK
---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index 3ea5a1cd8d7..d9313734f16 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-9.1.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-9.2.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  f1769f61bd10c8ade6aee352b1bbb016e5fd8fc8394896a64dc26ef675ba3cea  octave-9.1.0.tar.lz
+sha256  dcb2c098701cfcbc083f07e90e146261d15cdbf5e89c031032422112c89b47da  octave-9.2.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 6a21bef7b87..69b292bb6b8 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 9.1.0
+OCTAVE_VERSION = 9.2.0
 OCTAVE_SITE = https://ftp.gnu.org/gnu/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
