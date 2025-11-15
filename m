Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1139CCEB2CC
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 13:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 934B9608DB;
	Sat, 15 Nov 2025 13:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JMYsQU4_Ye4; Sat, 15 Nov 2025 13:21:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADD07608F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADD07608F1;
	Sat, 15 Nov 2025 13:21:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABFC158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80F8384209
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_6USN-o0CaZ for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 13:21:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7101684208
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7101684208
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 13:21:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E22C846E3; Sat, 15 Nov 2025 13:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 13:57:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f3d0e8e2ad10c4e167897b559a04e19e0d09446
X-Git-Newrev: 32856875c4f9aacfe1f4d38d7326ff2af530d2e3
X-Patchwork-Hint: ignore
Message-Id: <20251115132129.5E22C846E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12,
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

commit: https://git.buildroot.net/buildroot/commit/?id=32856875c4f9aacfe1f4d38d7326ff2af530d2e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ffbd99a26c..04486c0fbd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 952802b339..308d12b701 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ddf2ea0d4439e1d57136be3623102af9458f601f5b1cb77e83246e88aea09d0e  linux-6.17.7.tar.xz
-sha256  165ca1c37c4607b90e731996b7c1e3311285167d13deeedf08f3f1f0b9d2541a  linux-6.12.57.tar.xz
+sha256  5a8de64a75fca706c01c6c0a77cf75a74618439db195e25f1f0268af6b2fb1da  linux-6.17.8.tar.xz
+sha256  5f1c4c546660a6a81046fdfa6195306bad2c8d17c0d69876dc100a85ad4613ac  linux-6.12.58.tar.xz
 sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9a23bb03f2..038105bd16 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -463,8 +463,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.116"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.57"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.7"	if BR2_KERNEL_HEADERS_6_17
+	default "6.12.58"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.8"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
