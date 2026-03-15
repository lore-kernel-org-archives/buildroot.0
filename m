Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8649D58B17
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 10:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 980DB80CC4;
	Sun, 15 Mar 2026 10:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeW5T7J9fwxB; Sun, 15 Mar 2026 10:42:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE81580EB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773571355;
	bh=gy4+DU12/N27MiilwxX0s8WgUmF6GXUGqddMzbEYB9k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m9uuT7mhuOi7ugpx788im1JzeahDdKV3uLx71j5SGpai3dwDEJYkdHs3Bapu1wRCJ
	 Mhf7iXM17ZuJYMqqZ04K2yptxVnlypmr1698dQvkyPBE9xsJ1sl1nnFCR8kVUPSHek
	 45TlaTpl+a9H/oSCcTNDVBpE1b7qXE1xLXTtfbjlwjmSJDjfSieVSosmPUycwsn0rS
	 HwTpj/3fIXcotms9Ndga3uq+Tkpy38x9YVTrc3KuOWW9A7MXYko308EFeqakXWV3Nq
	 mtHDmk/4OKp8VcetZPb3EaIrH5WNc0K+G18iDiF9NYbyKNeIKCCHspZ8sDZW7MLzDf
	 YRk3/lWXeBQUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE81580EB9;
	Sun, 15 Mar 2026 10:42:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5918B201
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A3A860C2B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G4tAOERV2wsx for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 10:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76F6D6068D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76F6D6068D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 10:42:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94B1084002; Sun, 15 Mar 2026 10:42:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 11:28:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 171d4d489cd3d8fc9d377d8fc8473cda166ad86a
X-Git-Newrev: 2ee9ccae5d761e8d75923da9367e995c22fff0a9
X-Patchwork-Hint: ignore
Message-Id: <20260315104234.94B1084002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{12, 18,
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ee9ccae5d761e8d75923da9367e995c22fff0a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{6.19.6 => 6.19.8}                   | 0
 linux/Config.in                            | 2 +-
 linux/before-6.17/linux.hash               | 2 +-
 linux/from-6.17/linux.hash                 | 4 ++--
 package/linux-headers/{6.12.76 => 6.12.77} | 0
 package/linux-headers/{6.18.16 => 6.18.18} | 0
 package/linux-headers/{6.19.6 => 6.19.8}   | 0
 package/linux-headers/Config.in.host       | 6 +++---
 8 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/6.19.6 b/linux/6.19.8
similarity index 100%
rename from linux/6.19.6
rename to linux/6.19.8
diff --git a/linux/Config.in b/linux/Config.in
index 8033361e82..44f8b08e71 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.19.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.19.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 90e67be8bd..1c6a6ab553 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  bbb43e834c46e6bd49a5c28f22e679a937443404e1f653204d4b24929f3ad896  linux-6.12.76.tar.xz
+sha256  358836ebe5caef41e7ae9492e7fbcdf5be6e53ee43c99752aebda81e1b2cff67  linux-6.12.77.tar.xz
 sha256  caa08f0122224fbbfab177e2a37cc2a94a0046bd2e7e87f03f8913f2b812448a  linux-6.6.129.tar.xz
 sha256  818dfc742158d18f70a6abccd77b7e4366cb7f26a88687f94dae392a9f089449  linux-6.1.166.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index 93ba293fa3..5e4f727a84 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  4d9f3ff73214f68c0194ef02db9ca4b7ba713253ac1045441d4e9f352bc22e14  linux-6.19.6.tar.xz
-sha256  4f21c01f4d04c1d1b3ed794153f8900802c92497be620b07c4869530f2d28ee3  linux-6.18.16.tar.xz
+sha256  aada4722db8bcfa0b9732851856d405082b6a4fa2e3ab067be8db17cdd115b38  linux-6.19.8.tar.xz
+sha256  f4855f382c1b735c84072bdef36db5bcd5dc7b0c37e42f5104317149a0a486ef  linux-6.18.18.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.76 b/package/linux-headers/6.12.77
similarity index 100%
rename from package/linux-headers/6.12.76
rename to package/linux-headers/6.12.77
diff --git a/package/linux-headers/6.18.16 b/package/linux-headers/6.18.18
similarity index 100%
rename from package/linux-headers/6.18.16
rename to package/linux-headers/6.18.18
diff --git a/package/linux-headers/6.19.6 b/package/linux-headers/6.19.8
similarity index 100%
rename from package/linux-headers/6.19.6
rename to package/linux-headers/6.19.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7c2f9a7aa2..5b1f090a2a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -468,9 +468,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.15.202"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.166"	if BR2_KERNEL_HEADERS_6_1
 	default "6.6.129"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.76"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.16"	if BR2_KERNEL_HEADERS_6_18
-	default "6.19.6"	if BR2_KERNEL_HEADERS_6_19
+	default "6.12.77"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.18"	if BR2_KERNEL_HEADERS_6_18
+	default "6.19.8"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
