Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E80EFCE47
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670E9812C4;
	Wed,  4 Mar 2026 21:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTAzEbuko4Dl; Wed,  4 Mar 2026 21:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EABD81773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772661555;
	bh=FrXbct/DacCzTaWW1s7273BV8D0tF1pDbwT5PYJMgng=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FaDSKgFd3rQdeRxwlxyCH5JNGuQCLTJ/v5uyYQAgTYeLgYjd4deEA226em6mwWc/8
	 meMrvMkPWgQKnAfg5xBkgvoe/Dxe6kfPHqE0At9zdcisdxGFB3mJajKqej55+uHwHv
	 7K+4db6Iaco9s/BpnAtPbXoLDcIRvvTyxfuEAxiwGFoetexepsuzZ2UCCBKG6FuPH4
	 Npn4i7QR45/p/6iS9nvf6EAu2a2w3krY/oqCyJSFfjzVOQ52NcQ0fspcmpxHYCcRPs
	 Exv2yjoY9h+bsRYYcaYzDAzBHqxTqIYFr2ZOKrXXvkiOhPLkNsUIIeZqAcEN/qJl5e
	 rKl+LFP+802uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EABD81773;
	Wed,  4 Mar 2026 21:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8749E1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78C1740672
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l75ZxVd1WDJp for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:59:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9696540670
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9696540670
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:59:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91C8D863E3; Wed,  4 Mar 2026 21:59:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:57:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21baec5ef57077cc7b4ce98dbd863c5f5a6d8380
X-Git-Newrev: 7ddb1a99968de9b9c328812ce39fae87f8a6e345
X-Patchwork-Hint: ignore
Message-Id: <20260304215912.91C8D863E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18, 19}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ddb1a99968de9b9c328812ce39fae87f8a6e345
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.19.5 => 6.19.6}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.251 => 5.10.252} |  0
 package/linux-headers/{5.15.201 => 5.15.202} |  0
 package/linux-headers/{6.1.164 => 6.1.165}   |  0
 package/linux-headers/{6.12.74 => 6.12.75}   |  0
 package/linux-headers/{6.18.15 => 6.18.16}   |  0
 package/linux-headers/{6.19.5 => 6.19.6}     |  0
 package/linux-headers/{6.6.126 => 6.6.128}   |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/6.19.5 b/linux/6.19.6
similarity index 100%
rename from linux/6.19.5
rename to linux/6.19.6
diff --git a/linux/Config.in b/linux/Config.in
index 32b74f817d..8033361e82 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index f2946ac337..233dacaff8 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3b56eeb1dc9a437f189ca56b823be3769994f59a4ea0895b08ec0d20acaca13e  linux-6.12.74.tar.xz
-sha256  a7cd9c97b4f0b31cc030bcdc60abe5434fffb2556e293f7438ce7909dff8c9fe  linux-6.6.127.tar.xz
-sha256  33bf087f7bbf7f626873dd7d955eb44182a93695db41f5f89a6bd3d233a39d1c  linux-6.1.164.tar.xz
+sha256  06ee7927556ff1aa8810c4826501b0fdb169ebdc180644b882cf7c143ac1c177  linux-6.12.75.tar.xz
+sha256  669633bb8480021f15c38883fb2f6fe2087cc8b69a582f26f6b7d4ae6b348e48  linux-6.6.128.tar.xz
+sha256  5a817184f1be901b75c7e0afc02376bc3ac51624e03ec6f7b8a5f9d395d22ef4  linux-6.1.165.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4f2afffbeddaad6b8527d41a3e3a82646d3cf5dfd0acbb6c4e8a99fc70461b96  linux-5.15.201.tar.xz
-sha256  e6857625fee3b587b0279b445adc3940a5c40723385fa1055ac7af16ff4b4c01  linux-5.10.251.tar.xz
+sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
+sha256  34b3fbe2c9eeb767fc7eea4b9516e0dd44b79401ceb13e41713096b8eb270afb  linux-5.10.252.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 20618f4da0..93ba293fa3 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  95ae05c8c709e353c0e8506c072efc5598d85b8b7b564a1ebac7ee8345042ffa  linux-6.19.5.tar.xz
-sha256  7c716216c3c4134ed0de69195701e677577bbcdd3979f331c182acd06bf2f170  linux-6.18.15.tar.xz
+sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
+sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.251 b/package/linux-headers/5.10.252
similarity index 100%
rename from package/linux-headers/5.10.251
rename to package/linux-headers/5.10.252
diff --git a/package/linux-headers/5.15.201 b/package/linux-headers/5.15.202
similarity index 100%
rename from package/linux-headers/5.15.201
rename to package/linux-headers/5.15.202
diff --git a/package/linux-headers/6.1.164 b/package/linux-headers/6.1.165
similarity index 100%
rename from package/linux-headers/6.1.164
rename to package/linux-headers/6.1.165
diff --git a/package/linux-headers/6.12.74 b/package/linux-headers/6.12.75
similarity index 100%
rename from package/linux-headers/6.12.74
rename to package/linux-headers/6.12.75
diff --git a/package/linux-headers/6.18.15 b/package/linux-headers/6.18.16
similarity index 100%
rename from package/linux-headers/6.18.15
rename to package/linux-headers/6.18.16
diff --git a/package/linux-headers/6.19.5 b/package/linux-headers/6.19.6
similarity index 100%
rename from package/linux-headers/6.19.5
rename to package/linux-headers/6.19.6
diff --git a/package/linux-headers/6.6.126 b/package/linux-headers/6.6.128
similarity index 100%
rename from package/linux-headers/6.6.126
rename to package/linux-headers/6.6.128
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index f8364d0c7b..4ef19c2e9c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,13 +464,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.251"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.201"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.164"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.127"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.74"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.15"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.5"	if BR2_KERNEL_HEADERS_6_19
+	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.165"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.128"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.75"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
