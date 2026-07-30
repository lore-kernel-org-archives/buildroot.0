Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFF9C5516D
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 21:07:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7713740B76;
	Thu, 30 Jul 2026 21:07:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GRuvf6aKJw33; Thu, 30 Jul 2026 21:07:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 301A740D9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785445641;
	bh=8fy8vs7M8bwT9KMNGpUzqrsvGNZ20MvhYK2QEBzqbNI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d+QCC6UZqFiZprJKa+X3LF4Ar+Y7d3Ob/o5pkfg9aWCyhIcqp5dfwE6WcDNFxgL+Y
	 1xUpjj4K/p3sJl/D2HonIozccjsNE34PfjfU7dEI7fmgZUujcM1/ZtsLOPtI7+UJNi
	 u7SLD5sdD92sGMKpt0x1htEY+j4XyaYa0ofwPVfpnqKuuBgE7E56wKdkRmxj17ocCP
	 DrI0yQ8KOaAQj3H9GDg6CZGPrwG1MhHQ4ZsJ640qCatEEqE1u47dGm3txfusPaxj48
	 HbQ423rajgpjJmC1Zt6AwhK76lK+sZFr8fp4mhlcMTxEzQ0VKOHpqxMZCqi0uUh6hk
	 S/MZ+l++mWeQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 301A740D9B;
	Thu, 30 Jul 2026 21:07:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2805569
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19E534008B
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SPOLbSkCphYd for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 21:07:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D695840086
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D695840086
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 21:07:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B9198B682; Thu, 30 Jul 2026 21:06:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Jul 2026 23:03:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a568d33d23d11dc48665bc6531a019ca2c2d4108
X-Git-Newrev: 4140720904763fac42863708acb6be355a23e663
X-Patchwork-Hint: ignore
Message-Id: <20260730210635.0B9198B682@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 6.1.x, 5.15.x, 5.10.x, 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4140720904763fac42863708acb6be355a23e663
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:

 - 6.18.40 -> 6.18.41
 - 6.12.99 -> 6.12.100
 - 6.6.146 -> 6.6.147
 - 6.1.179 -> 6.1.180
 - 5.15.212 -> 5.15.213
 - 5.10.261 -> 5.10.262

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.261 => 5.10.262} |  0
 package/linux-headers/{5.15.212 => 5.15.213} |  0
 package/linux-headers/{6.1.179 => 6.1.180}   |  0
 package/linux-headers/{6.12.99 => 6.12.100}  |  0
 package/linux-headers/{6.18.40 => 6.18.41}   |  0
 package/linux-headers/{6.6.146 => 6.6.147}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 92f0ad8550..f86991284b 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6a477222c132033381cda981eb0127f29fbcbba17e820283bc21290f8e408629  linux-6.12.99.tar.xz
-sha256  62e6c1e456202b57b048071593e890f9e8f50fb50fe0df64f8bfbf65f360140e  linux-6.6.146.tar.xz
-sha256  dd4a164b6ffdcac6b1d958eb14bee256b10819557ee58ac5c9f6a1ae33380126  linux-6.1.179.tar.xz
+sha256  67f973533406492e86774bacbcefae50d50d5c34cbf703c47ec526a5efdcee90  linux-6.12.100.tar.xz
+sha256  e76329b7ee046883d55a1868253cffe67c526a6da6140ebecd3cd6ac44db4abb  linux-6.6.147.tar.xz
+sha256  4f0e601759b55cfc4d0bf4990859b93bc74fb915cde532284f0765b77ca0f86a  linux-6.1.180.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c396aeebc90c7aecb7f7abdf504c19b372c9926eb0cf0e91f9f09d7d870b65fe  linux-5.15.212.tar.xz
-sha256  a19ca1100640a5fd3b452eb15fe9de32f8deb4ab1866dd7db52183b1a2fad7c4  linux-5.10.261.tar.xz
+sha256  c4721b4b8535f3e418ee579c70645fbfd5ddfba4943c31b919e8c9522371e1d8  linux-5.15.213.tar.xz
+sha256  fae7da8a9b97e5386f0a3dc3c5c8a88be17fcf2d0792a58a5a0c5b4f5775b483  linux-5.10.262.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index ff4982267e..c8be87c361 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7  linux-7.1.5.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3712fc1ec839e4daac981176c8518912e8f452650aaedfe4381da4419613a431  linux-6.18.40.tar.xz
+sha256  17fc72f0f8d4a8a8633a5d20085f5d9c5a5ec51ee896a0b7ae1ec25da31273ea  linux-6.18.41.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.261 b/package/linux-headers/5.10.262
similarity index 100%
rename from package/linux-headers/5.10.261
rename to package/linux-headers/5.10.262
diff --git a/package/linux-headers/5.15.212 b/package/linux-headers/5.15.213
similarity index 100%
rename from package/linux-headers/5.15.212
rename to package/linux-headers/5.15.213
diff --git a/package/linux-headers/6.1.179 b/package/linux-headers/6.1.180
similarity index 100%
rename from package/linux-headers/6.1.179
rename to package/linux-headers/6.1.180
diff --git a/package/linux-headers/6.12.99 b/package/linux-headers/6.12.100
similarity index 100%
rename from package/linux-headers/6.12.99
rename to package/linux-headers/6.12.100
diff --git a/package/linux-headers/6.18.40 b/package/linux-headers/6.18.41
similarity index 100%
rename from package/linux-headers/6.18.40
rename to package/linux-headers/6.18.41
diff --git a/package/linux-headers/6.6.146 b/package/linux-headers/6.6.147
similarity index 100%
rename from package/linux-headers/6.6.146
rename to package/linux-headers/6.6.147
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 250fb083ab..faa31b5733 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,12 +472,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.261"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.212"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.179"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.146"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.99"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.40"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.262"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.213"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.180"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.147"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.100"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.41"	if BR2_KERNEL_HEADERS_6_18
 	default "7.1.5"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
