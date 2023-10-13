Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF647CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F9241841;
	Fri, 13 Oct 2023 18:48:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F9241841
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xNXcDmFkrdXU; Fri, 13 Oct 2023 18:48:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41A7F41868;
	Fri, 13 Oct 2023 18:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41A7F41868
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 284531BF2BA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BC0140CAA
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BC0140CAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 13_guclbKAB1 for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:45:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E017440BFC
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E017440BFC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1BF384C4A; Fri, 13 Oct 2023 18:45:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:27:52 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 58bf67263b52c9fffbaaeebea22fbb635ef032cf
X-Git-Newrev: ac51d2a9032376ed375a9b8d65025c90daa24f1e
X-Patchwork-Hint: ignore
Message-Id: <20231013184521.E1BF384C4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 5}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac51d2a9032376ed375a9b8d65025c90daa24f1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d71743b7360c19d7555529077a47fb14eba8d234)
[Peter: drop 6.5.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9330900b13..283c07693f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
-sha256  9edefdde32c2298389dcd19566402332b3c2016f5ada17e5820f500b908d478c  linux-6.1.56.tar.xz
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
index d106e99f98..ed32b32ea4 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,12 +400,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.326"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.295"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.257"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.197"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.134"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.56"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.327"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.296"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.57"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
