Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F46C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:13:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BE760FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0BE760FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B464605DE;
	Thu, 26 Aug 2021 22:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TypvtoAkt3g2; Thu, 26 Aug 2021 22:13:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA9B1614C0;
	Thu, 26 Aug 2021 22:13:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 050291C1135
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AAC44077E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d1-wv14Axnih for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D63A40788
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 719498DC52; Thu, 26 Aug 2021 22:01:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Aug 2021 20:22:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a2727b27fe9a40268dca2e9a4cd6ec1278b57144
X-Git-Newrev: 79e230178b57b1b871fa8c888b65b10d1bf31912
X-Patchwork-Hint: ignore
Message-Id: <20210826220127.719498DC52@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 4.{4, 9, 14, 19}.x / 5.{4, 10, 12, 13}.x series
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=79e230178b57b1b871fa8c888b65b10d1bf31912
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Includes fixes for the recent "Sequoia" seq_file vulnerability
(CVE-2021-33909):

https://lwn.net/Articles/863729/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 6ace3f5ea4..ef52373291 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.13.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.13.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6ca09fee4b..ee76ce8a24 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,14 +1,14 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3940d09cfb629f8c140b7b098cf6356d60cd8043df6b17c1f004077269ca937  linux-5.13.2.tar.xz
-sha256  c8d499fc53ed14838994ec2f51591ae40d64cce68559cd897be8acbeeee7630f  linux-5.12.10.tar.xz
+sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
+sha256  e9381cd3525a02f5b895f74147e2440be443ecd45484c6c64075046bc6f94c73  linux-5.12.19.tar.xz
 sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
-sha256  83b81e433ba2f8ee143064fb163699ee857e26dd789006bc1e9edf1ccd0bd403  linux-5.10.43.tar.xz
-sha256  17ee750a4aeb1c883d721e730d1f7e2855124585e2f47766864a1359a7ebe33c  linux-5.4.125.tar.xz
+sha256  00bbaeaac17f82d9a6d93cbc42cafd39d3b2fa3a6087333503d2344fa5e3142d  linux-5.10.57.tar.xz
+sha256  0471d0ccb7953cdae7d235192588ac5d72344851969962676d1703e69084a37f  linux-5.4.139.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  d13fa552be602825c443fcca90d6bdd72f4ebef809889ef015dba4593d3224ab  linux-4.4.272.tar.xz
-sha256  f8bf0c390ae40ca736e104f10f744446bc534bf87ba1b6dbb2b7c9a8bece1058  linux-4.9.272.tar.xz
-sha256  e4eae297a6fefefd8ce4781d98178a7c1ee51ca0a4c8a7e46e61b121fbab8b2a  linux-4.14.236.tar.xz
-sha256  aaaebdccf599f77148fe170642fa7dc2452cf994b5cbbb4d39cab9e7f4058896  linux-4.19.194.tar.xz
+sha256  4bdf66494be66a1da857f09b40b95026a0388e373fb01a206c60f67834746cb4  linux-4.4.279.tar.xz
+sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-4.9.279.tar.xz
+sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
+sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
 # Locally computed
 sha256  9f1de83c5c2bb582a33bd4ee892d45671901cd06af9dc159f0f499f1b5265b20  linux-cip-4.19.182-cip45.tar.gz
 sha256  0eeba6d6ecc45cf8f16458842b64d22e7064b9de9c31c11d1c395b08a47e3855  linux-cip-4.19.165-cip41-rt18.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a15fed5a4f..18f51b93be 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -370,15 +370,15 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.272"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.272"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.236"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.194"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.125"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.43"	if BR2_KERNEL_HEADERS_5_10
+	default "4.4.279"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.279"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.243"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.202"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.139"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.57"	if BR2_KERNEL_HEADERS_5_10
 	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
-	default "5.12.10"	if BR2_KERNEL_HEADERS_5_12
-	default "5.13.2"	if BR2_KERNEL_HEADERS_5_13
+	default "5.12.19"	if BR2_KERNEL_HEADERS_5_12
+	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
