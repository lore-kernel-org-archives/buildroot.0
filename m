Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424DDC4707C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 18:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BA260C20;
	Fri, 12 Jan 2024 18:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BA260C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p6nBFV1k2X-g; Fri, 12 Jan 2024 18:47:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1514760B38;
	Fri, 12 Jan 2024 18:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1514760B38
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC04A1BF83B
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D12E542FD8
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 18:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D12E542FD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJDoCw-slp1t for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9211C42F7F
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9211C42F7F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7032A84BE1; Fri, 12 Jan 2024 18:46:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 19:12:44 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c977c4af568846b893527ac5202cda13277aa5f5
X-Git-Newrev: f1c2cbf52d3f574ebbbe249dcf92ec7a9e1881ea
X-Patchwork-Hint: ignore
Message-Id: <20240112184656.7032A84BE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 5.{10, 15}.x / 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1c2cbf52d3f574ebbbe249dcf92ec7a9e1881ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 64414981dd4d9d660e1877a6a8a5dfc620f18616)
[Peter: drop 6.6.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2e01afd442..71f8586f2f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.69" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.71" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index f7eb3fe814..418d3d2cba 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7e3d2694d18ce502068cc88a430da809abbd17d0773268524ebece442612b541  linux-6.1.69.tar.xz
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
index 8b88da9905..57d09b136e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -387,9 +387,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.334"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.303"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.265"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.205"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.145"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.69"	if BR2_KERNEL_HEADERS_6_1
+	default "5.10.206"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.146"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.71"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
