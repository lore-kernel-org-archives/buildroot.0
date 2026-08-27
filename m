Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8050C61DC7
	for <buildroot@archiver.kernel.org>; Thu, 27 Aug 2026 21:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0531E60840;
	Thu, 27 Aug 2026 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31_g2S8rIEOx; Thu, 27 Aug 2026 21:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787864935;
	bh=e/pe/gUA0CHOGAwwICwLkiipiOSb1B9jmL8dHZNxTpk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dzAlxxwnxekAwRcU8Jx0/4+elguJBiBV9NECAlZSu5ugbKe6GnrFECrdJCSTdzBoi
	 o6XxkvJOZQ23qXdqJ9VvaeeaokG3LZ87KLbov/hIPiHr/NB8QwypV3QDcoEIzDacuH
	 944clAJgOKSl4yX4A8U1MwW8UdFajydmXPR5BccTsVMZalqGHjNFza1lQVKdtjlER5
	 Nb95jhoeZdec4hhUv7hnroRmUj0WwHROedvtXw3ZRIqGZLreT24o9ZGNlvfyQLvL77
	 iSpE1vg06CLmetjTzue45YKY6Qq42tQch57abb5HKo2n6nBq4gThVaagsa/gdmAVS0
	 Cw7Zp8v+D3mGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E74006084B;
	Thu, 27 Aug 2026 21:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B140D26
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D1E4607A0
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8r5UhscQso9I for <buildroot@buildroot.org>;
 Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29F52607E6
 for <buildroot@buildroot.org>; Thu, 27 Aug 2026 21:08:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71F8E92160; Thu, 27 Aug 2026 21:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Aug 2026 22:50:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6eaa34ecdf85a604fd813495bedbbf18648b54df
X-Git-Newrev: e1ba84b9a7b75edfde4872d2b85684605c79bb97
X-Patchwork-Hint: ignore
Message-Id: <20260827210749.71F8E92160@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e1ba84b9a7b75edfde4872d2b85684605c79bb97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.105 -> 6.12.106
 - 6.6.153 -> 6.6.154
 - 6.1.184 -> 6.1.185
 - 5.15.217 -> 5.15.218
 - 5.10.266 -> 5.10.267
 - 7.1.10 -> 7.1.11
 - 6.18.46 -> 6.18.47

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.10 => 7.1.11}                     |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.266 => 5.10.267} |  0
 package/linux-headers/{5.15.217 => 5.15.218} |  0
 package/linux-headers/{6.1.184 => 6.1.185}   |  0
 package/linux-headers/{6.12.105 => 6.12.106} |  0
 package/linux-headers/{6.18.46 => 6.18.47}   |  0
 package/linux-headers/{6.6.153 => 6.6.154}   |  0
 package/linux-headers/{7.1.10 => 7.1.11}     |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.10 b/linux/7.1.11
similarity index 100%
rename from linux/7.1.10
rename to linux/7.1.11
diff --git a/linux/Config.in b/linux/Config.in
index e7b4ef473e..f18b74dbff 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 06ba1b17ed..73dac876e8 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  eb36801e119529b13513c3459dc20e2a32f7053629f3aabb63ea501a4d88f63d  linux-6.12.105.tar.xz
-sha256  39bc77068923520dee396766361e3728a22cf3e69eff389f494285bf91c99557  linux-6.6.153.tar.xz
-sha256  960976085b6054856fa0befeac42810169b9adc15f02ab6a9caeb24dbb6f4cb9  linux-6.1.184.tar.xz
+sha256  0392555761d99c7604503f6178951e2df77e978b92cc96d11e248423e48ed785  linux-6.12.106.tar.xz
+sha256  edee00f83db050239fc1186535e1037782a5025001381f1353d0d3d741ed0234  linux-6.6.154.tar.xz
+sha256  3864d9a1137dc626497757c7406a6d865456fd8956c80795ff3aa46c7f1a2674  linux-6.1.185.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  e320fd344fbde45a5d94e345df93c10eeb8beb7cf2aae7a378a50d99b673a5e5  linux-5.15.217.tar.xz
-sha256  940ea3be9390a46f7070798acbe613e0f047307a0f25d8fd227af8599df23afe  linux-5.10.266.tar.xz
+sha256  c3801bd134f3e9eeb77e370983d42126ac1a1d75039e985f928818dd6b8df236  linux-5.15.218.tar.xz
+sha256  5b440750ac42c88abc06c26f5d47d2c839164ead382387df07654517c67cb106  linux-5.10.267.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 612570d040..421cd7831b 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  67d2f4697a02f3bec98e744b1bdc307e920c24bb4e88b5ee97dc9a34e9aa9999  linux-7.1.10.tar.xz
+sha256  3029540d8f2ec75bee5cbdb7c2a0daa60bffa1d105c82ecb99b53432f6351afc  linux-7.1.11.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f5d44b93808b02cc2969c5404ba081d97523719c9fd2ba2de6db318b4141cca0  linux-6.18.46.tar.xz
+sha256  1b3fbafd43601a5473107cf8172a2b66f42994119089d7aee078e4bca3dee818  linux-6.18.47.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.266 b/package/linux-headers/5.10.267
similarity index 100%
rename from package/linux-headers/5.10.266
rename to package/linux-headers/5.10.267
diff --git a/package/linux-headers/5.15.217 b/package/linux-headers/5.15.218
similarity index 100%
rename from package/linux-headers/5.15.217
rename to package/linux-headers/5.15.218
diff --git a/package/linux-headers/6.1.184 b/package/linux-headers/6.1.185
similarity index 100%
rename from package/linux-headers/6.1.184
rename to package/linux-headers/6.1.185
diff --git a/package/linux-headers/6.12.105 b/package/linux-headers/6.12.106
similarity index 100%
rename from package/linux-headers/6.12.105
rename to package/linux-headers/6.12.106
diff --git a/package/linux-headers/6.18.46 b/package/linux-headers/6.18.47
similarity index 100%
rename from package/linux-headers/6.18.46
rename to package/linux-headers/6.18.47
diff --git a/package/linux-headers/6.6.153 b/package/linux-headers/6.6.154
similarity index 100%
rename from package/linux-headers/6.6.153
rename to package/linux-headers/6.6.154
diff --git a/package/linux-headers/7.1.10 b/package/linux-headers/7.1.11
similarity index 100%
rename from package/linux-headers/7.1.10
rename to package/linux-headers/7.1.11
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index c7501decb7..25d61f6a9d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.266"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.217"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.184"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.153"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.105"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.46"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.10"	if BR2_KERNEL_HEADERS_7_1
+	default "5.10.267"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.218"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.185"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.154"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.106"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.47"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.11"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
