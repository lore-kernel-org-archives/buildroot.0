Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D05D2E9F1
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 13:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A20AA60667;
	Mon, 11 Nov 2024 13:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuCkQHMJCSks; Mon, 11 Nov 2024 13:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7FA36066A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7FA36066A;
	Mon, 11 Nov 2024 13:36:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 119C4D8F
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D67BB40089
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZH86751OMfc for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01DD740077
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01DD740077
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 13:36:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC64786016; Mon, 11 Nov 2024 13:36:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 11:01:51 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 24df18a14879ac27bf72aac1e57b49e5d2d49432
X-Git-Newrev: b39aef82bc2ef59319fb706c65a8b034f34bf3da
X-Patchwork-Hint: ignore
Message-Id: <20241111133628.DC64786016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] {linux,
 linux-headers}: bump 5.{10, 15}.x / 6.{1, 6, 11}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b39aef82bc2ef59319fb706c65a8b034f34bf3da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 70359eaa0dfdb79f7566fdaf9b0adc81c27bfe1d)
[Peter: drop 6.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ea13ab0aeb..0c15064167 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
-sha256  f74812f78e88992c416434cb107639e13a551dbaff36bb90d6346ab16ab71a95  linux-6.6.56.tar.xz
-sha256  8bd8de3562fb006653e550a934e66ed9f80b7576258a03e2caa2e3ce1c1f9f24  linux-6.1.112.tar.xz
+sha256  e7df81e588d70fab5ec3ec3bb04ac53d51f0860fc3b1ec45e0a4167a026899db  linux-6.6.58.tar.xz
+sha256  2286e4a02ea2fbe65023dbf779f20aa994ba2b8d37ed559049378089451aa256  linux-6.1.114.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
-sha256  f6a19a64785965b9fcac0bcb6fd2412b45ca449495bb03592d46f9a50be51ca6  linux-5.10.226.tar.xz
+sha256  e618c6d845fd1bc89477508e8d084bbe791fc88bf7623adee2deb6ecb2275370  linux-5.15.169.tar.xz
+sha256  76cc8d7f1528f87902e38697229661d0617a7d6ab86166be9f3ef9a613b17b72  linux-5.10.228.tar.xz
 sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  4e27cdf999359876a0ff489bff6ece7ba5798ff37c2289db0c9e9422a9014162  linux-4.19.322.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dcc49d4b31..e44ba290ea 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -425,10 +425,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.226"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.112"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.56"	if BR2_KERNEL_HEADERS_6_6
+	default "5.10.228"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.169"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.114"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.58"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
