Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40472C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D66634FBDA;
	Fri, 28 Feb 2025 16:46:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TMXryPnB2NGD; Fri, 28 Feb 2025 16:46:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 880544FC03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880544FC03;
	Fri, 28 Feb 2025 16:46:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1073D1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 632B642DC1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4m6IJtGjW1Xi for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 491F8419B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 491F8419B2
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44EC181793; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 18:46:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8d94747b33471ff0cc3e4db2459f23b9b34ca0cc
X-Git-Newrev: 07149e5f304cdedfc5c5a324ef06df2537e41ac3
X-Patchwork-Hint: ignore
Message-Id: <20250228162951.44EC181793@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 5.{4, 10, 15}.x / 6.{1, 6, 12}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=07149e5f304cdedfc5c5a324ef06df2537e41ac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index be44c00d7d..5d348693c2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index ccf6235166..6301673e07 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  39207fce1ce42838e085261bae0af5ce4a0843aa777cfc0f5c49bc7729602bcd  linux-6.12.5.tar.xz
-sha256  9d757937c4661c2f512c62641b74ef74eff9bb13dc5dbcbaaa108c21152f1e52  linux-6.6.66.tar.xz
-sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
+sha256  f785fb648a0e0b66a943bb3228a4b6ed62c90b985cd1ebf69da5d38e589da0cf  linux-6.12.7.tar.xz
+sha256  283ff410e3f352ceed161ae30c0020301326059db03e86efcb384d46ac5840e2  linux-6.6.68.tar.xz
+sha256  e892c0b380100b7e6249060282ad07fbded092f0a2ca1d647243d0fbe9ce6e50  linux-6.1.122.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c3e63cb864a05b6bbc886613c9e91714106b7a9ab40c31c101da0ca5b64d760a  linux-5.15.174.tar.xz
-sha256  565a4883cc460af9f338966fca51a84bcba13dc7e47a563e32639115cba79675  linux-5.10.231.tar.xz
-sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-5.4.287.tar.xz
+sha256  8fd8bbc80e7aae30aaca3b40576b283010b5e84e70f6fea1573589155ce8a9d0  linux-5.15.175.tar.xz
+sha256  fda44589a438dff8c718082e9a48843b15e5eb82f6cc2f98d48f48226063bef0  linux-5.10.232.tar.xz
+sha256  876fbae303723bcf9e01ab57b1a0a7d38045aacd481ff865dccc2cc89f591afe  linux-5.4.288.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c1bcdf1611..7878872f37 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.287"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.231"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.174"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.120"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.66"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.5"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.288"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.232"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.175"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.122"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.68"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.7"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
