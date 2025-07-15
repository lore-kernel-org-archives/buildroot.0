Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A77BC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A771E41745;
	Thu, 17 Jul 2025 20:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPrats04nYzY; Thu, 17 Jul 2025 20:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB50A4173E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB50A4173E;
	Thu, 17 Jul 2025 20:23:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 10B0E226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA90A60865
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j52_z2HJa1ab for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:22:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDC3660A5C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDC3660A5C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9A03865B2; Thu, 17 Jul 2025 20:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 19:10:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 19b69ede51124aa050137a299dba2c9b412236ab
X-Git-Newrev: 42fe84e87e9f50623c80ec893c714fbf4fa52bbb
X-Patchwork-Hint: ignore
Message-Id: <20250717202236.D9A03865B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.{1, 6, 12}.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42fe84e87e9f50623c80ec893c714fbf4fa52bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 09880508cb26260f30608137f697b6bdf11483fa)
[Titouan: drop 6.15 not present in buildroot 2025.02]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 03a06d1e59..fd77eef96c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.35" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.36" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 49ad23f2f6..f881da7036 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
-sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
-sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
+sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
 sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e507869169..cb1a9d8fe7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,9 +431,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.143"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.96"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.36"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
