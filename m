Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33BCFCCF9EE
	for <buildroot@archiver.kernel.org>; Wed, 29 Oct 2025 22:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0A5040686;
	Wed, 29 Oct 2025 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nr8tCjkmm9cm; Wed, 29 Oct 2025 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3D9640687
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3D9640687;
	Wed, 29 Oct 2025 22:18:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D6AE2A3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A1D2610EF
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6iCCGhKWCGp4 for <buildroot@buildroot.org>;
 Wed, 29 Oct 2025 22:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F98260FB5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F98260FB5
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A8E5879DA; Wed, 29 Oct 2025 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 29 Oct 2025 23:08:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b449935c2e8e19a03a8962f49493a76ccca11f9
X-Git-Newrev: a6942ce78cbe3a6ec54366b5224650c4ddd40bf1
X-Patchwork-Hint: ignore
Message-Id: <20251029221804.6A8E5879DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{4, 10,
 15}.x / 6.{1, 6, 12, 17}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=a6942ce78cbe3a6ec54366b5224650c4ddd40bf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 541b7f3613..7f1426c991 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8666a82015..5b1d18e7cd 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  c05faf36e9c2164be723cf6ada8533788804d48f9dd2fe1be2ccee3616a92bce  linux-6.17.5.tar.xz
-sha256  328f8f4608a653063a5fd82d29b17163faab2825fa419fa85b961740a342fb9f  linux-6.12.55.tar.xz
-sha256  ca4175a03ce2943ae192d77ad91e37ee292f1f1bb7b2954b062b0ef7eb0cb97c  linux-6.6.114.tar.xz
-sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
+sha256  8ecfbc6b693448abb46144a8d04d1e1631639c7661c1088425a2e5406f13c69c  linux-6.17.6.tar.xz
+sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
+sha256  0a98c05e8d0f6b49fad71b8d779410a0811ea5ae17d81744fe30718633fd9047  linux-6.6.115.tar.xz
+sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  23d080dc32f99d3939c3d1bd65a68ed85b8f934f92cc1841a63f898dcdb9a441  linux-5.15.195.tar.xz
-sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
-sha256  9949210093ca924d7b41162bb4772becd3f28ff726a09d061558929690a1815a  linux-5.4.300.tar.xz
+sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
+sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
+sha256  b7718766d060e6714bbe47004c71c360e844758f42fbf62cbaa5571119527962  linux-5.4.301.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7281b13d40..71ac9d5b89 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -458,13 +458,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.114"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.55"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.5"	if BR2_KERNEL_HEADERS_6_17
+	default "5.4.301"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.115"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.56"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.6"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
