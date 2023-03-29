Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6A4C74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 19:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F84A41E46;
	Wed, 29 Mar 2023 19:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F84A41E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCGcOPuqpQ3d; Wed, 29 Mar 2023 19:13:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B40A41E43;
	Wed, 29 Mar 2023 19:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B40A41E43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B71A21BF339
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9172A81E9E
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 19:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9172A81E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34gcFa7iwOqD for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 19:13:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C6381E85
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9C6381E85
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 19:13:38 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.174.33.200])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9E9D4B0311E;
 Wed, 29 Mar 2023 21:13:33 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 21:13:23 +0200
Message-Id: <20230329191323.733704-2-ju.o@free.fr>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329191323.733704-1-ju.o@free.fr>
References: <20230329191323.733704-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680117216;
 bh=JdrIKt0KbEhIlb4a44kUHnrtLmKCue/qvrcdMlsN4cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sT9tFATmNv7YW1ypmhl3alKymV11Reg79nFf7pOyUcjqFNMiXII6/oZoPYmhq/074
 LemKOgd2QNKarP2/7NZWDnfUTZRrk0obBmGU4kyZ3Jnq4kIBrr5v+qj3r78+0vPJsg
 ERcV1S9JG2BrNOTRfu2yEvFZnTm8ilfGg2Z+WCml/XAXDkSFsPaU9Yz+zzDkOClRma
 1Rhl061EyHhgQObYa74XC3Oozd/slW6sqIBseWcpqYs1SwQx/QnQaIlCu1s3iNYAjq
 uvxO+B1YrzY/qLxu2Oxajsgrgx9k0A2aB1RVp5v2iB4oI3kvt3Q8jZm0uvKCu97jjy
 Nul6eFQRDoB4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sT9tFATm
Subject: [Buildroot] [PATCH 2/2] package/openblas: bump to version v0.3.22
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

For change log since v0.3.21, see:
- https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.22

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 2 +-
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 3a52600056..a8b5527e81 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f36ba3d7a60e7c8bcc54cd9aaa9b1223dd42eaf02c811791c37e8ca707c241ca  openblas-0.3.21.tar.gz
+sha256  7fa9685926ba4f27cfe513adbf9af64d6b6b63f9dcabb37baefad6a65ff347a7  openblas-0.3.22.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index ac40c57afb..27f20654e7 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.21
+OPENBLAS_VERSION = 0.3.22
 OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
