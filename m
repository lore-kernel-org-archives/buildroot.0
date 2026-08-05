Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411CEC5AC7C
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 177C18085D;
	Fri,  7 Aug 2026 09:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ff3F8j8Sk_A7; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 008C68085A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095331;
	bh=lxOtIxP/mX5/er1Of3plXpK48zI3bR2n13EbQygPHFk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WkGK+QYHs06vnQ2fjcKbUV9iaag7ZgyVO9uGHnoGfRkIXwxzTIq/TcVh/zbk8HF8p
	 QtN+uRzFNgjTry5grBxu8s9lC3g+gGEnIHaSp1HZXAxaGp8MQUUK19Ngdu/MZcy4vr
	 8QHv+RRWxaLp1Ex62qpysw3TyYJ1zA4mYpTA/N8kDxqyKDwk5dCnKMdAeH6aIL8B5V
	 JVl2WOd9l4iMwaCmUtE242oGiCxcmsP8HsOkSPaCkBrL8sCpDPgpWo1oMuVDMxgxfb
	 Tgw9sls11GB6gYUPhzCXnHWOo9X7i5+jgAbFEx4lNUWgaN5tSk7HMNbwlFvcZNsIM+
	 0c8YSbwQXHgeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 008C68085A;
	Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 37A10282
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31D02807F2
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IqAYViReosur for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5550F8031E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5550F8031E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D07AF8CA3F; Fri,  7 Aug 2026 09:34:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Aug 2026 12:29:58 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: badd48864ae0ad335856a4f4a62a72f229302ddf
X-Git-Newrev: bcb82b7fee2291366ebd6fb05ee7ea82dd3fda40
X-Patchwork-Hint: ignore
Message-Id: <20260807093441.D07AF8CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12, 18}, 7.0 series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcb82b7fee2291366ebd6fb05ee7ea82dd3fda40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.258 -> 5.10.262
    - 5.15.209 -> 5.15.213
    - 6.1.175 -> 6.1.180
    - 6.6.142 -> 6.6.148
    - 6.12.92 -> 6.12.101
    - 6.18.34 -> 6.18.42
    - 7.0.11 -> 7.0.14

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.258 => 5.10.262} |  0
 package/linux-headers/{5.15.209 => 5.15.213} |  0
 package/linux-headers/{6.1.175 => 6.1.180}   |  0
 package/linux-headers/{6.12.92 => 6.12.101}  |  0
 package/linux-headers/{6.18.34 => 6.18.42}   |  0
 package/linux-headers/{6.6.142 => 6.6.148}   |  0
 package/linux-headers/{7.0.11 => 7.0.14}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 11 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1f91979d44..fa808eff95 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.14" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 93c36c9156..779def28d0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fe376b7db3cac4456b38291bee4faa7091cb8befaa6f9870314f5d1282f9e3e  linux-6.12.92.tar.xz
-sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
-sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
+sha256  0d21cd11933f49f7151b7c9dbb8cc3fddc8c8abe506434b850feecf41fc28a76  linux-6.12.101.tar.xz
+sha256  b674994b5760eb1c493711cfdc3aefb97583dfe04bb7977b4c8e7aae0710f75e  linux-6.6.148.tar.xz
+sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  346d77c7eac2cd8d719a2530b4f858bf99bc956b25f80995fd214f8aef821eb4  linux-5.15.209.tar.xz
-sha256  9e7ccb1efc5796e6f8398b778a8b25f7e227e7c54ef5caf6377b8c37d66fb4e5  linux-5.10.258.tar.xz
+sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
+sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03ed2d7876..e29ffb04e2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  e56c8356dda01136a6041c6ef832bd0ec99bd2d35dff97832aa5ec10ed014304  linux-7.0.11.tar.xz
+sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  640c4732fb42842166db97e032c1fe7e5ff72c85a8982c75b40f74be3555d760  linux-6.18.34.tar.xz
+sha256  35a8ef5e8fb44467e56a42b40c23c4c10a61d1e95ff8d738f285230e8bed63e7  linux-6.18.42.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.258 b/package/linux-headers/5.10.262
similarity index 100%
rename from package/linux-headers/5.10.258
rename to package/linux-headers/5.10.262
diff --git a/package/linux-headers/5.15.209 b/package/linux-headers/5.15.213
similarity index 100%
rename from package/linux-headers/5.15.209
rename to package/linux-headers/5.15.213
diff --git a/package/linux-headers/6.1.175 b/package/linux-headers/6.1.180
similarity index 100%
rename from package/linux-headers/6.1.175
rename to package/linux-headers/6.1.180
diff --git a/package/linux-headers/6.12.92 b/package/linux-headers/6.12.101
similarity index 100%
rename from package/linux-headers/6.12.92
rename to package/linux-headers/6.12.101
diff --git a/package/linux-headers/6.18.34 b/package/linux-headers/6.18.42
similarity index 100%
rename from package/linux-headers/6.18.34
rename to package/linux-headers/6.18.42
diff --git a/package/linux-headers/6.6.142 b/package/linux-headers/6.6.148
similarity index 100%
rename from package/linux-headers/6.6.142
rename to package/linux-headers/6.6.148
diff --git a/package/linux-headers/7.0.11 b/package/linux-headers/7.0.14
similarity index 100%
rename from package/linux-headers/7.0.11
rename to package/linux-headers/7.0.14
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c00e2508b..7599a7ad93 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,13 +468,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.258"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.92"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.34"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.11"	if BR2_KERNEL_HEADERS_7_0
+	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.148"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.101"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.42"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
