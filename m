Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01543C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 12:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E41B80D21;
	Sun, 14 Jul 2024 12:49:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JuBwYx4MI6t; Sun, 14 Jul 2024 12:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DD480CB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DD480CB2;
	Sun, 14 Jul 2024 12:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 241BE1BF3F7
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 12:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 109B7404E9
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 12:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyuqC5JgE37a for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 12:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0466B404E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0466B404E3
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0466B404E3
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 12:49:27 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 92EABB00535;
 Sun, 14 Jul 2024 14:49:23 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 14:49:10 +0200
Message-ID: <20240714124910.1928300-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720961364;
 bh=DEWBay0T6OsPc9wINfLKvM4i5dWMQHegGxrZeQKOE8s=;
 h=From:To:Cc:Subject:Date:From;
 b=eEis1sQXQSl72vgYUuvhD/xNzB/i5yN16Ukl+sfh5G3H+CdcMsJcHai5oTX5HnhEY
 bwLIa1vuMJ/1i5Lw311TzJuO8yqb5ZVGZ0j2dPILOX3UZIo25L+rerdVkwYO5/nGvW
 xqxnLKZlUbUy2uFjjjMZzASDeysQA+hce5q2m5S1I9Y3B0FT1O3ashp8R7k68o4FW4
 68Hd6vgNdylUKorcBJD0tqdXmqcuDXfoCMcmLbZYnjdgYvgVWvL1ofXW35yqu0qVDl
 +duIKOUFBGJlK5mXr478w8O7D3C6xk8Zks04pwIOKMizoOz3XKpUh9x5PFAt3ceVrG
 pCpobzhaOE9/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=eEis1sQX
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: bump version to 6.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v5.16.2, see:
https://github.com/kdave/btrfs-progs/blob/v6.9.2/CHANGES

This commit also adds a _CONF_ENV when using a uClibc toolchain.
btrfs-progs is now using glibc printf functions, if the <printf.h>
header is present. uClibc provides this header, but not the functions.
This configuration environment variable will prevent the header of
being detected, which will make brtfs-progs to use a workaround.

This commit also adds a patch to fix compilation with gcc 5.x and 6.x.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit 804edd8 with command:

    utils/docker-run make check-package
    ...
    0 warnings generated

    utils/test-pkg -a -p btrfs-progs
    ...
    41 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Also tested with the runtime test proposed at:
https://patchwork.ozlabs.org/project/buildroot/patch/20240713173149.346681-1-ju.o@free.fr/

Also tested host-btrfs-progs by building a qemu config with a btrfs rootfs.
(I'll probably write a fs runtime test later for that case...).
---
 ...compat-fix-fallthrough-definition-fo.patch | 63 +++++++++++++++++++
 package/btrfs-progs/btrfs-progs.hash          |  2 +-
 package/btrfs-progs/btrfs-progs.mk            | 13 +++-
 3 files changed, 76 insertions(+), 2 deletions(-)
 create mode 100644 package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch

diff --git a/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch b/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
new file mode 100644
index 0000000000..1bad695210
--- /dev/null
+++ b/package/btrfs-progs/0001-btrfs-progs-kerncompat-fix-fallthrough-definition-fo.patch
@@ -0,0 +1,63 @@
+From 156a9237fb31145a1f082fe13ff1866aafca5174 Mon Sep 17 00:00:00 2001
+From: Julien Olivain <ju.o@free.fr>
+Date: Sun, 14 Jul 2024 12:52:33 +0200
+Subject: [PATCH] btrfs-progs: kerncompat: fix fallthrough definition for gcc
+ 5.x and 6.x.
+
+Commit [1] 3a1d4aa089 "btrfs-progs: fix fallthrough cases with proper
+attributes" introduced a macro "fallthrough" to better handle compiler
+warnings of fallthrough situations.
+
+This macro is defined using the "__has_attribute" built-in
+function-like macro, which was introduced in GCC 5. See [2]. It then
+test for the "__fallthrough__" attribute, which was introduced in
+GCC 7. See [3].
+
+When compiling with a gcc version which supports "__has_attribute" and
+not the "__fallthrough__" attribute, compilation fails with error
+message:
+
+    common/format-output.c: In function 'print_escaped':
+    common/format-output.c:78:4: error: 'fallthrough' undeclared (first use in this function)
+        fallthrough;
+        ^
+btrfs-progs claim to support gcc at minimal version 4.8 in [4].
+
+This commit fixes this issue by adding the missing definition.
+
+The definition of the unsupported case is duplicated, because testing
+for "__has_attribute" and an attribute at the same time is not
+portable. See the cpp "__has_attribute" documentation [5].
+
+Note: the issue was found with Buildroot Linux [6], while testing with
+the command "utils/test-pkg -a -p btrfs-progs".
+
+[1] https://github.com/kdave/btrfs-progs/commit/3a1d4aa089419b7c94b31ff87122fa74907e1aa6
+[2] https://gcc.gnu.org/gcc-5/changes.html
+[3] https://gcc.gnu.org/gcc-7/changes.html
+[4] https://github.com/kdave/btrfs-progs/tree/v6.9.2#build-compatibility
+[5] https://gcc.gnu.org/onlinedocs/cpp/_005f_005fhas_005fattribute.html
+[6] https://buildroot.org/
+
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+Upstream: Proposed: https://github.com/kdave/btrfs-progs/pull/842
+---
+ include/kerncompat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/include/kerncompat.h b/include/kerncompat.h
+index 31cd9d8d..bcd46bde 100644
+--- a/include/kerncompat.h
++++ b/include/kerncompat.h
+@@ -305,6 +305,8 @@ static inline void up_read(struct rw_semaphore *sem)
+ #if defined __has_attribute
+ # if __has_attribute(__fallthrough__)
+ #  define fallthrough			__attribute__((__fallthrough__))
++# else
++#  define fallthrough			do {} while (0)  /* fallthrough */
+ # endif
+ #else
+ # define fallthrough			do {} while (0)  /* fallthrough */
+-- 
+2.45.2
+
diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index 14eeb1ca07..082e8c1cdc 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  9e9b303a1d0fd9ceaaf204ee74c1c8fa1fd55794e223d9fe2bc62875ecbd53d2  btrfs-progs-v5.16.2.tar.xz
+sha256  43865bb272dc0ab2585de3605434d81ba217578f0897bf700cd36c14ac40652a  btrfs-progs-v6.9.2.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 9bf50ccfda..be8162fdcc 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 5.16.2
+BTRFS_PROGS_VERSION = 6.9.2
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
@@ -13,6 +13,17 @@ BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
 
+# btrfs-progs uses the glibc register_printf_specifier() and
+# register_printf_modifier() functions, if the header <printf.h> is
+# detected at configure time. uClibc has this header, but does not
+# provide those functions. This leads to build failure. In case no
+# header is present, btrfs-progs is providing a workaround. We disable
+# the <printf.h> header detection for uClibc toolchains. Musl libc is
+# not impacted, because it does not provide a <printf.h> header.
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+BTRFS_PROGS_CONF_ENV += ac_cv_header_printf_h=no
+endif
+
 # Doesn't autodetect static-only and tries to build both
 ifeq ($(BR2_STATIC_LIBS),y)
 BTRFS_PROGS_MAKE_OPTS = static
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
