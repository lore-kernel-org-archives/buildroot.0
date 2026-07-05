Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75142C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 08:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E5880FD8;
	Sun,  5 Jul 2026 08:35:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hZGSsPLw4Rr; Sun,  5 Jul 2026 08:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12BFB80FF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783240527;
	bh=JC8A8dC6Rr9jIbtrBm7f84S3lfY11uXwgrKIQzwVQMA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fjNFUlbc0RbmeR+gxDkKv4xSDZ6lucXuSM8jY/wL7aMolbwdFYIPqXL2SJ7XOxAPu
	 6QVyrGRm2hUIm7GGFYVZdLflBuTOkOXykDAKiDPxURDkI71NU+Pcpt9Cj0mAOqRkTE
	 ATF3pvbV16fJR2N042ydqnH5gQjH+EQgkiuntXxZQJOCinNH9o24VZvOmgrTNRhVaS
	 X1Bgt0vM2wUycU2AGHEhXwbJ0Hv26+6a8yCa/aHiWSM8v0E69arWpXDyS9URoMU9oy
	 X94AdTNXhBewZsW2dw2+YQvxEJCU7iBg4NVY5L9fOFRswIZJrCWMiaIRo8O8r19z1/
	 aZZEXuf2a3G7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12BFB80FF2;
	Sun,  5 Jul 2026 08:35:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DAAC5316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFF2B4022F
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-Rras16pKVE for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 08:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9C4F401B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9C4F401B1
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9A75B88461; Sun,  5 Jul 2026 08:34:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 10:17:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85a98f81488914ddbdb2be56c7f44a6c37c6a513
X-Git-Newrev: 4b2e2bdd9bf982b64703097954bd9be33dbf4fc8
X-Patchwork-Hint: ignore
Message-Id: <20260705083454.9A75B88461@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 7.1.x, 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4b2e2bdd9bf982b64703097954bd9be33dbf4fc8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.1.2 -> 7.1.3
 - 6.18.37 -> 6.18.38
 - 6.12.94 -> 6.12.95
 - 6.6.143 -> 6.6.144
 - 6.1.176 -> 6.1.177
 - 5.15.210 -> 5.15.211
 - 5.10.259 -> 5.10.260

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.2 => 7.1.3}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.259 => 5.10.260} |  0
 package/linux-headers/{5.15.210 => 5.15.211} |  0
 package/linux-headers/{6.1.176 => 6.1.177}   |  0
 package/linux-headers/{6.12.94 => 6.12.95}   |  0
 package/linux-headers/{6.18.37 => 6.18.38}   |  0
 package/linux-headers/{6.6.143 => 6.6.144}   |  0
 package/linux-headers/{7.1.2 => 7.1.3}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.2 b/linux/7.1.3
similarity index 100%
rename from linux/7.1.2
rename to linux/7.1.3
diff --git a/linux/Config.in b/linux/Config.in
index 320a2c5574..a82aeb76b2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 688b99ded6..7490651b94 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e998a232b9418db3301cb58468e291a4f41d6ab8306029b30d991f56251dc8d2  linux-6.12.94.tar.xz
-sha256  dace1f8dc9c0dbf5df14f47e3229cd62c298e83049681731ef229f2ba7592932  linux-6.6.143.tar.xz
-sha256  aa19772dba40e9737356c00d0671cdedbe26cc895eff062868f0a1f688ae44f6  linux-6.1.176.tar.xz
+sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  ec19b8307b495078cdc03749e63cb3802ac23cf6122c82eb9719feeb4557ecc3  linux-6.6.144.tar.xz
+sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  910ba46ae15e7495a9624f89d7f11b24ccc8bc1ee4b3abdd502e75b055290a01  linux-5.15.210.tar.xz
-sha256  aa5e8e580a555e55176658b78fb6759f9c84654462b735119d4e819b5c46b609  linux-5.10.259.tar.xz
+sha256  beb954e53617928b751944a89b6670bf9a9c7177c641b24c5dba504e46f1d961  linux-5.15.211.tar.xz
+sha256  47a8297131505b7d38338d39ad8a9d592507d33c695b27b1bbe55f25869a6b84  linux-5.10.260.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2d6ab0f28a..809574b9b1 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  37198c93727be247c9fb5309bb86cd5e496c61e5322cd8c4eca9476bb0b5883f  linux-7.1.2.tar.xz
+sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a83cd200e6646db52866b8309e9137b9e9048b613cbda10ced2b811aae125255  linux-6.18.37.tar.xz
+sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.259 b/package/linux-headers/5.10.260
similarity index 100%
rename from package/linux-headers/5.10.259
rename to package/linux-headers/5.10.260
diff --git a/package/linux-headers/5.15.210 b/package/linux-headers/5.15.211
similarity index 100%
rename from package/linux-headers/5.15.210
rename to package/linux-headers/5.15.211
diff --git a/package/linux-headers/6.1.176 b/package/linux-headers/6.1.177
similarity index 100%
rename from package/linux-headers/6.1.176
rename to package/linux-headers/6.1.177
diff --git a/package/linux-headers/6.12.94 b/package/linux-headers/6.12.95
similarity index 100%
rename from package/linux-headers/6.12.94
rename to package/linux-headers/6.12.95
diff --git a/package/linux-headers/6.18.37 b/package/linux-headers/6.18.38
similarity index 100%
rename from package/linux-headers/6.18.37
rename to package/linux-headers/6.18.38
diff --git a/package/linux-headers/6.6.143 b/package/linux-headers/6.6.144
similarity index 100%
rename from package/linux-headers/6.6.143
rename to package/linux-headers/6.6.144
diff --git a/package/linux-headers/7.1.2 b/package/linux-headers/7.1.3
similarity index 100%
rename from package/linux-headers/7.1.2
rename to package/linux-headers/7.1.3
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d1eb93ce1c..a8171aabef 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.259"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.210"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.176"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.143"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.94"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.37"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.2"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.260"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.211"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.177"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.144"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.95"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.38"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.3"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
