Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 019B7D711C7
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 21:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AACB083ED0;
	Thu, 18 Dec 2025 21:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmxKiw-lPWUS; Thu, 18 Dec 2025 21:42:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D95D83ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766094127;
	bh=XtjWgxDVQWoAgqpiF3qZWUSaBjTNgDN9i1a8G7v0bMU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cJV2p/xa5Xz6uugXjWE4zRu93vQbtT6m8SWdvHg6TezOoecv2lvV1hEiOF7Dmk+Ez
	 GHYfYHJdfhhjLgXIBAzcBbMeK3lawf3Q7RVNpUqnhw8jufP8xtWCpK6JVADEe2FWip
	 gWQkBzFk5YV8QAzEMcvAnJSkGA/GkOK2i60pIc6sfH4tvZ5Tmspe7c7OuA+w7litTU
	 wjTj1j8HssUOdvyRt95xivJpUUS4B6MMt5YxY3UDCjrPDjbaWBqpGEk6yuSnKk86EG
	 CNVlA1CpA2srZJ/K6WMz6sPjJPKFB9kz6wlrag5PuSbi/B2OKbanZfRVkOTH0nXv3n
	 BfhyydIsvDXPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D95D83ED2;
	Thu, 18 Dec 2025 21:42:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 935601A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7956660BDF
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Px6CdJp5IT3 for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 21:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891AD60BD2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 891AD60BD2
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 21:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A7AE87332; Thu, 18 Dec 2025 21:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Dec 2025 22:29:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 118f5eb360eb540983e656563969abd23f87a9b2
X-Git-Newrev: 5ebe3024be47cc853e64fb4f9ce274bafdc410dd
X-Patchwork-Hint: ignore
Message-Id: <20251218214205.7A7AE87332@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-headers: drop 6.17.x option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ebe3024be47cc853e64fb4f9ce274bafdc410dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The 6.17.x series is now EOL upstream, so drop the linux-headers
option and add legacy handling for it.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                     | 7 +++++++
 linux/linux.hash                     | 1 -
 package/linux-headers/Config.in.host | 5 -----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index da91b68087..99289f2903 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_KERNEL_HEADERS_6_17
+	bool "kernel headers version 6.17.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 6.17.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 config BR2_PACKAGE_MESA3D_VDPAU
 	bool "mesa3d Gallium VDPAU state tracker support removed"
 	select BR2_LEGACY
diff --git a/linux/linux.hash b/linux/linux.hash
index 06abb56756..733ef50d8e 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  558c6bbab749492b34f99827fe807b0039a744693c21d3a7e03b3a48edaab96a  linux-6.18.2.tar.xz
-sha256  116802dc3ad1646163cc6ffe9bddba24a8069b569135ec0523cd799064f2edb9  linux-6.17.13.tar.xz
 sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ca652962d1..05a4822636 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -48,10 +48,6 @@ config BR2_KERNEL_HEADERS_6_12
 	bool "Linux 6.12.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12
 
-config BR2_KERNEL_HEADERS_6_17
-	bool "Linux 6.17.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_17
-
 config BR2_KERNEL_HEADERS_6_18
 	bool "Linux 6.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_18
@@ -465,7 +461,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.63"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.13"	if BR2_KERNEL_HEADERS_6_17
 	default "6.18.2"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
