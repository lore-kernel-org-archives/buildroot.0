Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2693CDB482
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 14:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6943B40120;
	Thu, 12 Oct 2023 14:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6943B40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 30cx-UEiDYqM; Thu, 12 Oct 2023 14:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84B54401AE;
	Thu, 12 Oct 2023 14:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84B54401AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B6B41BF990
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD986416AC
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 14:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD986416AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y923vpX40jYH for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903E04038B
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 903E04038B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D9CF845F8; Thu, 12 Oct 2023 14:39:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 16:35:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e15854fbcb12c22bda59affb658aecc002177ed
X-Git-Newrev: d71743b7360c19d7555529077a47fb14eba8d234
X-Patchwork-Hint: ignore
Message-Id: <20231012143924.7D9CF845F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d71743b7360c19d7555529077a47fb14eba8d234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
