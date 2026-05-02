Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B93CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 12:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4FDB815D8;
	Sat,  2 May 2026 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRN8tGC1b1ei; Sat,  2 May 2026 12:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D498816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777723809;
	bh=O06eRFAn+rRSnEbA2fEaMBmCApfSpbhzyxILC47N9mM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ciyRk6fNVTvZ/SbZtowpVcDyPh9S9kjWB0hJmBhwnSWIoMA7WA9hHmMI+I2R3YcOx
	 FCUNR0ITKqUIyyUUc4z0rhhB8HQ+a2rsRINlWYGQN5IRYHPF42/Jd0uo8ubsvq4LPV
	 nls4Rw4O9Y4BK7eBJKFm76kSgRrWWJNfe9zCC2C6CVa6OFPemGCFZLpo17sed/LROx
	 KTQjN5kjsrc8egfYmDMhSQVRzEHBEXLT3Xgu3IECHyDV8E/5ppVE2Z9kKvH0X0pqFn
	 XPCUkQIkS+N+wQh6CoP4cJV2cznmEI2PLQp9Ee9V5ZQineYLvw9ul0H22z+qQjVWEC
	 vvYHPw498OmgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D498816E5;
	Sat,  2 May 2026 12:10:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAEA4127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B101161030
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jg8BpvqyXXbn for <buildroot@buildroot.org>;
 Sat,  2 May 2026 12:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0A2460FB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0A2460FB2
 for <buildroot@buildroot.org>; Sat,  2 May 2026 12:10:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7988C7FE77; Sat,  2 May 2026 12:10:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 13:54:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d230af8bba84bbff2615fbfe402a30e710c8f535
X-Git-Newrev: b8a0093495eeff7e79c2c1934aea1321cf91d412
X-Patchwork-Hint: ignore
Message-Id: <20260502121007.7988C7FE77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x / 7.0.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b8a0093495eeff7e79c2c1934aea1321cf91d412
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.2 => 7.0.3}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.253 => 5.10.254} |  0
 package/linux-headers/{5.15.203 => 5.15.204} |  0
 package/linux-headers/{6.1.169 => 6.1.170}   |  0
 package/linux-headers/{6.12.84 => 6.12.85}   |  0
 package/linux-headers/{6.18.25 => 6.18.26}   |  0
 package/linux-headers/{6.6.136 => 6.6.137}   |  0
 package/linux-headers/{7.0.2 => 7.0.3}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.0.2 b/linux/7.0.3
similarity index 100%
rename from linux/7.0.2
rename to linux/7.0.3
diff --git a/linux/Config.in b/linux/Config.in
index 8fa2ab8ef2..cc2228d5aa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index d9f1290f9c..ffdbcd8c27 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d56e463a7b1f5355794ae83a102453ad930a51f9cb46b295fcf24a717bff52dd  linux-6.12.84.tar.xz
-sha256  6fb2d21a98281d786ee5fc63760e6f2c33e567e178e83c605bf0359eabbcf471  linux-6.6.136.tar.xz
-sha256  e0cbe674801749075b93008d8854dbf1c8d300805ada0b60f6f907bbb83aef2c  linux-6.1.169.tar.xz
+sha256  e35ac999f40a6874493d8d60f33f1150d7a89ae5841c428da82257fbcd070aed  linux-6.12.85.tar.xz
+sha256  92f1e90d8be49f9d7f989e563c97a4f39cd7731025d7b81152814c68b5bd56c4  linux-6.6.137.tar.xz
+sha256  b578912f79a5e8ea1a94ce4364d20a3902d2005be0e16deee9fbd0ad697c4944  linux-6.1.170.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  0bebe7d82a57e98792a407109566f1813fde97aaf7f735c1c7e6feebe833dc64  linux-5.15.203.tar.xz
-sha256  ec0724928050e8e2f6226fe8bbb206f42a951c0ed2dbb533c5462789f6d75ac8  linux-5.10.253.tar.xz
+sha256  9bfd4c3303ca8e2cf9aa2bc570afa31100a8e2d0132ba16e904cbe06ff76dbcd  linux-5.15.204.tar.xz
+sha256  75473ca597a1cd83a2c29a2857f9b046463672eb225912271676180bad1a869d  linux-5.10.254.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index c7f378d06c..cd0214519d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  53591a03294527a48ccb0b9e559e922df8a38554745a1206827ca751d2ca7662  linux-7.0.2.tar.xz
+sha256  0bedadbf5788693ddebbcc913c893f1a97349af79ddde7144c2a80b401959f1c  linux-7.0.3.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  29680a07d4430b269af6ce68079b0e81dbd60f03e6f351e0661991fe39bd1898  linux-6.18.25.tar.xz
+sha256  53772f5d3776e043767c8d81a32240d1f3eb64e822a5d7a510b55ca40707b0ec  linux-6.18.26.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.253 b/package/linux-headers/5.10.254
similarity index 100%
rename from package/linux-headers/5.10.253
rename to package/linux-headers/5.10.254
diff --git a/package/linux-headers/5.15.203 b/package/linux-headers/5.15.204
similarity index 100%
rename from package/linux-headers/5.15.203
rename to package/linux-headers/5.15.204
diff --git a/package/linux-headers/6.1.169 b/package/linux-headers/6.1.170
similarity index 100%
rename from package/linux-headers/6.1.169
rename to package/linux-headers/6.1.170
diff --git a/package/linux-headers/6.12.84 b/package/linux-headers/6.12.85
similarity index 100%
rename from package/linux-headers/6.12.84
rename to package/linux-headers/6.12.85
diff --git a/package/linux-headers/6.18.25 b/package/linux-headers/6.18.26
similarity index 100%
rename from package/linux-headers/6.18.25
rename to package/linux-headers/6.18.26
diff --git a/package/linux-headers/6.6.136 b/package/linux-headers/6.6.137
similarity index 100%
rename from package/linux-headers/6.6.136
rename to package/linux-headers/6.6.137
diff --git a/package/linux-headers/7.0.2 b/package/linux-headers/7.0.3
similarity index 100%
rename from package/linux-headers/7.0.2
rename to package/linux-headers/7.0.3
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c34dd4a7df..709028ca8e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.253"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.203"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.169"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.136"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.84"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.25"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.2"		if BR2_KERNEL_HEADERS_7_0
+	default "5.10.254"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.204"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.170"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.137"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.85"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.26"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.3"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
