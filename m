Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AC2CDB470
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 17:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9476660F76;
	Wed, 11 Oct 2023 17:46:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9476660F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O3lDacmaWQhj; Wed, 11 Oct 2023 17:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B987B613A3;
	Wed, 11 Oct 2023 17:46:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B987B613A3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1EE71BF3D6
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B978A8242D
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B978A8242D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bvNCHU2nThaA for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 17:46:25 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F6A823F4
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 17:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03F6A823F4
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D2839A4C06CE
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 19:46:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38702)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qqdHo-0002gR-2x
 for buildroot@buildroot.org; Wed, 11 Oct 2023 19:46:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 19:46:20 +0200
Message-Id: <20231011174620.52181-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697046381;
 bh=fWB76M5AKEEAZc32G4axx5gs28arn0gK8P5MPv8eArs=;
 h=From:To:Subject:Date:From;
 b=KfseqFqaAEogbaKyCIrlA+qrPTXZyuOPZ7b2qwbtejcjfUWOmBluTgTSniCf8MYUv
 CCqK6Ee2NdrQT7ni8VsRpuf8vl1q1Di+ff6SAUOvtJx4agCAmH+mCBGWg30fel2DUw
 KAZzijULwXymh09bZmRbZCmOweavTxyvZrTeghDBkYQ4VwhSYmAeKraJNC/SvMEbsp
 I1tdjdpeTTTX+w0OYDZdv2FRnZkOMk0GMZK1tS0xt2Q4PD2sczqbgZ6wVNKYraZ2nd
 Uny+bE2P3o9wdg+QxHM4ob/w/WRjfP81DXzMq44dKUgIH1Uh5OEB5lHxZ1oPJxe+tw
 aaqCYRVaxF4zg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KfseqFqa
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 4.{14,
 19}.x / 5.{4, 10, 15}.x / 6.{1, 5}.x series
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
index a6b4967a8c..3aef7142c2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.5.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.5.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index dfcc87802b..92ea8cdb88 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  78e36d4214547051c24df2140f4ce09428d6c515ad9a71b38b28e8094a95d2f6  linux-6.5.6.tar.xz
-sha256  9edefdde32c2298389dcd19566402332b3c2016f5ada17e5820f500b908d478c  linux-6.1.56.tar.xz
+sha256  0d09ea448005c9cfe5383e4c72a872b39188b928f8c44e146b03b1b7851fbb8c  linux-6.5.7.tar.xz
+sha256  f9ebfe3ddc5152d87b37e33be30e31875d137433be10a57ce29d2eae7b6e91b1  linux-6.1.57.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f37182aecb57ed6853d01e1074d3a60a653331e35f3115728381e08be050b9d3  linux-5.15.134.tar.xz
-sha256  183a4507b0ebec7816a79ceba6253aa7ad345e25b0fcd4e834ee154be9a993ab  linux-5.10.197.tar.xz
-sha256  2e775970521ea7ff6eb613fc85a6e34cec73feaeb67b88a77a2fbd4f75483df0  linux-5.4.257.tar.xz
+sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
+sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
+sha256  39701815a7a1b5ea4253db18e9327a45926a944499628d032da63c1bb6ea623e  linux-5.4.258.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  b732c2e4f08576a9dd5bb14213cead3835acbb101a91aaba3d6ace302fd538ac  linux-4.19.295.tar.xz
-sha256  555ce40f1df4c0f4a74cbefcaad0c67108615860968720faabe51cdee2df1478  linux-4.14.326.tar.xz
+sha256  636166769dc232d18f399f40c22107c289aab8702e752301588e64ab582860ae  linux-4.19.296.tar.xz
+sha256  bff085d8832dd5c3d717beeebdff78a0b678f0a2307f83acf22764dabdcb0a5a  linux-4.14.327.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2e2655964..a93458c399 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,13 +404,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.326"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.134"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.56"	if BR2_KERNEL_HEADERS_6_1
-	default "6.5.6"		if BR2_KERNEL_HEADERS_6_5
+	default "4.14.327"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.57"	if BR2_KERNEL_HEADERS_6_1
+	default "6.5.7"		if BR2_KERNEL_HEADERS_6_5
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
