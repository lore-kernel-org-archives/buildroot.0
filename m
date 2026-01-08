Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CF6D1D48C
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DCE782779;
	Thu,  8 Jan 2026 20:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxX3TodyB8dZ; Thu,  8 Jan 2026 20:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6F18266D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767903334;
	bh=t9XYIXsolumK6wWEsa/STThhSg6OhJZqsYOZHL3x89s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lZWcPsdArLP7NTW8GWMRwkFS09i595quWUhlHeM9Nzr3gZOPN4sRzSRiNpTSCtn/T
	 qYa4G1NY+ZYerVga/cajQ1QJXbN0xt1Gn1QIeLizDe1KO3x1jOy+lsU40F1JhCEKNY
	 aQCFM2d/75uDMGFvAU+fRKiAxKdpHi+NNybM9zCMl2bVDjQA75BndEeW8EfJd0va08
	 XU1kPeM0fsHA/vpP6jIaf+uZWTrDv2MJu0Bii6imId1ePFB3vrKmgMxAq269vWGBuo
	 dB4dlw7GedLNuO+11veUn+EyG/XQUhQqWkss+zJA+ZjAVDB1LKon++wK6i7ND8ofkd
	 TmEV6oHT5LBpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F6F18266D;
	Thu,  8 Jan 2026 20:15:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ECA8278
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34A7860DD9
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_NbbSwIOc4i for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F273607CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F273607CC
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:15:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A45C80FD8; Thu,  8 Jan 2026 20:15:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 21:00:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f842d9189a92e3bbab7f66a4151873e998cd9d88
X-Git-Newrev: f190162e0dbdbbea7fa20cf5fda1d6976270b425
X-Patchwork-Hint: ignore
Message-Id: <20260108201532.6A45C80FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12,
 18}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=f190162e0dbdbbea7fa20cf5fda1d6976270b425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 628fc91094..0bf8d0ab02 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.18.2" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.18.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 733ef50d8e..45437f8796 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  558c6bbab749492b34f99827fe807b0039a744693c21d3a7e03b3a48edaab96a  linux-6.18.2.tar.xz
-sha256  9502c5ffe4b894383c97abfccf74430a84732f04ee476b9c0d87635b29df7db3  linux-6.12.63.tar.xz
+sha256  7a8879167b89c4bae077d6f39c4f2130769f05dbdad2aad914adab9afb7d7f9a  linux-6.18.3.tar.xz
+sha256  d1ad94a33681148efe884f4028970d69e332f2b003f0e8be53a1d25de38e49a2  linux-6.12.64.tar.xz
 sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
 sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 05a4822636..f28ccaffe0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,8 +460,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.63"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.2"	if BR2_KERNEL_HEADERS_6_18
+	default "6.12.64"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.3"	if BR2_KERNEL_HEADERS_6_18
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
