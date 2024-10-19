Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D19D3C926
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7FA6063A;
	Sat, 19 Oct 2024 18:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mw5VAiW8K8VX; Sat, 19 Oct 2024 18:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A497860745
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A497860745;
	Sat, 19 Oct 2024 18:43:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A7363F2C
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFC854017D
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qT9G4uQNelNe for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC3E940102
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC3E940102
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2E5483C1A; Sat, 19 Oct 2024 18:43:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Oct 2024 20:30:00 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 87803da53c08a768c82bdc07e8b6279ae6d65fa6
X-Git-Newrev: cc40eeb370f725c27f5ea98b29dadcc6ef577de1
X-Patchwork-Hint: ignore
Message-Id: <20241019184307.A2E5483C1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc40eeb370f725c27f5ea98b29dadcc6ef577de1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d3a12bc6f1fc231948d1b6b154dd890bf6df4fa5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index b4e88214d6..e8c0722de0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.10.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.10.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5c745f7c7c..8f369e5f36 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a4489b70e0a7c2dc8f501b9cd7fc76989be2febb5519e163ecf816064f2f6858  linux-6.10.9.tar.xz
-sha256  c065e36daf28210060c91a37ef3e92ac5814784e634577e04e406297ead2e86e  linux-6.6.50.tar.xz
-sha256  732ff40ac63642c5ddbb7d65c24c90ed08b95af0e8c92df4739e9703eec01ac1  linux-6.1.109.tar.xz
+sha256  e687e735b5eb9efb6d67b42433c93fc9118106a995514f062652873b5e809bcd  linux-6.10.10.tar.xz
+sha256  1c0c9a14650879c4913efdbac428ba31a540c3d987155ddf34d33e11eca008b3  linux-6.6.51.tar.xz
+sha256  9ebe34b4742f8c9104678f32a6bc20e91299ebac2ae607ff2ed137d928df8f6a  linux-6.1.110.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e56caae259b85b7685ee589075d58bb7b227024497a60fa27a7b43e0b48839cf  linux-5.15.166.tar.xz
-sha256  85d7bf3a807538b9032e3f798ab978da9b77352bcb526534038c351a4f39e01c  linux-5.10.225.tar.xz
-sha256  250c6a3199b42a1cb1427c9bbeacf5d90fb91bcf9f227195f484a1c877e1f797  linux-5.4.283.tar.xz
+sha256  b1751f18ece3df08d502dd87a9ab1a317dc0f9486355bf8ee62ba6af0b35da30  linux-5.15.167.tar.xz
+sha256  f6a19a64785965b9fcac0bcb6fd2412b45ca449495bb03592d46f9a50be51ca6  linux-5.10.226.tar.xz
+sha256  77221ab9aebeac746915c755ec3b7d320f85cd219c63d9c501820fbca1e3b32b  linux-5.4.284.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  f13aa1465a2578a910f64b65d743d167466edfb1e0671bc70fa2328cb66b06d9  linux-4.19.321.tar.xz
+sha256  4e27cdf999359876a0ff489bff6ece7ba5798ff37c2289db0c9e9422a9014162  linux-4.19.322.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 003c2f6a66..067c3b96aa 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -423,13 +423,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.321"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.283"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.225"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.166"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.109"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.50"	if BR2_KERNEL_HEADERS_6_6
-	default "6.10.9"	if BR2_KERNEL_HEADERS_6_10
+	default "4.19.322"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.284"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.226"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.167"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.110"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.51"	if BR2_KERNEL_HEADERS_6_6
+	default "6.10.10"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
