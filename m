Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF01CC87FCF
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B81776060E;
	Thu,  7 Aug 2025 17:02:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luOFwanmjGyD; Thu,  7 Aug 2025 17:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9BC260639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9BC260639;
	Thu,  7 Aug 2025 17:01:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B03A31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAE8280C5D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtAOZ8p6uVes for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E32180BFB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E32180BFB
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C0D986984; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 3f986ee14e19bf852cb6dbefcb0b4db52c9226ad
X-Git-Newrev: 8d66b54c53b9c02840bf43ea9cf08e058705e2f3
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.9C0D986984@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8d66b54c53b9c02840bf43ea9cf08e058705e2f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 065c1b84b56c144c1cb8f2af1069de96d83b03c7)
[thomas: drop 6.15]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cb3f7ad232..8a66fd453e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.37" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.40" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 9475db9442..ec868a5e7a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  936fdfd2405b5e0ac38d4e094b07772610c22cd478f4bb257c9bf929e762ff95  linux-6.12.37.tar.xz
-sha256  3b67c170638142da56b7a9c3295f2483b88e8c4d3bc26b2bda63b6cf0cb9ee3b  linux-6.6.97.tar.xz
-sha256  0f49bda42fbd7506063d537fec7d4d147c373a0324655fdaf2a65a000c9f7acf  linux-6.1.144.tar.xz
+sha256  4811af1317f98d2cccea3c7695969a2c03a27cb02fd2d5327032dd5341842933  linux-6.12.40.tar.xz
+sha256  d6c0ec4d55b14814f55b62a0b23a2d95faf66877e48fbfb4b83523e4afdf97ba  linux-6.6.100.tar.xz
+sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  21786ee84981418279fcd60ae6ed98ab2f102b5a4a255bd81b881033f0afff14  linux-5.15.187.tar.xz
-sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
-sha256  c48158f7735668aac78b9d74bb3616f57a4ea0816ca09f7db83f7834d705b6a9  linux-5.4.295.tar.xz
+sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
+sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
+sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e2503fe4b3..a1b93c31ca 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.187"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.144"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.97"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.37"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.100"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.40"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
