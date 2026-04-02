Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D743D6AB01
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 20:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D74A40B14;
	Thu,  2 Apr 2026 20:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjYrnPfW2oPB; Thu,  2 Apr 2026 20:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07B4040B02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775161307;
	bh=Yp6j2CMAi4IXX6u7Ev7FcsKeQQkd6lPmt5qSeQdAiNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PsJVQET844Da3fH8jbpmzskN+Og9IOxQzLJyX5bwVyhvvFCFtk20M11yZs+OX5Dxv
	 2W0llVuUhX4OGoElvV2qbJE8JlQ9iGvghM88FTqDMkS0ZNPBtbRtB2bMbMe8vOTlMC
	 lR5e2rAXj8P/0eR4o/zNNO6k+TGbgRyxV6uQIpA2fJFFmzmfTKztkHj7/Mjw/47qNN
	 zXOnIxN1JJnfQpFdXUPVsqyxKeOiKqbOMCvOb0UpW5HCjTtzTPG4rIR8zcqAjMJ9KC
	 4aZwbjjPLl0EEcL4wA9vS38bWPUYVYQYE7bxJJ6jQv9Gp4dJbtbLGrjdOjf3/SMcWq
	 onAezU6+0VVHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07B4040B02;
	Thu,  2 Apr 2026 20:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B51912D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B1F88120E
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvPsZzgiZwQX for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 20:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42C9810E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E42C9810E4
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 20:21:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B1CA7FF22; Thu,  2 Apr 2026 20:21:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Apr 2026 22:11:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 724635227314010518372c5bad4d37d7c58950c1
X-Git-Newrev: 0c18426eccaed66e041dc9445a5e1a4eb8dd50b9
X-Patchwork-Hint: ignore
Message-Id: <20260402202144.5B1CA7FF22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12, 18,
 19}.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0c18426eccaed66e041dc9445a5e1a4eb8dd50b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.19.10 => 6.19.11}                 | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 4 ++--
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.79 => 6.12.80} | 0
 package/linux-headers/{6.18.20 => 6.18.21} | 0
 package/linux-headers/{6.19.10 => 6.19.11} | 0
 package/linux-headers/{6.6.130 => 6.6.132} | 0
 package/linux-headers/Config.in.host       | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/6.19.10 b/linux/6.19.11
similarity index 100%
rename from linux/6.19.10
rename to linux/6.19.11
diff --git a/linux/Config.in b/linux/Config.in
index a62d9f4a1f..72ec2e4054 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index a3c6bf57a3..b01ade78d0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4bfa751f33de2a5d7ecb4ff964743a027fc726a2225a76a18f92f0582aa0790b  linux-6.12.79.tar.xz
-sha256  2460aa67b9494cff6f9fc2b235470867d2005469d40f29da452e8ee82940248d  linux-6.6.130.tar.xz
+sha256  c92591d896e79ecddbc3319136f0c2f855e832b397de7593f013ad7590a43e53  linux-6.12.80.tar.xz
+sha256  c5b62bbb104f5fddf6be6f50ebd170146c1995d2cc84e591a914decb4b6b2eb4  linux-6.6.132.tar.xz
 sha256  2818053c07976ba4ed5f44deb0f5dc7ae7b0975d7918c313d48d8fe7c4e598cb  linux-6.1.167.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  0bc1bdf74957e276793691865ffb71505809706d9243a42e9704aad0f128cdd4  linux-5.15.202.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 03202b91d6..2bb1b7143f 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  466d441a0ea5e04b7023618b7b201bfd60effab225f806fd41ce663484395a1c  linux-6.19.10.tar.xz
-sha256  837a5abd98e46078a0ae1400e2daad89ece45cc3209037b09c2265dab2393553  linux-6.18.20.tar.xz
+sha256  20039d7b6b256c08be2f8fac43c3ff9a620308c703c643cf2f80c3910b9bd59b  linux-6.19.11.tar.xz
+sha256  1c38214fb137bae85b82b82537b5987358621b915ab2a8e4f09e60697c19474f  linux-6.18.21.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.79 b/package/linux-headers/6.12.80
similarity index 100%
rename from package/linux-headers/6.12.79
rename to package/linux-headers/6.12.80
diff --git a/package/linux-headers/6.18.20 b/package/linux-headers/6.18.21
similarity index 100%
rename from package/linux-headers/6.18.20
rename to package/linux-headers/6.18.21
diff --git a/package/linux-headers/6.19.10 b/package/linux-headers/6.19.11
similarity index 100%
rename from package/linux-headers/6.19.10
rename to package/linux-headers/6.19.11
diff --git a/package/linux-headers/6.6.130 b/package/linux-headers/6.6.132
similarity index 100%
rename from package/linux-headers/6.6.130
rename to package/linux-headers/6.6.132
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bf8b6b2728..c61eef10d0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -467,10 +467,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.252"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.167"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.130"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.79"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.20"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.10"	if BR2_KERNEL_HEADERS_6_19
+	default "6.6.132"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.80"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.21"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.11"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
