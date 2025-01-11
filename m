Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41B8E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 11:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 495B7831FB;
	Sat, 11 Jan 2025 11:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cqpSRMCUy2M; Sat, 11 Jan 2025 11:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B8DB83299
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8DB83299;
	Sat, 11 Jan 2025 11:36:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39784940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26B7C813D9
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BT0-bH3VvdU6 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 11:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CDF6E81177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDF6E81177
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDF6E81177
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 11:36:37 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ED461B00571;
 Sat, 11 Jan 2025 12:36:31 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Julien Olivain <ju.o@free.fr>
Date: Sat, 11 Jan 2025 12:36:25 +0100
Message-ID: <20250111113625.326385-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736595394;
 bh=OfplAg35Z5ooCbCmKkCa4iAtFSoHhDmyVtzbnBmUkDc=;
 h=From:To:Cc:Subject:Date:From;
 b=qC8woutUPb35qqhNwYO+AgXLRZsYTMNjJ1Y6KSWcQdMMs4LiGmU30z5oruYth1pQS
 bH0Bn9hST4jnKSb01RBUibN3sBbw/6dd8yL7zIe/Xx8QAsMPMBq8exERqMfUnc8wt+
 3pvDOyhlCC3AbYPCRjKNCepr2QbomIEdUEBaANu8Wwk0fMvNJ3fdGza2jhqqlxIMBA
 ze967LDiU82nrWBrLaRQV0Jbxbyrbsct2J6ABb6MOXWcUlrsz5mj9/957gY1wmPBUS
 ghos78qioprUyZCY9fSJ7WFjG/jRntVawhRR4JRtTq8V1DLRLrlYfY04Y6oVV3pIAq
 /D4a1XwSbjp6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qC8woutU
Subject: [Buildroot] [PATCH 1/1] package/fio: bump version to 3.38
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 3.34, see:
https://git.kernel.dk/cgit/fio/log/?h=fio-3.38

While at it, this commit also updates the homepage url in Config.in
(which now points to cgit on https) and the _SITE url (which now uses
https) to match urls published in [1]. This commit also adds the md5
hash published upstream and a comment about the pgp signature check.

Also, fio includes the <linux/nvme_ioctl.h> kernel header. See [2]
and [3]. This Kernel header was added in commit [4] and [5], in
Kernel v4.5.

This commits adds this new kernel header version requirement.

[1] https://git.kernel.dk/cgit/fio/tree/README.rst?h=fio-3.38
[2] https://git.kernel.dk/cgit/fio/tree/engines/io_uring.c?h=fio-3.38#n34
[3] https://git.kernel.dk/cgit/fio/tree/engines/nvme.h?h=fio-3.38#n12
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=9d99a8dda154f38307d43d9c9aa504bd3703d596
[5] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a9cf8284b45110a4d98aea180a89c857e53bf850

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1620835990
---
 package/fio/Config.in | 8 +++++---
 package/fio/fio.hash  | 8 ++++++--
 package/fio/fio.mk    | 4 ++--
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index 7825209b4c..892ad740c6 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_FIO
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 # nvme_ioctl.h
 	# fio uses fallocate() which becomes fallocate64() while compiling with
 	# largefile support, but fallocate64() is not available on nios2
 	depends on !BR2_nios2
@@ -12,11 +13,12 @@ config BR2_PACKAGE_FIO
 	  fio is an I/O tool meant to be used both for benchmark
 	  and stress/hardware verification.
 
-	  http://git.kernel.dk/?p=fio.git;a=summary
+	  https://git.kernel.dk/cgit/fio/
 
-comment "fio needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
+comment "fio needs a toolchain w/ dynamic library, threads, gcc >= 4.9, headers >= 4.5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_nios2
 	depends on BR2_USE_MMU
diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 7f7e12f948..7bc8b76bc9 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,4 +1,8 @@
-# Locally computed
-sha256  49f340ef51dbb7942d598abd2b8ad93ce7934ca709f73ba13519568556f9089f  fio-3.34.tar.gz
+# From https://brick.kernel.dk/snaps/MD5SUMS
+md5  2223cf30dc799a838d92193aa5aa41d2  fio-3.38.tar.gz
+# Locally computed after checking gpg signature from
+# https://brick.kernel.dk/snaps/fio-3.38.tar.gz.asc
+# with key C0FC392DCADE26D975FA5E4AF7D358FB2971E0A6
+sha256  a5b63518558004292c7ec60fef90163f59957d7e1dce6f4cb87e9dc75d4dfc48  fio-3.38.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index f6e7b036bb..10fafb8a0e 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FIO_VERSION = 3.34
-FIO_SITE = http://brick.kernel.dk/snaps
+FIO_VERSION = 3.38
+FIO_SITE = https://brick.kernel.dk/snaps
 FIO_LICENSE = GPL-2.0
 FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
