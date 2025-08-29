Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC2FCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9B482271;
	Fri, 29 Aug 2025 13:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unLn01AZKM-6; Fri, 29 Aug 2025 13:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AEA282246
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AEA282246;
	Fri, 29 Aug 2025 13:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A057B6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86A064173B
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbg0DC3fv897 for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B905B41728
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B905B41728
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:14:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A748587D82; Fri, 29 Aug 2025 13:14:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 15:13:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8964f0652c3dbd3fefa89b23f257404df1b75dc1
X-Git-Newrev: c1512a76d7b2ed74dccca60ba035afd8088ea125
X-Patchwork-Hint: ignore
Message-Id: <20250829131445.A748587D82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 16}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=c1512a76d7b2ed74dccca60ba035afd8088ea125
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 4cab438250..afcebe78b1 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6aaa163eb2..0613a0d909 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b760a6fa793d774fbd3b7fa0bea3efd5c4f5294dfb98ef1bd5f6d5f7cef4f06d  linux-6.16.2.tar.xz
-sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
-sha256  80d2feb7334c30bacbe1e7dafa9ea415efb2c0ea4f4740ecbd1467cf5d94de5c  linux-6.6.102.tar.xz
-sha256  d9a03d3a2771c60fc726c58d3bba61123e5fd22d45ed27f6cf7a308c171180a1  linux-6.1.148.tar.xz
+sha256  d6a5e3c71a10b533a756251387cc8bf48bbd5c76d842ba5e957d8b1c316ab622  linux-6.16.4.tar.xz
+sha256  b650210ed3027b224969d148aa377452a9aad3ae7f2851abedd31adfef16bdae  linux-6.12.44.tar.xz
+sha256  d288dd38c3e62ba576ba6b3ad2a84cfba65cd43b702f6c50d1f701aee942b18e  linux-6.6.103.tar.xz
+sha256  c4e906b8d39a5866d25e06371d4de4454fbfaaeb67979a04e4137e807877be39  linux-6.1.149.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
-sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
-sha256  3d63614e58bf1befaba3f5713145200d09f26e564832c8948094fdf5b11fa73a  linux-5.4.296.tar.xz
+sha256  62b814f1a48e1d67764a28611f23ca1f1ce1084ad7f1d319acc05720a9a68604  linux-5.15.190.tar.xz
+sha256  08c1e982064c81f8445a8fff2293d430c716c11fd3185606b8275718d696d8d6  linux-5.10.241.tar.xz
+sha256  f10cfcea7acf7588087d7cc17ebeeb7d3ff783c040536698c544eed7c5e8a841  linux-5.4.297.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7ad66c33f0..f7c015725f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -454,13 +454,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.148"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.102"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.43"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16.2"	if BR2_KERNEL_HEADERS_6_16
+	default "5.4.297"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.241"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.190"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.149"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.103"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.44"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.4"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
