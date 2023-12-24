Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF3EC46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 08:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B42C40154;
	Sun, 24 Dec 2023 08:23:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B42C40154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eYBzMOukTzWq; Sun, 24 Dec 2023 08:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F219F40272;
	Sun, 24 Dec 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F219F40272
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED2621BF2CA
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D38A48137C
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 08:23:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D38A48137C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-AxU-VeNE4y for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 08:23:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC13381336
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 08:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC13381336
Received: from fli4l.lan.fli4l (p54a1b896.dip0.t-ipconnect.de [84.161.184.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15EA9A4C063C
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 09:23:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44774)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rHJlh-0002c4-2U
 for buildroot@buildroot.org; Sun, 24 Dec 2023 09:23:29 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 09:23:29 +0100
Message-Id: <20231224082329.23294-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1703406210;
 bh=NmrGGbPRkUYyhPaoMkypHswfaRkpmBm7UKSF9YPsBMs=;
 h=From:To:Subject:Date:From;
 b=B91a5GOv7HIjcSj31juw1KbDCRZkHG6IUczeNwyQynvI7ZxJyMUdIaDdsZvPI0ecF
 UEnZUoh80+s4krYGETS4bGkQSBh+V2py7+9kn16qCKuqDG6EKfnzhlg5Uv2xwtIpZu
 Baosk5nk3h3LIk+fr9WkohkQ7OMJDmaRni4LBiJ11x5EHNxGE/zidB0NV40KjP79aI
 QSqS+BIPqEVHS0ihyPRu+0+TvoPDIdVSk/uqgybL5y895hyECj5+PtzQblVlR4sO3T
 OcHZCGp6e2x1UWUjWVWNtsXv7d783MaPcb6fWnxjGmpcwvVEyCu3C90QfVRhaLOMh/
 Yg+8mWk5ECRnQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=B91a5GOv
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 6}.x series
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index f076ef5b5e..627cfd2130 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4bd5261439..e0b7183888 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0ce68ec6019019140043263520955ecd04839e55a1baab2fa9155b42bb6fd841  linux-6.6.7.tar.xz
-sha256  365ff26a30e206de9b18489f45d38582a0a61b7c5919f8ab89295a47316784e1  linux-6.1.68.tar.xz
+sha256  5036c434e11e4b36d8da3f489851f7f829cf785fa7f7887468537a9ea4572416  linux-6.6.8.tar.xz
+sha256  7e3d2694d18ce502068cc88a430da809abbd17d0773268524ebece442612b541  linux-6.1.69.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  096bb16ec07232f27f6a07998c41b655883a8d0a6bb613d39bf524a9ffd99e02  linux-5.15.143.tar.xz
-sha256  ff950750b1060f65c0dde7d4d89238937d80faddf3bcf9ba28189d917daccaee  linux-5.10.204.tar.xz
-sha256  d39c90dd9297a36aab7246b516f61e21493826004011f161090bce84db21b6b0  linux-5.4.264.tar.xz
+sha256  b2a49d87605f3a9491581150315e22337c1afb599efc1e2737481be3a2d6d620  linux-5.15.145.tar.xz
+sha256  c55217a80d74f81b83116289a8bfe4302293390b45aeabb76f64814920788863  linux-5.10.205.tar.xz
+sha256  4dae99e49f466d4689e128ec023754908147159d7462019a83c7da1f25df9b15  linux-5.4.265.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  53d33c0042eff3700b7f59bdac06295c98c50056fce72f630438974b46bd73ce  linux-4.19.302.tar.xz
-sha256  66337a2afdc32e5935294139765c99ef878eedbfe1495f3f3625c23cadcab648  linux-4.14.333.tar.xz
+sha256  022dce3935eadec7c31093992cc101c905fd4ffbb8afce92f3e41fdd0fa18b36  linux-4.19.303.tar.xz
+sha256  8a1d520cfa71e9faebae9d8c24101f5bffe48fcb897dede4cecad5af67c34a45  linux-4.14.334.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a3d8247cea..e593ace5ce 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -408,13 +408,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.333"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.302"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.264"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.204"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.143"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.68"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.7"		if BR2_KERNEL_HEADERS_6_6
+	default "4.14.334"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.303"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.265"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.205"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.145"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.69"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.8"		if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
