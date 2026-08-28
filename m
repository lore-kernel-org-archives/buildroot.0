Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB61DC61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7824381112;
	Fri, 28 Aug 2026 14:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bp1vBkjmb1YX; Fri, 28 Aug 2026 14:26:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927182;
	bh=2niKxz08wH5jJwpUaIq/8lrETeTlf/qJluOHuobAUqY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dPF9S2a1IaB4E2kRZVD3joAl9PGp9K9oXj3/ovlEFxW9gxak0ghCAoW8CzKBf8C/1
	 bIobv5FLbheP+A4o3MDzwBVkJevbKKf+TsHomh/EAdSY5zKClsDdV9ncyaqP/JIqmB
	 2qzyfyrgt7OV7iH4KCrfoIDGSGO/LnZAHWHHoeRQ12wHWkfAi79LfLWcV1mZpj5uo6
	 bhlmZiA+RHo2aEB1F1AwMc9711Lmh+S6AKjIdNlvLxvGYpbvqDAOn/9UQm1TT4lhFr
	 8XIOs+67N2mryIH2hpzKP4rFPFZ+8Pe8wLFReOo5pf9pVsQTroczo5NAis2ikwMUvR
	 uQM1saWawBZ/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02D3811BF;
	Fri, 28 Aug 2026 14:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C00B1127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A44096072E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhVq7gYnF2Mj for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECF6460825
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB63A921FA; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:05 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 4e62f3cb9df21da3da3ec78de9343756f1af5212
X-Git-Newrev: 458f2bf01bdd574f32bfed9510d323d4be20bbc1
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.EB63A921FA@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/458f2bf01bdd574f32bfed9510d323d4be20bbc1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Update the latest kernel releases:
    - 5.10.265 -> 5.10.267
    - 5.15.216 -> 5.15.218
    - 6.1.183 -> 6.1.185
    - 6.6.152 -> 6.6.154
    - 6.12.104 -> 6.12.106
    - 6.18.45 -> 6.18.47

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  2 +-
 package/linux-headers/{5.10.265 => 5.10.267} |  0
 package/linux-headers/{5.15.216 => 5.15.218} |  0
 package/linux-headers/{6.1.183 => 6.1.185}   |  0
 package/linux-headers/{6.12.104 => 6.12.106} |  0
 package/linux-headers/{6.18.45 => 6.18.47}   |  0
 package/linux-headers/{6.6.152 => 6.6.154}   |  0
 package/linux-headers/Config.in.host         | 12 ++++++------
 9 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 054188c45a..73dac876e8 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  949d166a1263bd0cf0c5aab44eeb57869615099e7c48bf88d0e4adb77379b999  linux-6.12.104.tar.xz
-sha256  778b058c63da849d0b74006b23509255b2bed57c62a5151e9dd7a62e2cdd70d6  linux-6.6.152.tar.xz
-sha256  362d07fe4938c415ce651aefee063a5c4151109b39c97be039bbaa8312ffc0e2  linux-6.1.183.tar.xz
+sha256  0392555761d99c7604503f6178951e2df77e978b92cc96d11e248423e48ed785  linux-6.12.106.tar.xz
+sha256  edee00f83db050239fc1186535e1037782a5025001381f1353d0d3d741ed0234  linux-6.6.154.tar.xz
+sha256  3864d9a1137dc626497757c7406a6d865456fd8956c80795ff3aa46c7f1a2674  linux-6.1.185.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  09affb2005aea3f44eec3f3eab4c1944e00707355ea7ca7fa2ba6b34a82605ed  linux-5.15.216.tar.xz
-sha256  d10cb9169e49da3d5f7154a01e450012486565fa9442e23d660b0581a3f92645  linux-5.10.265.tar.xz
+sha256  c3801bd134f3e9eeb77e370983d42126ac1a1d75039e985f928818dd6b8df236  linux-5.15.218.tar.xz
+sha256  5b440750ac42c88abc06c26f5d47d2c839164ead382387df07654517c67cb106  linux-5.10.267.tar.xz
 # Locally computed
 sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
 sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f41d18e67d..5ca64bcdb6 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -2,7 +2,7 @@
 sha256  de9999b784d2293f00d39c62d8f92a08ab8a54bc4e80ffd250a0c09cb07a0f98  linux-7.0.14.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  30fa4a56579ca614ac125a12614f7f6466f87ab1278aef7b951dd74156deab33  linux-6.18.45.tar.xz
+sha256  1b3fbafd43601a5473107cf8172a2b66f42994119089d7aee078e4bca3dee818  linux-6.18.47.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/5.10.265 b/package/linux-headers/5.10.267
similarity index 100%
rename from package/linux-headers/5.10.265
rename to package/linux-headers/5.10.267
diff --git a/package/linux-headers/5.15.216 b/package/linux-headers/5.15.218
similarity index 100%
rename from package/linux-headers/5.15.216
rename to package/linux-headers/5.15.218
diff --git a/package/linux-headers/6.1.183 b/package/linux-headers/6.1.185
similarity index 100%
rename from package/linux-headers/6.1.183
rename to package/linux-headers/6.1.185
diff --git a/package/linux-headers/6.12.104 b/package/linux-headers/6.12.106
similarity index 100%
rename from package/linux-headers/6.12.104
rename to package/linux-headers/6.12.106
diff --git a/package/linux-headers/6.18.45 b/package/linux-headers/6.18.47
similarity index 100%
rename from package/linux-headers/6.18.45
rename to package/linux-headers/6.18.47
diff --git a/package/linux-headers/6.6.152 b/package/linux-headers/6.6.154
similarity index 100%
rename from package/linux-headers/6.6.152
rename to package/linux-headers/6.6.154
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d90228db5c..c278d59061 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,12 +468,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.265"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.216"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.183"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.152"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.104"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.45"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.267"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.218"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.185"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.154"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.106"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.47"	if BR2_KERNEL_HEADERS_6_18
 	default "7.0.14"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
