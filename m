Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E6CEBF92
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CB6360F18;
	Mon, 17 Nov 2025 19:51:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5HC3W_6Ok_k; Mon, 17 Nov 2025 19:51:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1401610E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1401610E0;
	Mon, 17 Nov 2025 19:51:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11F921BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0C2260ECB
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zK2gINjLiXD for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B4D60F2E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B4D60F2E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1E4B848E6; Mon, 17 Nov 2025 19:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Nov 2025 12:30:23 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d33be503da9d5d917f8441074806fa011373b33b
X-Git-Newrev: e887ad6985c68159115482a2cf1662917873245c
X-Patchwork-Hint: ignore
Message-Id: <20251117195125.E1E4B848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 5.4.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=e887ad6985c68159115482a2cf1662917873245c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Update the latest kernel releases to:
 - 6.12.55 -> 6.12.57
 - 6.6.114 -> 6.6.116
 - 6.1.157 -> 6.1.158
 - 5.15.195 -> 5.15.196
 - 5.10.245 -> 5.10.246
 - 5.4.300 -> 5.4.301

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index a9e077f9a3..3e679ba8a8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.55" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.57" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4cb03ddaa9..ae44069a3c 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  328f8f4608a653063a5fd82d29b17163faab2825fa419fa85b961740a342fb9f  linux-6.12.55.tar.xz
-sha256  ca4175a03ce2943ae192d77ad91e37ee292f1f1bb7b2954b062b0ef7eb0cb97c  linux-6.6.114.tar.xz
-sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
+sha256  165ca1c37c4607b90e731996b7c1e3311285167d13deeedf08f3f1f0b9d2541a  linux-6.12.57.tar.xz
+sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
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
index 4108322ed3..a0e3340d52 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.114"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.55"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.301"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.116"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.57"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
