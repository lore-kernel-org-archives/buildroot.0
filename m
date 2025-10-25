Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B82CCF9E3
	for <buildroot@archiver.kernel.org>; Sat, 25 Oct 2025 17:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C167B811EE;
	Sat, 25 Oct 2025 17:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVbJPrCBIbDu; Sat, 25 Oct 2025 17:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCE00811F4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCE00811F4;
	Sat, 25 Oct 2025 17:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8386543F
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A3A640310
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rmukg65rCBQa for <buildroot@buildroot.org>;
 Sat, 25 Oct 2025 17:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B348F4004D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B348F4004D
 for <buildroot@buildroot.org>; Sat, 25 Oct 2025 17:31:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E8BF87815; Sat, 25 Oct 2025 17:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Oct 2025 19:22:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cbd7c1b2952a11691bebcf41fcfd7d589940bba
X-Git-Newrev: 4016c78ea2fc7f0afb7281262c8661f26a61abb0
X-Patchwork-Hint: ignore
Message-Id: <20251025173135.9E8BF87815@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 17}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4016c78ea2fc7f0afb7281262c8661f26a61abb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7fb0e2aa64..541b7f3613 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5ea815260d..8666a82015 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  010a12296e6fba7597ff36681be2485fd3b1780ac8fd9e6a9f3cfe193f0491db  linux-6.17.4.tar.xz
-sha256  1b0dcd3390efeec44e528748609bafcf36eae895bb68c8f62ac5e5940943de62  linux-6.12.54.tar.xz
-sha256  1f95cfd2e461d192dd9c6130e47aefc9856529a74ace4191ad8e56ba1849c41e  linux-6.6.113.tar.xz
+sha256  c05faf36e9c2164be723cf6ada8533788804d48f9dd2fe1be2ccee3616a92bce  linux-6.17.5.tar.xz
+sha256  328f8f4608a653063a5fd82d29b17163faab2825fa419fa85b961740a342fb9f  linux-6.12.55.tar.xz
+sha256  ca4175a03ce2943ae192d77ad91e37ee292f1f1bb7b2954b062b0ef7eb0cb97c  linux-6.6.114.tar.xz
 sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  23d080dc32f99d3939c3d1bd65a68ed85b8f934f92cc1841a63f898dcdb9a441  linux-5.15.195.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index fd59e0c056..7281b13d40 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.113"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.54"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.4"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.114"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.55"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.5"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
