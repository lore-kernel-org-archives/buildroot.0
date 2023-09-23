Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFE9CE7A89
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 17:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D3E640296;
	Sat, 23 Sep 2023 17:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D3E640296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pkw-wA6zeMML; Sat, 23 Sep 2023 17:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A625341603;
	Sat, 23 Sep 2023 17:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A625341603
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58EFE1BF299
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 328CA40C20
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 17:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 328CA40C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wGsPJAIyjxx for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 17:33:21 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CFC6400FE
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 17:33:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFC6400FE
Received: from fli4l.lan.fli4l (p54a1bfc3.dip0.t-ipconnect.de [84.161.191.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DF66BA4C00E5;
 Sat, 23 Sep 2023 19:32:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38544)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk6Uu-0002RQ-1C;
 Sat, 23 Sep 2023 19:32:52 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 19:32:49 +0200
Message-Id: <20230923173252.3079114-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695490372;
 bh=qL67u1FO4VzwWuHaFsc08aFNAeXd7p68R15kh1Pl01U=;
 h=From:To:Cc:Subject:Date:From;
 b=TEDJKNwYUJidkob2atN8zdp505HMgsz+gPHWh0iSVqbOO29KECLWp11FkXZNVpizy
 lYUpSmm03arWJv/pmAl9krS4zMSUjdO+/7Eufks/ooF7pQ7RrpgRONUt8a3TVkpPo2
 MlrEq9QheRsGHuPLgfEmzuJoZiSpRp7Im1HkHvlRyTBsiTZyRO2aWazY3SGoJB5OcV
 KWafZx5vLpkZUWV+F9s7VYfyAAEkwVh3oh6hdjs/TVp71OCIx+P3FuKhV1L8pntjUF
 /sQV43+5MJXSo59IkyEJEV2Sfu+p0olcYgCakKv/X0PmmYZa8GZx3pdWyLBDZOvjWE
 9B+Eltv0mERWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=TEDJKNwY
Subject: [Buildroot] [PATCH 1/4] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 90ab048055..7ddcf013f8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d62fc7de09..cac7fba207 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  75eae323747ae37b05086c5a51326a744eb611b0e890e7ebe77de362b30450e6  linux-6.4.14.tar.xz
-sha256  58b0446d8ea4bc0b26a35e2e3509bd53efcdeb295c9e4f48d33a23b1cdaa103b  linux-6.1.51.tar.xz
+sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
+sha256  a87e241ec15d53452c4efe219713a3769d88cc436b5b98cf6efb262c4aff15c0  linux-6.1.55.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  ab464e4107329ff5262f1c585c40fc29dc68f17687a9a918f3e90faba5303d62  linux-5.15.130.tar.xz
-sha256  240d5e47bb378c6813ecd07704fb887651ea7617159d2771071fd70bf33cd995  linux-5.10.194.tar.xz
-sha256  c7a4086ba23507b8539d18534565de0d6591138bfa2e449e93964fd5132e353a  linux-5.4.256.tar.xz
+sha256  ef845e7934897b88e4448378ea9daacac19e07f156fe904844fab0a7d8ff5ddd  linux-5.15.133.tar.xz
+sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
+sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  ccadbde939a788934436125a1ecd4464175b68ebe6c18072fbc90c8596eea00f  linux-4.19.294.tar.xz
-sha256  5b69e182ced5190a1fca117682cf7967c5bab24c4cf1364733ee14055b0df784  linux-4.14.325.tar.xz
+sha256  b732c2e4f08576a9dd5bb14213cead3835acbb101a91aaba3d6ace302fd538ac  linux-4.19.295.tar.xz
+sha256  555ce40f1df4c0f4a74cbefcaad0c67108615860968720faabe51cdee2df1478  linux-4.14.326.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7e67dfad5c..a0bdbe8555 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.325"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.294"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.256"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.194"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.130"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.51"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.14"	if BR2_KERNEL_HEADERS_6_4
+	default "4.14.326"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.133"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.55"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
