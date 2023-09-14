Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85863EDE996
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 08:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D38C41749;
	Thu, 14 Sep 2023 08:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D38C41749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtm05ggq91xN; Thu, 14 Sep 2023 08:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5133041803;
	Thu, 14 Sep 2023 08:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5133041803
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE381BF5A2
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0742A60F34
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 08:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0742A60F34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ro1eii1QJ1g for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D21DA60F51
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21DA60F51
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C081986EF3; Thu, 14 Sep 2023 08:34:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 10:31:41 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 82ddf2070cf1612e0702a446dc24d11863876453
X-Git-Newrev: 78c498be21a7ae7396f4e58b582cd647d4d83481
X-Patchwork-Hint: ignore
Message-Id: <20230914083402.C081986EF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=78c498be21a7ae7396f4e58b582cd647d4d83481
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16c3b4b92bb7b2fef6ad314a5fb9b7203b3d80b3)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index aedc13aa1f..ab507d792f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  c9ea14231ca4ca6e3882a9339a8c3c414e4c91519d3e50af6822f47e99057a0f  linux-6.1.49.tar.xz
+sha256  b27ac1443eea563bc546ee1f67d9802bc8d6c0f6f18707407fba01f9f78c488c  linux-6.1.50.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
-sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
-sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
+sha256  750ec97ce4f1473e392b367a55eca4ea7a6b1e9e65ca2fb3bbca2eaa64802b66  linux-5.15.129.tar.xz
+sha256  bd4036da47612d0d8c5f8c43e7700e8c996ae3b51084aa8fc6530c9d00f1ded0  linux-5.10.193.tar.xz
+sha256  34d5ed902f47d90f27b9d5d6b8db0d3fa660834111f9452e166d920968a4a061  linux-5.4.255.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
-sha256  6f0a9010b2451e7ab5b28e38c81b3c5149277ab5fe0e08059e60eb602b804ebc  linux-4.14.323.tar.xz
+sha256  cd95a8cb8fefb749e32359b8a915c036abc37e80746285da6535cb5a0776b3f0  linux-4.19.293.tar.xz
+sha256  24e8b21647a0f270291ea56d9123d59c511fa10efc23f5d28b5cb51611e1d9f0  linux-4.14.324.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4891934a1f..582d6e7589 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -396,12 +396,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.49"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.324"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.293"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.255"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.193"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.129"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.50"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
