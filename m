Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B47EC61DBC
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 08:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587E880B50;
	Tue, 25 Aug 2026 08:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vuPisd74GA0C; Tue, 25 Aug 2026 08:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787646457;
	bh=oT9swZJ62G3AfaZY69hCaoJNAN8JvhVtfSR+IHWih7c=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=etUU4pglhD8WhuY5/IFgHIB6QVdV3CkQ7/Ih+1fL31K9/iqPhswg0l2Xf/iyNblov
	 HIrNiEcoGE2IbHSu9FcSzpw+fi+qLhiSMP/harlfFVL+RiuAyvHB71kqnZPNMChTV3
	 Ew733vgX/ReSKVW7qit64rsp/H0qaAG5argcUHcyFT4HVadA6Hc6ba2vkEVDi59uQz
	 3/r8+upo/AIAEwVPm93jYxh0fFvBy3Hhch4crdcPtCP3hrvJBZ+I+rS9d/xf2Apgi3
	 2PFnlFjyieAhJFALTmXpCvF7cxAWqJK2ZMX+KdaXRrCNec1apM0A66M/PAQ+c7f40K
	 hq5Ykz36WcrMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38ED680B63;
	Tue, 25 Aug 2026 08:27:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13F69279
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062E740068
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMzYzPYrfkfd for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 08:27:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 023FC40064
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 08:27:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8171190393; Tue, 25 Aug 2026 08:26:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 10:23:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e336d3845db1a7ca22c732b0b30d89a9a6ce048
X-Git-Newrev: f4efa90c5f3a8498747ea73578e86924f05225ad
X-Patchwork-Hint: ignore
Message-Id: <20260825082638.8171190393@busybox.osuosl.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f4efa90c5f3a8498747ea73578e86924f05225ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.1.9 -> 7.1.10
 - 6.18.45 -> 6.18.46
 - 6.12.104 -> 6.12.105
 - 6.6.152 -> 6.6.153
 - 6.1.183 -> 6.1.184
 - 5.15.216 -> 5.15.217
 - 5.10.265 -> 5.10.266

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/{7.1.9 => 7.1.10}                      |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.265 => 5.10.266} |  0
 package/linux-headers/{5.15.216 => 5.15.217} |  0
 package/linux-headers/{6.1.183 => 6.1.184}   |  0
 package/linux-headers/{6.12.104 => 6.12.105} |  0
 package/linux-headers/{6.18.45 => 6.18.46}   |  0
 package/linux-headers/{6.6.152 => 6.6.153}   |  0
 package/linux-headers/{7.1.9 => 7.1.10}      |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.9 b/linux/7.1.10
similarity index 100%
rename from linux/7.1.9
rename to linux/7.1.10
diff --git a/linux/Config.in b/linux/Config.in
index 563422e5b5..e7b4ef473e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 054188c45a..06ba1b17ed 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  949d166a1263bd0cf0c5aab44eeb57869615099e7c48bf88d0e4adb77379b999  linux-6.12.104.tar.xz
-sha256  778b058c63da849d0b74006b23509255b2bed57c62a5151e9dd7a62e2cdd70d6  linux-6.6.152.tar.xz
-sha256  362d07fe4938c415ce651aefee063a5c4151109b39c97be039bbaa8312ffc0e2  linux-6.1.183.tar.xz
+sha256  eb36801e119529b13513c3459dc20e2a32f7053629f3aabb63ea501a4d88f63d  linux-6.12.105.tar.xz
+sha256  39bc77068923520dee396766361e3728a22cf3e69eff389f494285bf91c99557  linux-6.6.153.tar.xz
+sha256  960976085b6054856fa0befeac42810169b9adc15f02ab6a9caeb24dbb6f4cb9  linux-6.1.184.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  09affb2005aea3f44eec3f3eab4c1944e00707355ea7ca7fa2ba6b34a82605ed  linux-5.15.216.tar.xz
-sha256  d10cb9169e49da3d5f7154a01e450012486565fa9442e23d660b0581a3f92645  linux-5.10.265.tar.xz
+sha256  e320fd344fbde45a5d94e345df93c10eeb8beb7cf2aae7a378a50d99b673a5e5  linux-5.15.217.tar.xz
+sha256  940ea3be9390a46f7070798acbe613e0f047307a0f25d8fd227af8599df23afe  linux-5.10.266.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 1bb104612d..612570d040 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  3271a4ae3897b38352980f2b0975bae61bca81c644d186221c5ae928bcc072b0  linux-7.1.9.tar.xz
+sha256  67d2f4697a02f3bec98e744b1bdc307e920c24bb4e88b5ee97dc9a34e9aa9999  linux-7.1.10.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  30fa4a56579ca614ac125a12614f7f6466f87ab1278aef7b951dd74156deab33  linux-6.18.45.tar.xz
+sha256  f5d44b93808b02cc2969c5404ba081d97523719c9fd2ba2de6db318b4141cca0  linux-6.18.46.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.265 b/package/linux-headers/5.10.266
similarity index 100%
rename from package/linux-headers/5.10.265
rename to package/linux-headers/5.10.266
diff --git a/package/linux-headers/5.15.216 b/package/linux-headers/5.15.217
similarity index 100%
rename from package/linux-headers/5.15.216
rename to package/linux-headers/5.15.217
diff --git a/package/linux-headers/6.1.183 b/package/linux-headers/6.1.184
similarity index 100%
rename from package/linux-headers/6.1.183
rename to package/linux-headers/6.1.184
diff --git a/package/linux-headers/6.12.104 b/package/linux-headers/6.12.105
similarity index 100%
rename from package/linux-headers/6.12.104
rename to package/linux-headers/6.12.105
diff --git a/package/linux-headers/6.18.45 b/package/linux-headers/6.18.46
similarity index 100%
rename from package/linux-headers/6.18.45
rename to package/linux-headers/6.18.46
diff --git a/package/linux-headers/6.6.152 b/package/linux-headers/6.6.153
similarity index 100%
rename from package/linux-headers/6.6.152
rename to package/linux-headers/6.6.153
diff --git a/package/linux-headers/7.1.9 b/package/linux-headers/7.1.10
similarity index 100%
rename from package/linux-headers/7.1.9
rename to package/linux-headers/7.1.10
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a16ffdedef..c7501decb7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.265"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.216"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.183"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.152"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.104"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.45"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.9"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.266"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.217"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.184"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.153"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.105"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.46"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.10"	if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
