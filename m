Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B8AC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A57338123E;
	Fri, 21 Aug 2026 15:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1jTN5bUwwm2; Fri, 21 Aug 2026 15:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325076;
	bh=+h38oijnoamI6D5RGIy4OB183R5q6dswFig6hG4FvKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MzGbBUaK2jdqcHyf7VwPl/v1ubFrtilFQrPb1IQ0hRpjZOBPzpaYkgGtLV7FdJo9p
	 NduV1A65s/eXAANFYpq2TlDDZnTID+6LW3rpoe0jrJsTCC1hG0uGXJN7EyAWbn6SBW
	 Kr6C99WcfvSV1NkJFyRbI+TeoKWnewjzkSLdApHObBATa47ZxV0mWstMKEDPhAsR8O
	 H6XxStr66s9irkwGEUhXvyFQA86JjSRYhoVUo9uNVWDylY8D1Y9y1k4paCtUtREnIu
	 lmdy+SojshYxBWzlsR7f3aQ7zksz1mwE7wAqQnWlcx2OGzbwuKMgGgAAeuCzSaO1Eq
	 WYj/WaXLu/Enw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44DA781206;
	Fri, 21 Aug 2026 15:11:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 213B4EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1246A40A1E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5U9yfvJDYDO for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C52D40A15
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B04888E1C7; Fri, 21 Aug 2026 15:10:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 10:43:38 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1cd4f33690b3b3602d38f4a545dffcab7695b62d
X-Git-Newrev: 78e2f9a4dd7d02a3e9bdd4ce4d159cf5aa5856f4
X-Patchwork-Hint: ignore
Message-Id: <20260821151015.B04888E1C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12, 18} series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/78e2f9a4dd7d02a3e9bdd4ce4d159cf5aa5856f4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.264 -> 5.10.265
    - 5.15.215 -> 5.15.216
    - 6.1.182 -> 6.1.183
    - 6.6.151 -> 6.6.152
    - 6.12.103 -> 6.12.104
    - 6.18.44 -> 6.18.45

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.264 => 5.10.265} |  0
 package/linux-headers/{5.15.215 => 5.15.216} |  0
 package/linux-headers/{6.1.182 => 6.1.183}   |  0
 package/linux-headers/{6.12.103 => 6.12.104} |  0
 package/linux-headers/{6.18.44 => 6.18.45}   |  0
 package/linux-headers/{6.6.151 => 6.6.152}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index c1e447e255..054188c45a 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f143aaade8877ba5616e788b4482576db28481bcf557ef537f4fcc3938fc3176  linux-6.12.103.tar.xz
-sha256  de01e5ae73412b70bceb41a6f97da6d0f29b6536f1f00f8b6a6fd40c729969f7  linux-6.6.151.tar.xz
-sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
+sha256  949d166a1263bd0cf0c5aab44eeb57869615099e7c48bf88d0e4adb77379b999  linux-6.12.104.tar.xz
+sha256  778b058c63da849d0b74006b23509255b2bed57c62a5151e9dd7a62e2cdd70d6  linux-6.6.152.tar.xz
+sha256  362d07fe4938c415ce651aefee063a5c4151109b39c97be039bbaa8312ffc0e2  linux-6.1.183.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
-sha256  f27552ec32783512c81918c3b8f155fed8dbaf8a90a5a20afdc01aac715b489e  linux-5.10.264.tar.xz
+sha256  09affb2005aea3f44eec3f3eab4c1944e00707355ea7ca7fa2ba6b34a82605ed  linux-5.15.216.tar.xz
+sha256  d10cb9169e49da3d5f7154a01e450012486565fa9442e23d660b0581a3f92645  linux-5.10.265.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index c93eb3a376..f41d18e67d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0f72d938f06828e82c90405174fe572287db7bfe089e2fc46572a99a7f240d43  linux-6.18.44.tar.xz
+sha256  30fa4a56579ca614ac125a12614f7f6466f87ab1278aef7b951dd74156deab33  linux-6.18.45.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.264 b/package/linux-headers/5.10.265
similarity index 100%
rename from package/linux-headers/5.10.264
rename to package/linux-headers/5.10.265
diff --git a/package/linux-headers/5.15.215 b/package/linux-headers/5.15.216
similarity index 100%
rename from package/linux-headers/5.15.215
rename to package/linux-headers/5.15.216
diff --git a/package/linux-headers/6.1.182 b/package/linux-headers/6.1.183
similarity index 100%
rename from package/linux-headers/6.1.182
rename to package/linux-headers/6.1.183
diff --git a/package/linux-headers/6.12.103 b/package/linux-headers/6.12.104
similarity index 100%
rename from package/linux-headers/6.12.103
rename to package/linux-headers/6.12.104
diff --git a/package/linux-headers/6.18.44 b/package/linux-headers/6.18.45
similarity index 100%
rename from package/linux-headers/6.18.44
rename to package/linux-headers/6.18.45
diff --git a/package/linux-headers/6.6.151 b/package/linux-headers/6.6.152
similarity index 100%
rename from package/linux-headers/6.6.151
rename to package/linux-headers/6.6.152
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 533812d3c9..d90228db5c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,12 +468,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.265"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.216"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.183"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.152"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.104"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.45"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
