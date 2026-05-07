Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F17ECD343F
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22AAA610EE;
	Thu,  7 May 2026 19:47:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUDuReuoiRzR; Thu,  7 May 2026 19:47:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 179FA610EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778183237;
	bh=TKQnA6tlPHVlxFumCwlRAsYWsFwMfMK7kuXK/7caeeY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e9DZRF969X0kXBUTgOJ/83/S1yF83BqcTDS5/gwhTNtRwCRYrcOHEHUshpBE9OK7O
	 9yS9Sk77dCtPp2okBIw7aUBQRQK4ZmEoX1+WT75cwXjVldt10vhf1zn7SN0cRcFgQr
	 IbgfO1zDDj0zlKB8VUa+WPNiFotFY3/BNj0ZWFtBq/GptrTbyV4TFOJ9w+posdCchw
	 K6tE0ob+U41DFkRBjVNfBzTgSwEmpuFjPVkuq15dXvmsduEMcQcFr1B+0shEGqdy0I
	 CjmSeCEWqb9S3TDfUs9Q0WXKAumW21OK0eOkdeWK4MYBZ79zALf0m2K8E6a0W6K+Jp
	 A/0FWcSYLW4Zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179FA610EB;
	Thu,  7 May 2026 19:47:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 444AF280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35F4983D19
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A90GM4vNE7Sd for <buildroot@buildroot.org>;
 Thu,  7 May 2026 19:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34CC483D1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34CC483D1B
 for <buildroot@buildroot.org>; Thu,  7 May 2026 19:47:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 581B0850D0; Thu,  7 May 2026 19:47:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 May 2026 21:38:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c073c976179021c84e0c84f6f23e938b43783e75
X-Git-Newrev: bfc160e36bfea6ac7b1d2361d5f4854061b94a31
X-Patchwork-Hint: ignore
Message-Id: <20260507194712.581B0850D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12,
 18}.x / 7.0.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bfc160e36bfea6ac7b1d2361d5f4854061b94a31
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.0.3 => 7.0.4}                     | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.85 => 6.12.86} | 0
 package/linux-headers/{6.18.26 => 6.18.27} | 0
 package/linux-headers/{7.0.3 => 7.0.4}     | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/7.0.3 b/linux/7.0.4
similarity index 100%
rename from linux/7.0.3
rename to linux/7.0.4
diff --git a/linux/Config.in b/linux/Config.in
index 46532bf625..20f4ceeaf4 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.0.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.0.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index ffdbcd8c27..7bae7e23ce 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e35ac999f40a6874493d8d60f33f1150d7a89ae5841c428da82257fbcd070aed  linux-6.12.85.tar.xz
+sha256  edef22b327c7cbf39cdbf8d717fffa344f1ca299e513990e21705b3bf26dbb5d  linux-6.12.86.tar.xz
 sha256  92f1e90d8be49f9d7f989e563c97a4f39cd7731025d7b81152814c68b5bd56c4  linux-6.6.137.tar.xz
 sha256  b578912f79a5e8ea1a94ce4364d20a3902d2005be0e16deee9fbd0ad697c4944  linux-6.1.170.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index cd0214519d..4cbb89bc02 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  0bedadbf5788693ddebbcc913c893f1a97349af79ddde7144c2a80b401959f1c  linux-7.0.3.tar.xz
+sha256  d92081d84c925adb21a6a709042499e5dcad5dd93a1d9c683f05304fda9257a7  linux-7.0.4.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  53772f5d3776e043767c8d81a32240d1f3eb64e822a5d7a510b55ca40707b0ec  linux-6.18.26.tar.xz
+sha256  25017b93946f0ba2cbf71910b59640a29d9167a5b65ccd41b12cd991875ce2ea  linux-6.18.27.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.85 b/package/linux-headers/6.12.86
similarity index 100%
rename from package/linux-headers/6.12.85
rename to package/linux-headers/6.12.86
diff --git a/package/linux-headers/6.18.26 b/package/linux-headers/6.18.27
similarity index 100%
rename from package/linux-headers/6.18.26
rename to package/linux-headers/6.18.27
diff --git a/package/linux-headers/7.0.3 b/package/linux-headers/7.0.4
similarity index 100%
rename from package/linux-headers/7.0.3
rename to package/linux-headers/7.0.4
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 709028ca8e..a0528d2e5d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -472,9 +472,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.204"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.170"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.137"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.85"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.26"	if BR2_KERNEL_HEADERS_6_18
-	default "7.0.3"		if BR2_KERNEL_HEADERS_7_0
+	default "6.12.86"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.27"	if BR2_KERNEL_HEADERS_6_18
+	default "7.0.4"		if BR2_KERNEL_HEADERS_7_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
