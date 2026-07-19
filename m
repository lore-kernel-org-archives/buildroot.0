Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A742C4450A
	for <buildroot@archiver.kernel.org>; Sun, 19 Jul 2026 10:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA3A280981;
	Sun, 19 Jul 2026 10:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1Afz38iLmpP; Sun, 19 Jul 2026 10:21:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8862A8097A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784456508;
	bh=ek52kQJ1dnc9SCu8SfwEAqs+pxOFQtxfeIbWCHLMP2M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ALnYwNJB3yLgUh6TAHzPRFTQRHr6T0RoTytpQPKfHjubCn3f8rSa9tqz93ArmF2Te
	 SOJPCVOEznWoJksEeb23MnoMmGORNdRgGmn9LgRvTK6YWAluZAux9kCG2lc3teHnPx
	 TDCRDWNRwgWCO4XRheKE7WrHAZ5tKcv37AICfyY7++dheKOHVPTr9RoC+vOcjTHesF
	 shH/ta0h/v2XyVrbipKN0i1PfZqXuK2fNvCo3107d4jDHAPbhfS1CCVWH/8HNbWzh4
	 h2LGn229XQo43p82uo3wQHcmkAyUqbZdxQvuU6PVaUMISVASIVsgQpn+Mtktwoi+vB
	 EYBSMfpscJNEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8862A8097A;
	Sun, 19 Jul 2026 10:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 72009282
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E41B4048A
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3By0U7Cu8Ms for <buildroot@buildroot.org>;
 Sun, 19 Jul 2026 10:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42AF24047E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AF24047E
 for <buildroot@buildroot.org>; Sun, 19 Jul 2026 10:21:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F90B88F72; Sun, 19 Jul 2026 10:21:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Jul 2026 12:07:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8faa8ad7be0d9883af81872a44e563d5a32a6415
X-Git-Newrev: 82969faed3963ad8a0d1ce311190be532b526229
X-Patchwork-Hint: ignore
Message-Id: <20260719102109.1F90B88F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 7.1.x,
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82969faed3963ad8a0d1ce311190be532b526229
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.95 -> 6.12.96
 - 6.18.38 -> 6.18.39
 - 7.1.3 -> 7.1.4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.3 => 7.1.4}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.95 => 6.12.96} | 0
 package/linux-headers/{6.18.38 => 6.18.39} | 0
 package/linux-headers/{7.1.3 => 7.1.4}     | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.1.3 b/linux/7.1.4
similarity index 100%
rename from linux/7.1.3
rename to linux/7.1.4
diff --git a/linux/Config.in b/linux/Config.in
index a82aeb76b2..648082b2e0 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7490651b94..4212f73df0 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a9e8c51fcb1e695d1d35dde5886cba579cb6f29c9646c5889f39d63841d4b9f6  linux-6.12.95.tar.xz
+sha256  7d2e1b5d5ab36b3a01856e71782dad2a54e634fb2b37c0a42998def3bbf957c1  linux-6.12.96.tar.xz
 sha256  ec19b8307b495078cdc03749e63cb3802ac23cf6122c82eb9719feeb4557ecc3  linux-6.6.144.tar.xz
 sha256  f6529bfe1a457adab69156fb7fa2232cc203eb63f5e46210f9953d6fc9f70a30  linux-6.1.177.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 809574b9b1..75556f7ac3 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  be41c068e88f5242a19bccdbffbe077b18c47b45f627e2325504b4fab79dd1dc  linux-7.1.3.tar.xz
+sha256  1c63922a119675d38e3ae0f8f6ee07f15c41a786ab9ed66563749bb8c9a08e2e  linux-7.1.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  ac26e508abd56e9f8b89872b6e10c49fc823bcc70d8068a5d8504c1a7c4ff045  linux-6.18.38.tar.xz
+sha256  a7a7e3d2ae9d95e74197223a8d4eb5f6be7aac21b6e6de27e9685d001c1f8cb0  linux-6.18.39.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.95 b/package/linux-headers/6.12.96
similarity index 100%
rename from package/linux-headers/6.12.95
rename to package/linux-headers/6.12.96
diff --git a/package/linux-headers/6.18.38 b/package/linux-headers/6.18.39
similarity index 100%
rename from package/linux-headers/6.18.38
rename to package/linux-headers/6.18.39
diff --git a/package/linux-headers/7.1.3 b/package/linux-headers/7.1.4
similarity index 100%
rename from package/linux-headers/7.1.3
rename to package/linux-headers/7.1.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a8171aabef..b1c0da9647 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -476,9 +476,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.211"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.177"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.144"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.95"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.38"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.3"		if BR2_KERNEL_HEADERS_7_1
+	default "6.12.96"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.39"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.4"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
