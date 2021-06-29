Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0911DC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3791610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3791610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F15B6F8E9;
	Wed,  4 Aug 2021 00:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-ArQJJOKySa; Wed,  4 Aug 2021 00:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D6F6F8E2;
	Wed,  4 Aug 2021 00:02:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B941A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAC1E4063A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9RpM3VGhwFeK for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D663840681
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 352F7860D3; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 29 Jun 2021 21:22:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 288df3d9e9b9879ad1ffee88c872436c4dadefd3
X-Git-Newrev: 28983ccc0368006c8c749eb8a60bd4812be8461e
X-Patchwork-Hint: ignore
Message-Id: <20210803210957.352F7860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: add version 5.13
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=28983ccc0368006c8c749eb8a60bd4812be8461e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                                             |  4 ++--
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 5 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 035699663c..0c3cf5db5f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,7 +28,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (5.12)"
+	bool "Latest version (5.13)"
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (4.19.182-cip45)"
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.12.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.13" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.182-cip45" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.165-cip41-rt18" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d7493545ef..ddd680a2d5 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9  linux-5.13.tar.xz
 sha256  c8d499fc53ed14838994ec2f51591ae40d64cce68559cd897be8acbeeee7630f  linux-5.12.10.tar.xz
 sha256  11027c6114eb916edbcc37897226fb6263b2931911d2d5093550473ce1a57600  linux-5.11.22.tar.xz
 sha256  83b81e433ba2f8ee143064fb163699ee857e26dd789006bc1e9edf1ccd0bd403  linux-5.10.43.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8eb12c545c..33e3ee3b58 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -6,7 +6,7 @@ config BR2_PACKAGE_HOST_LINUX_HEADERS
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_5_12
+	default BR2_KERNEL_HEADERS_5_13
 	help
 	  Select the kernel version to get headers from.
 
@@ -65,6 +65,10 @@ config BR2_KERNEL_HEADERS_5_11
 config BR2_KERNEL_HEADERS_5_12
 	bool "Linux 5.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
+
+config BR2_KERNEL_HEADERS_5_13
+	bool "Linux 5.13.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -139,8 +143,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_13
+	bool "5.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12
-	bool "5.12.x or later"
+	bool "5.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11
@@ -370,6 +378,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.43"	if BR2_KERNEL_HEADERS_5_10
 	default "5.11.22"	if BR2_KERNEL_HEADERS_5_11
 	default "5.12.10"	if BR2_KERNEL_HEADERS_5_12
+	default "5.13"		if BR2_KERNEL_HEADERS_5_13
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fe327b9f46..03375e0c52 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -510,6 +510,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -523,6 +527,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
 	default "5.12" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 	default "5.11" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_11
 	default "5.10" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 4a3345e4a5..bc4561f3f7 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,8 +123,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_13
+	bool "5.13.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_12
-	bool "5.12.x or later"
+	bool "5.12.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_12
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_11
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
