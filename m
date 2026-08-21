Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04D4C5DF7D
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3683B409F5;
	Fri, 21 Aug 2026 16:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0h9VOZRAaRGq; Fri, 21 Aug 2026 16:14:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787328876;
	bh=uyv4HjCz6MngNIH8gZpfPktNWXkCUiNEINsOaDxVoz0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WAGkni1WVNwddewZe/OuRGPkQMEOdMG4bQ72UP4plnr45a/giWOTKWJ+jfR1RivsK
	 OqktL2AP/K7U4Jzkv1i25BD22t/Z2TFQWIcTUIee7Ru8exo14q2mWy/Zjbto2AUC5W
	 4StbXsxuNKlZ2I/dQRus7A9d+Yw7U3AnFCv41jimL0I9k+OC72JspH4sEk8Wlkkwej
	 aHh1wWunLJ+0x6lqI+NXQ0RHiYeOweY9wE4nSh1l4Yy0e87rKSVRDdF37Y/Dwo009S
	 DJpRVxidqQrMyjwIgn1cWsaw60/31IdsFa54ojW8K+0pgVH30j7fbcg74NlKbyiwPY
	 07ASYwfw/gnPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BF44409E3;
	Fri, 21 Aug 2026 16:14:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 699F51CF2
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BB0560661
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz-8aEtCptdl for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F9C66065F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:14:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93E2B8E1F3; Fri, 21 Aug 2026 16:13:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 18:13:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86102dd8279ac6c4c0244f3e490af98dc7460d5e
X-Git-Newrev: fcac6c4f2514ea3e100fcbf34b47c6380291ebbc
X-Patchwork-Hint: ignore
Message-Id: <20260821161340.93E2B8E1F3@busybox.osuosl.org>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fcac6c4f2514ea3e100fcbf34b47c6380291ebbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 7.1.8 -> 7.1.9
 - 6.18.44 -> 6.18.45
 - 6.12.103 -> 6.12.104
 - 6.6.151 -> 6.6.152
 - 6.1.182 -> 6.1.183
 - 5.15.215 -> 5.15.216
 - 5.10.264 -> 5.10.265

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.8 => 7.1.9}                       |  0
 linux/Config.in                              |  2 +-
 linux/before-6.17/linux.hash                 | 10 +++++-----
 linux/from-6.17/linux.hash                   |  4 ++--
 package/linux-headers/{5.10.264 => 5.10.265} |  0
 package/linux-headers/{5.15.215 => 5.15.216} |  0
 package/linux-headers/{6.1.182 => 6.1.183}   |  0
 package/linux-headers/{6.12.103 => 6.12.104} |  0
 package/linux-headers/{6.18.44 => 6.18.45}   |  0
 package/linux-headers/{6.6.151 => 6.6.152}   |  0
 package/linux-headers/{7.1.8 => 7.1.9}       |  0
 package/linux-headers/Config.in.host         | 14 +++++++-------
 12 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/7.1.8 b/linux/7.1.9
similarity index 100%
rename from linux/7.1.8
rename to linux/7.1.9
diff --git a/linux/Config.in b/linux/Config.in
index 35f8daddaa..563422e5b5 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.8" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
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
index bb9750191d..1bb104612d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  ff01dcb449279d5b4cfccdb01fee639cf5ff1803f1749a77844dd33915422c49  linux-7.1.8.tar.xz
+sha256  3271a4ae3897b38352980f2b0975bae61bca81c644d186221c5ae928bcc072b0  linux-7.1.9.tar.xz
 
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
diff --git a/package/linux-headers/7.1.8 b/package/linux-headers/7.1.9
similarity index 100%
rename from package/linux-headers/7.1.8
rename to package/linux-headers/7.1.9
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ad1a5bd70c..a16ffdedef 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,13 +472,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.8"		if BR2_KERNEL_HEADERS_7_1
+	default "5.10.265"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.216"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.183"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.152"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.104"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.45"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.9"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
