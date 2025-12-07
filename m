Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F44D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E41606F0;
	Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6eB8Ku2U-xA; Sun,  7 Dec 2025 12:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D47A60723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111795;
	bh=QtZea+vW0f67Nz/sNng0ziSPxCK30D8j9JaodjR9iVY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ex/YBJVlYyr02aBmUpIN+z1nsZLKfxTO8LjgJ4rfjnZYzKm0exMkdVLNPD4lZuW41
	 xRszWNqAqt8i+1xAym4iZuPTpOEMpeJLwGABNzxk55yVFAsE9AxUuO3tyTmggEw23B
	 XUb/hU5zF+jjJixfteJiIPVbmxh2V+nYPU/x48ek6VKtFXrmUCx9cRttwyFOfHpT4Z
	 2Y89aVaUxj+gWMLLXH1MlzaIFrxP7Xn1iDGyjxlKOOx3V51uFdQTU7YsII2rp6RRc2
	 kUdVx+F0SWKYwJYEcs7MKnYzIu/wxU27RPmzs1itEx1M6x+3jhd7K9OeS/TAt2M057
	 4Sff5CwOVhogw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D47A60723;
	Sun,  7 Dec 2025 12:49:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41C78E7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28939403B9
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YNTpF99Uxiqq for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F1640166
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61F1640166
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D79D86625; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 12:41:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb1d45388f1392fee4c5410faac714e81b6dad93
X-Git-Newrev: 6f311de2de918b883447438ef88eead935398203
X-Patchwork-Hint: ignore
Message-Id: <20251207124952.5D79D86625@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {toolchain,
 linux-headers}: add support for 6.18 headers
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f311de2de918b883447438ef88eead935398203
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add (and default to) 6.18 to linux-headers.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/linux.hash                                            |  1 +
 package/linux-headers/Config.in.host                        | 13 +++++++++++--
 toolchain/Config.in                                         |  5 +++++
 .../toolchain-external-custom/Config.in.options             |  6 +++++-
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index fcb5bdb113..d14de29189 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  9106a4605da9e31ff17659d958782b815f9591ab308d03b0ee21aad6c7dced4b  linux-6.18.tar.xz
 sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
 sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a53f1a36bd..f4c440fe3f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -3,7 +3,7 @@ comment "Kernel Header Options"
 choice
 	prompt "Kernel Headers"
 	default BR2_KERNEL_HEADERS_AS_KERNEL if BR2_LINUX_KERNEL
-	default BR2_KERNEL_HEADERS_6_17
+	default BR2_KERNEL_HEADERS_6_18
 	help
 	  Select the kernel version to get headers from.
 
@@ -57,6 +57,10 @@ config BR2_KERNEL_HEADERS_6_12
 config BR2_KERNEL_HEADERS_6_17
 	bool "Linux 6.17.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
+
+config BR2_KERNEL_HEADERS_6_18
+	bool "Linux 6.18.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -135,8 +139,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_18
+	bool "6.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_17
-	bool "6.17.x or later"
+	bool "6.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_16
@@ -465,6 +473,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
 	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
+	default "6.18"		if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5fcc9362ba..8330e652c2 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -675,6 +675,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -688,6 +692,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "6.18" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
 	default "6.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 	default "6.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_16
 	default "6.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_15
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 9855b33ade..6991b899be 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -173,8 +173,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_18
+	bool "6.18.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_17
-	bool "6.17.x or later"
+	bool "6.17.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_6_16
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
