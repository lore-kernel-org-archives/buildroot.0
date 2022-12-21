Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F39F540B80;
	Wed, 21 Dec 2022 18:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F39F540B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJuzLotLgFIt; Wed, 21 Dec 2022 18:07:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2989640ACE;
	Wed, 21 Dec 2022 18:07:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2989640ACE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 596951BF3A6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41D2F82032
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:07:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D2F82032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2NuQ_ftiNoz for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:07:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59AE380E07
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59AE380E07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 465A986C8B; Wed, 21 Dec 2022 18:07:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 19:06:38 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d8665eaa194bb3f0b561a4a2f75c827a0c68e40f
X-Git-Newrev: 3c9959c256273b58c8e13507569f52159211c844
X-Patchwork-Hint: ignore
Message-Id: <20221221180708.465A986C8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15}.x / 6.0.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c9959c256273b58c8e13507569f52159211c844
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 298bcb0455d0cbf4231f4b87a8e132202120ac79)
[Peter: drop 6.0.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b5d0d353ff..18e7d70fda 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.82" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.83" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f265280d17..5222ddeafc 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  fceef6bb79bac494663ccde34453521fc616cd94272fd30564752b3742381b65  linux-5.15.82.tar.xz
-sha256  1e0a24bb5510caa18b3601b25e12cc2a1ce123948de551f4f2cdbb40aea707e7  linux-5.10.158.tar.xz
-sha256  0c1f552a1d2f63b3ecd4d33189f0003bc91fb8ff79967a7e295d015c280c9a44  linux-5.4.226.tar.xz
+sha256  40590843c04c85789105157f69efbd71a4efe87ae2568e40d1b7258c3f747ff3  linux-5.15.83.tar.xz
+sha256  1ba9bf57b6bf36d76447d5044b80b746cb5fd61d981c811603dc763b7789cea7  linux-5.10.159.tar.xz
+sha256  5eefc5037415f31c942d3cfa430b96c2a273246cf7e51db1e51b1d89887f0593  linux-5.4.227.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  ed4fd861fe9f6cd09f409f00dcccfa691e6d1a61c585723e587575dcb60aeb29  linux-4.9.335.tar.xz
-sha256  acd2ee8e03da098fe9f7e52871dd0790850fc32b78657606bdf65bdd94bbf99b  linux-4.14.301.tar.xz
-sha256  219bce1ac3f542d06fc606ae6bcb10f8ab1940a46c7903113be59afc486c204f  linux-4.19.268.tar.xz
+sha256  1f6de11306cc9f82fe1d4dd03565cdf43906fa6f77302913d942fd63b77b500c  linux-4.9.336.tar.xz
+sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
+sha256  6e0ba5d224ab216b7b938cc9ff2478be7882a884bbdf15374149bade4d58b20a  linux-4.19.269.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 48bf36e84e..3dbb43ef7f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -382,12 +382,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.335"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.301"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.268"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.226"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.158"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.82"	if BR2_KERNEL_HEADERS_5_15
+	default "4.9.336"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.227"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.159"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.83"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
