Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB1EE6B58
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 20:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 764B4605CB;
	Fri,  6 Feb 2026 20:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UomSM07gXSdk; Fri,  6 Feb 2026 20:42:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53F4460607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770410543;
	bh=eq4mY58h25yO0kYvMldDgqtOXhrc9qyNzlvPNYz1/lI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXQO//X8DSJSFrWqPKvHFOwib9Cf/FJ3OgcY1tDG9vyww7J2QcxVdbnHJ1/AI+GQN
	 +dybvzD5EinDRma9N17fzlowslF8AClqmeJLeduSMElADOOfQ9LE5fdMar4OR9zBr/
	 0DvzTgcP+uwnwg7j/MKeIKVVoQLABy/zikZhluTUhZ3i8iJJGLxeqDW4Lbj3KYs6pP
	 YXtzdKYxMlaZGLURxz+naMTWZci9RxBlEn4OOpaTm4uGyUrOl5j2ivP9N1CZWK7Z8P
	 g9u58AkqDsmSUn/OuSkXpEOtAhWkoV3nYZXKLnmDe8kjYJQioVRSuFeoXee7fK9S7E
	 OGwW9Sl6k2oOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F4460607;
	Fri,  6 Feb 2026 20:42:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DDF832C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC1828434E
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfM0mysnZ6JB for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 20:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6D878434C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6D878434C
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 20:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3B7186AD0; Fri,  6 Feb 2026 20:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 21:33:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20d5e36fe86322fa93b285bbe2c658f163368423
X-Git-Newrev: 48186093fd355ede91151b2342e222cef303a6ca
X-Patchwork-Hint: ignore
Message-Id: <20260206204220.A3B7186AD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 18}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48186093fd355ede91151b2342e222cef303a6ca
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  2 +-
 package/linux-headers/Config.in.host | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ac5e6298aa..a253f2ee5b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 4d5850641f..90e2bf73cb 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d367c7504bd4da520dd01eb08125d2d0ac088bc8af4cd56d236f2074dd4225b7  linux-6.12.68.tar.xz
-sha256  d48e0d9de04bef2fb9740bdb0124548bcab8867cdca00ff9712c110282b299d6  linux-6.6.122.tar.xz
-sha256  b41666bda7223600386a07ebe1802f5029da2fe81f6a85d691b6ec6a707e5a29  linux-6.1.161.tar.xz
+sha256  4b493657f218703239c4f22415f027b3644949bf2761abd18b849f0aad5f7665  linux-6.12.69.tar.xz
+sha256  a616d4b5a18a9097e2df8e03dfd2ba366ddfc1321b16d648651dc512b3e945b1  linux-6.6.123.tar.xz
+sha256  9766422a49b9a24ea911ebc0b4e7d1f3d84fba3bc374387ae3c4bc60bec6d089  linux-6.1.162.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  5d4c0994580dd3bbd5ffc5fcb81c22dd305b844c9d8c7b176cc41b28f7e29743  linux-5.15.198.tar.xz
-sha256  b5e6e4f1f904a3377dde32ef3bc322f03a78f045c4d666483d383153902de005  linux-5.10.248.tar.xz
+sha256  01c0d3ae4c138a51891cb54d21374259fd07bfe1076e06362ec0ae0a822fbd2e  linux-5.15.199.tar.xz
+sha256  b990ed34261149542f932e5eaf1ba58535c5d48c147ae36bc2747c65e54d1046  linux-5.10.249.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 4d7f67daeb..f158e49815 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  37f0c5d5c242c1d604e87d48f08795e861a5a85f725b4ca11d0a538f12ff8cff  linux-6.18.8.tar.xz
+sha256  030115ff8fb4cb536d8449dc40ebc3e314e86ba1b316a6ae21091a11cc930578  linux-6.18.9.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8f59dc89e2..7b3efe74b2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,12 +456,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.248"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.198"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.161"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.122"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.68"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.8"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.249"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.199"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.162"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.123"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.69"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.9"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
