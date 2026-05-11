Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83616CD484C
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 17:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A53040722;
	Mon, 11 May 2026 17:06:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61s2O2v-sGWV; Mon, 11 May 2026 17:06:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537D940723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778519207;
	bh=fV0YmH3w6tTS4gjjK+/vEfDaXpCv4bb2LGIQxdutFlk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TO4skOayJMK3iEKqmZrF7e36MQXlS1i1svFaPA9c01U9CPJKSdDWby5fET/cogy/1
	 3JJmncR3nMC2KQY4fp0ZpA03jv2pIP+6AOM2mGSDk5bSLHt4jLBJ/Pl8OxfbazQboi
	 PmQyaT2EMSB5PajoAap+Gu0HlAjL+hDm3+C0aYn42tQpXcIX0Y/+xiRTSlLf1L2+ev
	 W0r1hWZ6V4rB8PmjRJiSdDziwYHTqAiVY38kJpn0uSJAVnKbnPtxCURjvpqXDGsy9Q
	 IP6Rrp0LQkMAByejiZ3Yuhh46oqowGT4OL7c3lc4dCq5ZV3w8vwEZPPZsl7jdcEzFK
	 y/Ge2dOW07XEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537D940723;
	Mon, 11 May 2026 17:06:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E6A7F223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D00E660632
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rScCOi8-_7qL for <buildroot@buildroot.org>;
 Mon, 11 May 2026 17:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7B976062D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7B976062D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 17:06:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E47AD85E25; Mon, 11 May 2026 17:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 18:48:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa8e6bc395fe11070cab29f2ef8f848a1a871c4e
X-Git-Newrev: 91c79494e6e9de172202be864067aaf72dd3ea9a
X-Patchwork-Hint: ignore
Message-Id: <20260511170640.E47AD85E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux,
 linux-headers}: bump 6.18.x / 7.0.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/91c79494e6e9de172202be864067aaf72dd3ea9a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.5 => 7.0.6}                     | 0
 linux/Config.in                            | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.18.28 => 6.18.29} | 0
 package/linux-headers/{7.0.5 => 7.0.6}     | 0
 package/linux-headers/Config.in.host       | 4 ++--
 6 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/7.0.5 b/linux/7.0.6
similarity index 100%
rename from linux/7.0.5
rename to linux/7.0.6
diff --git a/linux/Config.in b/linux/Config.in
index 8d67b43812..84246b4228 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.5" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.6" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 2c97dbab36..d80a04c02c 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  965fb0a1c1675399fc60c6063b227c0523041b5f9a662b66462f1212c438ac3c  linux-7.0.5.tar.xz
+sha256  cba44440aa57affd7c21241dc5bc234b0df53c499f8ffc3ebc290dd3390a7523  linux-7.0.6.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f360789483586cf8a20b4ab2bffe76ead6b62c0db1eeb0d917294456c4d77b74  linux-6.18.28.tar.xz
+sha256  c33ea75b1f3bc5fccab836790cd3684eab7057ff383464b5efd8a68ba622a83c  linux-6.18.29.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.18.28 b/package/linux-headers/6.18.29
similarity index 100%
rename from package/linux-headers/6.18.28
rename to package/linux-headers/6.18.29
diff --git a/package/linux-headers/7.0.5 b/package/linux-headers/7.0.6
similarity index 100%
rename from package/linux-headers/7.0.5
rename to package/linux-headers/7.0.6
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a51f7171a5..405d136ea0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -473,8 +473,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "6.1.172"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.138"	if BR2_KERNEL_HEADERS_6_6
 	default "6.12.87"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.28"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.5"		if BR2_KERNEL_HEADERS_7_0
+	default "6.18.29"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.6"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
