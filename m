Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26699C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E551E70AA8;
	Fri, 28 Feb 2025 17:10:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Tw48KM9pFX6; Fri, 28 Feb 2025 17:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBEDE70AB3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBEDE70AB3;
	Fri, 28 Feb 2025 17:10:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1205094F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2B2D4088A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fDmZzG1GXwOh for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B258242F4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B258242F4E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A740287B63; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 10:35:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 32829d0d131ec3cd16d2622b741f8b24bcac594a
X-Git-Newrev: fe409a5cbdd84df29530fd812f00af97d490e453
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.A740287B63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fio: bump version to
 3.38
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe409a5cbdd84df29530fd812f00af97d490e453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fio/Config.in | 8 +++++---
 package/fio/fio.hash  | 8 ++++++--
 package/fio/fio.mk    | 4 ++--
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/fio/Config.in b/package/fio/Config.in
index ff16c7263a..b2a4fa64ae 100644
--- a/package/fio/Config.in
+++ b/package/fio/Config.in
@@ -5,14 +5,16 @@ config BR2_PACKAGE_FIO
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 # nvme_ioctl.h
 	help
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
