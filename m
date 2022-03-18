Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8363C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 08:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FC3640BED;
	Fri, 18 Mar 2022 08:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EW6ui25iDomV; Fri, 18 Mar 2022 08:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 152A640BEB;
	Fri, 18 Mar 2022 08:25:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08EA41C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA70340BEA
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 08:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BuVqAHyeM4zF for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 08:24:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADD9E4028D
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 08:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647591887;
 bh=CklIoc8q9CLMlOOjnfe+M8mROBKK7m/NSOTtmMMLD9g=;
 h=X-UI-Sender-Class:From:To:Subject:Date:In-Reply-To:References;
 b=GWgwYverwT3LoxlkZjSzCUfKdxF3GFpm46fhYHDi17gVx4qT/+fEypMRyAZGvaXm6
 6bR2kKzVhB6UCluAU3oMyG+4BTwjw+OIHtgSRx5WrDf7dJ6pFnfDU39JyH3PzUbDvd
 Kyz+OXOjYIBg7sidNaBvgXXXtwLHYjKKX6XzEltE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.203]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MsHnm-1oOkfV1uKQ-00tl5A for <buildroot@buildroot.org>; Fri, 18 Mar 2022
 09:24:47 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 09:24:46 +0100
Message-Id: <20220318082446.18552-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318082446.18552-1-ps.report@gmx.net>
References: <20220318082446.18552-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:3N5z7fieaWXW6XBViOkgHCsmR84j1QVakcIPppt/V/uF6NT0WRC
 MktJoMDAEYL4nYkL/v9KOfyyuAtRtbZeeAK3sTOCidL5zbwtQKGQVko2msYmq8ye1sGxlN+
 qaexzNabkjXASNBCAABUwARVFMBo3HSC6E284FDT0TczImNCjkdaT4cuAqo5c5fiHC7T0Ll
 rK1DzKh3mfkWcIUqmK+Ow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F8aM9NP784g=:PaVaBlen3IKqwguLq0HNXn
 a8zWRN6Seyqc4JqESzz+BM9ApuuY5VdHRUx4LKX0vCY2X8xAnMNQ3nSDPcjKz6sAUn0pP7h0+
 N4OfYWZ8192KEwptpwPaQHuC1FQGqqMG/0yYFHSi/8spILtIVamDiIC0K/gFNQMJAs3KlwEZ/
 FNJlVBCZBjELGuADdtW/AoncEGwprhf4NmAxVvjSNXi5mbfTRQIduruE68gXfltsCeRmfx2OV
 K9fYuNCNZrtsBbpybaAqfinLQY0q5bI1wC7lReJUHo7/ix/FOvjizuAm2H7UrizET2AZtQBj5
 ToZEOlFsya6tzwLrk912OvF2RtaLUo9+R/eULaEy6H0c4tTOWJsiTACvGxgJbcSpSnyPfTtmL
 c1k/cfW8deYKlABVvVP6qWhSNp2D/0O8C5asy5nEglD7ceeIILQrTyXxhZvzY479RUpOEQA1O
 cyAjRWshvexqvriOkHtIr+rCTS5egThTc2Owez5E91VToWRKLQAxVCHBkoHkMqGUlQ5owpxHq
 UuuTsmVdEnZW/2pmItZboKuxo9syCAGwTIQNYZVxeKaL+PMGGva/D3+y3Kxdsa+KWKZl5kiLD
 IasLJyr7jqqABjl8PiyBZ05cg+lp+I0bVne3X7ODlK21x+hj/7wWbatX+pGCO36GyXnDo4oBH
 xZYigHU/Hwvgx/WCjQUuT+VSMUlD6ZQzFnSTMicPAUUd1RiG01xNLoh8OjiAVcw9Cn6qmD30Y
 Z91utKDcaLKzeZAc/yD/UVJ18IeoidHNwH5c5txKPkgYs4DTMHDTSHJA763JrNcfd6rn5S7w8
 DvT6sgq7z4VB34DaoYwKUV5A3g55lkmnpMMa6aup77gaXqjqwoGV5Rz2DI+E42ewwsxbahuxZ
 rnwYUiItCge+kBlcJAR6qSTlPi5/bhQdrljMs1YFitHAlwDDQIFEUNKpWor/PnTPbmH7wHLp6
 jpJ4lkB/OaBzho7E9ek8Gt1UQnzGNnU0o+3zdT+9U9D2E27Zztx2JK4CieAIK8I69lSxBiwLh
 Tgxu8QBx8CMPF/UqbKeDHSWgykDP9qpKpQV+BzAnnRBgwypIaB+XSIyryJJt0UFpWkp/WrM4j
 O5yHvop42JAcAM=
Subject: [Buildroot] [PATCH v1 2/2] package/spidev_test: bump to version in
 Linux 5.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump to version in Linux 5.8 (depends on SPI_TX_OCTAL/SPI_RX_OCTAL
  available since Linux 5.0)

  Changelog (since 4.10):

  9006a7b3220e spi: spidev_test: add option to continuously transfer data
  35386dfd13b7 spi: spidev_test: Improve decoded text part of hex dump
  84a14ae8c44f treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 178
  020bd6c48ebd spi: spidev_test: Remove break after exit statement
  1f3c36328a48 spi: spidev_test: Check input_tx and input_file first after parse options
  470a072e1220 spi: spidev_test: Use perror() only if errno is not 0
  896fa735084e spi: spidev_test: Add support for Octal mode data transfers
  9ec8ade81224 spi: spidev_test: Use %u to format unsigned numbers
  bd2077915bfe spi: tools: Make default_tx/rx and input_tx static

- update Config.in help text

- indent hashes by 2 spaces

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/spidev_test/Config.in        | 4 ++--
 package/spidev_test/spidev_test.hash | 5 +++--
 package/spidev_test/spidev_test.mk   | 5 ++++-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 2f3fcf4090..81386adf7a 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -9,8 +9,8 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  proper operation of 'spidev_test'.
 
 	  The version used is based on your toolchain headers version,
-	  if it's older than 3.15 then 3.0 is used, otherwise 4.10 
-	  is used.
+	  if it's older than 3.15 then 3.0 is used, up to headers 4.20
+	  version 4.10 is used and otherwise version 5.8.
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
 
diff --git a/package/spidev_test/spidev_test.hash b/package/spidev_test/spidev_test.hash
index 7bc4a27e45..867920fc78 100644
--- a/package/spidev_test/spidev_test.hash
+++ b/package/spidev_test/spidev_test.hash
@@ -1,3 +1,4 @@
 # Locally calculated
-sha256 80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
-sha256 3cf76b15d9a8644f3f5cbc0387cc02a7d4a392ade39788cbc6367cce98552e2f  spidev_test.c?id=v4.10
+sha256  80471c330d8c0bf5ba6479c434a54a54bdd2dc59a703b9c76c2541ec04cfb8c3  spidev_test.c?id=v3.0
+sha256  3cf76b15d9a8644f3f5cbc0387cc02a7d4a392ade39788cbc6367cce98552e2f  spidev_test.c?id=v4.10
+sha256  87329094ea3010eae9e65ad7ea2d2309e044845942414aa0ca8f1a7095b80178  spidev_test.c?id=v5.8
diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index bd2fcf6db3..6c5a9495a4 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -10,7 +10,10 @@
 # If you need quad-pumped spi support you need to upgrade your toolchain.
 # Note that the location of spidev_test.c changes from v4.5 onwards.
 
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y)
+SPIDEV_TEST_VERSION = 5.8
+SPIDEV_TEST_PATH = tools/spi
+else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
 SPIDEV_TEST_VERSION = 4.10
 SPIDEV_TEST_PATH = tools/spi
 else
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
