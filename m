Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE8BC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 11:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08322606EA;
	Fri,  7 Aug 2026 11:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TraX9yHvUU0n; Fri,  7 Aug 2026 11:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 125D2608D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786102058;
	bh=aytfyY87Q9SPR4emXl0luDRfWMuD0CM9kyjivVGRvg0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GXqmavYSkRpXi7o2xUNGaaA4GqvPMMrzP/vX1XCrvc3aCK8iEDMbcVZ4WIU6ZJpWv
	 EmMD/C+IcvSWTQdqzVAMxhgAhxMRgjJ9SShcdjk4kpfmAUhiq5cKIG6DKj7A+s8o4d
	 SQBCBzKy6UsznRPzy0PovrtzbuDOoHkCcibY6C8u93CR/dj5xopKcSrRH7Q1KcfV6+
	 TZr+hFL/pF26SBiqme1eXXXTG/j+NnYkp9gPwf5qA3yVP5J4eD0vdWwUveSGQl/zp5
	 T+d4aEq/UwEHGngdLiSFkWmen0ny6PkeB/HdjmEiIr/ViTPZrAIDuqDszU/ur+Zghs
	 WlRwaJ3kvnc4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 125D2608D4;
	Fri,  7 Aug 2026 11:27:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6601610E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57DC640092
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5BURAYxMqgP for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 11:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A47B40105
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A47B40105
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 11:27:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE3C08CA4D; Fri,  7 Aug 2026 11:26:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 12:37:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f5eb8f8f3d150c018423a27fb17bdf8d0b46311
X-Git-Newrev: 3fc6765289dc98f2ff1ca2e4cd566c72dbe7ab10
X-Patchwork-Hint: ignore
Message-Id: <20260807112647.EE3C08CA4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 7.1.x, 6.18.x,
 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3fc6765289dc98f2ff1ca2e4cd566c72dbe7ab10
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.1.6 -> 7.1.7
 - 6.18.42 -> 6.18.43
 - 6.12.101 -> 6.12.102
 - 6.6.148 -> 6.6.149
 - 6.1.180 -> 6.1.181
 - 5.15.213 -> 5.15.214
 - 5.10.262 -> 5.10.263

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.1.6 => 7.1.7}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.262 => 5.10.263} |  0
 package/linux-headers/{5.15.213 => 5.15.214} |  0
 package/linux-headers/{6.1.180 => 6.1.181}   |  0
 package/linux-headers/{6.12.101 => 6.12.102} |  0
 package/linux-headers/{6.18.42 => 6.18.43}   |  0
 package/linux-headers/{6.6.148 => 6.6.149}   |  0
 package/linux-headers/{7.1.6 => 7.1.7}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.6 b/linux/7.1.7
similarity index 100%
rename from linux/7.1.6
rename to linux/7.1.7
diff --git a/linux/Config.in b/linux/Config.in
index 64858a6196..a5270857f6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 779def28d0..34d3be41d6 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
-sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
-sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
+sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
+sha256  a7ef7a894d6c5111eb5281167819a76bf08914edacd953e7704de045b73ac3d0  linux-6.6.149.tar.xz
+sha256  d9b94ba489852aceb676c6f9e54502766a4e8363d9da114e6213bc0b6fb18908  linux-6.1.181.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
-sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
+sha256  61d2c47f4b7148ce101cb257b8dfde301c2df5c64b4b53eb2e038a2fa709e541  linux-5.15.214.tar.xz
+sha256  c93338f367aab6c746bff8a05bca82665702065493127e204be4a96d4e4c7da6  linux-5.10.263.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 8072305f0b..f527761764 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  995dd7188d924662b94b48fd6fb783587267590e5b8bb33dade2c771e7d855c1  linux-7.1.6.tar.xz
+sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
+sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.262 b/package/linux-headers/5.10.263
similarity index 100%
rename from package/linux-headers/5.10.262
rename to package/linux-headers/5.10.263
diff --git a/package/linux-headers/5.15.213 b/package/linux-headers/5.15.214
similarity index 100%
rename from package/linux-headers/5.15.213
rename to package/linux-headers/5.15.214
diff --git a/package/linux-headers/6.1.180 b/package/linux-headers/6.1.181
similarity index 100%
rename from package/linux-headers/6.1.180
rename to package/linux-headers/6.1.181
diff --git a/package/linux-headers/6.12.101 b/package/linux-headers/6.12.102
similarity index 100%
rename from package/linux-headers/6.12.101
rename to package/linux-headers/6.12.102
diff --git a/package/linux-headers/6.18.42 b/package/linux-headers/6.18.43
similarity index 100%
rename from package/linux-headers/6.18.42
rename to package/linux-headers/6.18.43
diff --git a/package/linux-headers/6.6.148 b/package/linux-headers/6.6.149
similarity index 100%
rename from package/linux-headers/6.6.148
rename to package/linux-headers/6.6.149
diff --git a/package/linux-headers/7.1.6 b/package/linux-headers/7.1.7
similarity index 100%
rename from package/linux-headers/7.1.6
rename to package/linux-headers/7.1.7
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 563138a7f5..8f4cd3b283 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.6"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.263"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.214"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.181"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.149"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
