Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4DCCD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE718466D;
	Mon, 15 Jun 2026 21:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sajmwLsFSwzZ; Mon, 15 Jun 2026 21:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A351B8466E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781559097;
	bh=weNHAWD+90YiuXWCYVDGAG09DGZO3iJ9nNrJ6gwFqAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PtwfWqXwJgw1a4dsq6JI4Tps1b6Dy6ySgvDkTkzXbs8lbpvbgwM71eryktiNsrj+8
	 p1XWaUCCxps25Wepk6P2q2jZXc0vabvag67J9csDzhNlNWMpbEAPA98k35w/XomAi0
	 Qf+wO0RRuZZ0WWQWWlhRV4kOThrFQlxnpPFoYJdxdlBcBY/F57xwVdY9BCKtUlwXLz
	 dPoTzG5YZa7C2rHqrPNTNVb0JUK0L5SaaVLSILsUp5I2N9KVked5K400fED6vBVo7w
	 CLw+N+262xfaMvhrDUg6xUA2vg68AET/Lc7zgNuZPjTfmOUtW60SDl26EUBiFKopwV
	 /rTJ9b+TIFyGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A351B8466E;
	Mon, 15 Jun 2026 21:31:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A308F169
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91CFC41B90
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sL8iMX3b6YOd for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 21:31:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2BB841B8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2BB841B8F
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 21:31:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F233F7FF06; Mon, 15 Jun 2026 21:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 22:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96408d1313bface05f5dcc9e275eb118fce87fa9
X-Git-Newrev: d609530d09c1018a3e579ff968778fbbee3867dc
X-Patchwork-Hint: ignore
Message-Id: <20260615213114.F233F7FF06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 7.0.x,
 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d609530d09c1018a3e579ff968778fbbee3867dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
- 6.12.92 -> 6.12.93
- 6.18.34 -> 6.18.35
- 7.0.11 -> 7.0.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.11 => 7.0.12}                   | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.92 => 6.12.93} | 0
 package/linux-headers/{6.18.34 => 6.18.35} | 0
 package/linux-headers/{7.0.11 => 7.0.12}   | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.0.11 b/linux/7.0.12
similarity index 100%
rename from linux/7.0.11
rename to linux/7.0.12
diff --git a/linux/Config.in b/linux/Config.in
index 8b17fece44..bbd0e491cd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 93c36c9156..4ebc486eac 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  0fe376b7db3cac4456b38291bee4faa7091cb8befaa6f9870314f5d1282f9e3e  linux-6.12.92.tar.xz
+sha256  492648a87c0b69c5ac7f43be64792b9000e3439550d4e82e4a14710c49094fa3  linux-6.12.93.tar.xz
 sha256  b2f6607a75cd27b2e368cf2d25e1637e1e0da9dfed4cda536658879eee6f2b70  linux-6.6.142.tar.xz
 sha256  37e984a9e449eb15023b3063c3fd6f64fdd1d83af5bb6a944cd7244f40beca85  linux-6.1.175.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03ed2d7876..8274594ec2 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  e56c8356dda01136a6041c6ef832bd0ec99bd2d35dff97832aa5ec10ed014304  linux-7.0.11.tar.xz
+sha256  57edc9a41efc1ca6b797afa8f4a587a30da2af6bca7356eb56e1e1a4ada265da  linux-7.0.12.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  640c4732fb42842166db97e032c1fe7e5ff72c85a8982c75b40f74be3555d760  linux-6.18.34.tar.xz
+sha256  f78602932219125e211c5f5bfd84edcfd4ec5ce88fc944f8248413f665bef236  linux-6.18.35.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.92 b/package/linux-headers/6.12.93
similarity index 100%
rename from package/linux-headers/6.12.92
rename to package/linux-headers/6.12.93
diff --git a/package/linux-headers/6.18.34 b/package/linux-headers/6.18.35
similarity index 100%
rename from package/linux-headers/6.18.34
rename to package/linux-headers/6.18.35
diff --git a/package/linux-headers/7.0.11 b/package/linux-headers/7.0.12
similarity index 100%
rename from package/linux-headers/7.0.11
rename to package/linux-headers/7.0.12
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 1c00e2508b..3e3832b707 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,9 +472,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.209"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.175"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.142"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.92"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.34"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.11"	if BR2_KERNEL_HEADERS_7_0
+	default "6.12.93"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.35"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.12"	if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
