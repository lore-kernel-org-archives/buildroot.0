Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9451BC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 21:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28A4B4180C;
	Wed, 30 Aug 2023 21:46:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A4B4180C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gN3fZdAI_dxk; Wed, 30 Aug 2023 21:46:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59865417FF;
	Wed, 30 Aug 2023 21:46:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59865417FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF54F1BF405
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B667F41B74
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 21:46:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B667F41B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVPieKWQV4J3 for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 21:46:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9CE141DA9
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 21:46:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9CE141DA9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 956BE8665B; Wed, 30 Aug 2023 21:46:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 23:45:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c8d890c1946308f5396aa6428da5274b25c3a5f
X-Git-Newrev: 16c3b4b92bb7b2fef6ad314a5fb9b7203b3d80b3
X-Patchwork-Hint: ignore
Message-Id: <20230830214636.956BE8665B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{14,
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16c3b4b92bb7b2fef6ad314a5fb9b7203b3d80b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index dcfc31ac8b..de08f755f6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.12" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index fb2bfebd61..066edd9a7d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  cca91be956fe081f8f6da72034cded96fe35a50be4bfb7e103e354aa2159a674  linux-6.4.12.tar.xz
-sha256  c9ea14231ca4ca6e3882a9339a8c3c414e4c91519d3e50af6822f47e99057a0f  linux-6.1.49.tar.xz
+sha256  5e5511b50bc9fd358bb5d7746fab3c5ea396d42c6bd7a54b2555ede0de5ac8e5  linux-6.4.13.tar.xz
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
index deb3067b60..0c0b365473 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,13 +400,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.49"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.12"	if BR2_KERNEL_HEADERS_6_4
+	default "4.14.324"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.293"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.255"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.193"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.129"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.50"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.13"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
