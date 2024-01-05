Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F97C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 22:50:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 212F34378D;
	Fri,  5 Jan 2024 22:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 212F34378D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ph-rYJ0lEgjK; Fri,  5 Jan 2024 22:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0394743797;
	Fri,  5 Jan 2024 22:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0394743797
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5819A1BF2B4
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A8CB423DD
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 22:50:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A8CB423DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GGwgnAmDp8mo for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 22:50:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 329E6423DC
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 22:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 329E6423DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2039384600; Fri,  5 Jan 2024 22:50:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 23:47:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ccef467ce61220c8b80e8f6dbd283529e5be4e9
X-Git-Newrev: 64414981dd4d9d660e1877a6a8a5dfc620f18616
X-Patchwork-Hint: ignore
Message-Id: <20240105225021.2039384600@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=64414981dd4d9d660e1877a6a8a5dfc620f18616
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 627cfd2130..82d46365e7 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index e0b7183888..4207bd6b2f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  5036c434e11e4b36d8da3f489851f7f829cf785fa7f7887468537a9ea4572416  linux-6.6.8.tar.xz
-sha256  7e3d2694d18ce502068cc88a430da809abbd17d0773268524ebece442612b541  linux-6.1.69.tar.xz
+sha256  9ee627e4c109aec7fca3eda5898e81d201af2c7eb2f7d9d7d94c1f0e1205546c  linux-6.6.10.tar.xz
+sha256  2df774dd53f9ffd4e57ebf804cf597709295df6a304fe261d25220a134b7f041  linux-6.1.71.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b2a49d87605f3a9491581150315e22337c1afb599efc1e2737481be3a2d6d620  linux-5.15.145.tar.xz
-sha256  c55217a80d74f81b83116289a8bfe4302293390b45aeabb76f64814920788863  linux-5.10.205.tar.xz
+sha256  5a807a5fa2a80ada957d8079681dfb5cc196ec26f43244d1c8a4fd7af592d192  linux-5.15.146.tar.xz
+sha256  c43d613216e6c5197519a4e979de5c1b510100858ff591963931c99e59c7485b  linux-5.10.206.tar.xz
 sha256  4dae99e49f466d4689e128ec023754908147159d7462019a83c7da1f25df9b15  linux-5.4.265.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  022dce3935eadec7c31093992cc101c905fd4ffbb8afce92f3e41fdd0fa18b36  linux-4.19.303.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e593ace5ce..df760326dc 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -411,10 +411,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.334"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.303"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.265"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.205"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.145"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.69"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.8"		if BR2_KERNEL_HEADERS_6_6
+	default "5.10.206"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.71"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.10"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
