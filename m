Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BF3E7718F
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 20:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5438960866;
	Sun, 29 Dec 2024 20:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id goMaTvkVp7uo; Sun, 29 Dec 2024 20:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC0F60869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC0F60869;
	Sun, 29 Dec 2024 20:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 61474CA
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F05A4012F
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRb7ojz8YOiy for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 20:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 326ED400D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 326ED400D8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 20:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F5D28771D; Sun, 29 Dec 2024 20:10:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 20:51:25 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6ad85c42fb0a078fe25930c658c52b1ab6499608
X-Git-Newrev: e2143da2c1924c2f87817ad29022a9c6cefd6d2f
X-Patchwork-Hint: ignore
Message-Id: <20241229201058.1F5D28771D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2143da2c1924c2f87817ad29022a9c6cefd6d2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 49a7cf412133daf3d477a000f4449e984da40e21)
[Peter: drop 6.12.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bf6b8940a6..ae173ab0dc 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.65" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.66" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7f8e3bcced..ef7132036f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7ae1476e8b4c86e7754e581d45d6fbce5932bfefce934758a2907d6d79eca3e0  linux-6.6.65.tar.xz
-sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
+sha256  9d757937c4661c2f512c62641b74ef74eff9bb13dc5dbcbaaa108c21152f1e52  linux-6.6.66.tar.xz
+sha256  61c997b8acbbb8ab184565e96f476ecbb7e773cb35b98a1a4c832d809b2bf719  linux-6.1.120.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
-sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
-sha256  180754f3df0e8d7f206625255b3f5a6e1f441feec83336df42613ca8f6b1887c  linux-5.4.286.tar.xz
+sha256  c3e63cb864a05b6bbc886613c9e91714106b7a9ab40c31c101da0ca5b64d760a  linux-5.15.174.tar.xz
+sha256  565a4883cc460af9f338966fca51a84bcba13dc7e47a563e32639115cba79675  linux-5.10.231.tar.xz
+sha256  0d0ffae5bf0e6f9c6a1ce42da2bc2a8696ca55721c103497eb1245be8cc04b20  linux-5.4.287.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  607bed7de5cda31a443df4c8a78dbe5e8a9ad31afde2a4d28fe99ab4730e8de1  linux-4.19.325.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 02634f7cb9..077f677ccb 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,11 +404,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.19.325"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.65"	if BR2_KERNEL_HEADERS_6_6
+	default "5.4.287"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.231"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.174"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.120"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.66"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
