Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D795C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 22:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A14FF60F69;
	Tue,  9 Aug 2022 22:44:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A14FF60F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZGciC2Rsr7FH; Tue,  9 Aug 2022 22:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5449F60F47;
	Tue,  9 Aug 2022 22:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5449F60F47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB4DF1BF31A
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 22:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1CC3404F3
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 22:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CC3404F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RCy40Ap12bQr for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 22:44:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C22D404F1
Received: from smtpcmd11126.aruba.it (smtpcmd11126.aruba.it [62.149.156.126])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C22D404F1
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 22:44:30 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id LXxcoKW3HAaN9LXxco920P; Wed, 10 Aug 2022 00:44:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 Aug 2022 00:44:27 +0200
Message-Id: <20220809224427.1421622-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCfTpvCEAx83yVdxcxOSZbrTn/7363Vi4VWNPnswkVEOjf+G/kec632whvCWLKLfDfYQUKIY1E8Bj6YoAQ1pJC2as+myUr0kl0Q8HrzD+VsbCH06j401
 JrzI2pqBIRajMyQ2Vzte0xOn1UWIQQBECSCMW0RCR0MKo2TSexeyknUl6dw6V+Gl7whgbvhW0ZV2keYYr+mvQK6LONlt32KtmcnH1ifeqjWe5XxgCzCX00je
 0OAa+B8tAL6ZftIIAgSKU5yuIcGJ8+ECGMOIvyuFgea3uad0mLj4tnJDghMNGfECmPcVGH+2FlYUgnW3ScF28Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660085069; bh=3WFnTKiiewsyWFUyNMaKL9iZ4Jlg+4ykbl1rcW/K1rI=;
 h=From:To:Subject:Date:MIME-Version;
 b=JE5HRQ54SvtyVD+T6jx6u4TEiukVaGLNwatvnAJsyXx2OoDGz2WShv5U26zdoudje
 Da8+MGtxRulRxjWHvnVeDoaI169cHfg6v6UcKJHbuk6SJovgjJPfMcebuaTnl/51KX
 l0KAmCBLNy3vAXTwx3BKpBuCk+zX0P2GhlraqhDNi7oRuJIH5KQurZUq7WbVofpACT
 mIXzFgV+OOsUwI9FDMj7JRfe89OhIn9Nrv6zYpg///Ch82VhpII64VW511m+gtIpQx
 drSILq3VJIYEbqmjEJ2YhtWUNGlfpWYRhS77uLrfL6BVUILlOeUhr7fYOYfdLq4T3+
 /LRIfFl+f+AWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JE5HRQ54
Subject: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.6.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nfs-utils 2.6.2 adds nfsrahead tool to set readahead through sysfs, but
this tool is mandatory and requires libmount that in order requires
libblkid. Also we need a local patch that is already pending upstream to
avoid failing static linking:
https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/

So let's select:
- BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
- BR2_PACKAGE_UTIL_LINUX_LIBBLKID
and add the pending patch for fixing static linking failure due to wrong
order of libraries in linker list(-lblkid must follow -lmount). This is
achieved by using pkg-config that is already a dependency of this package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ead-fix-linking-while-static-linking.patch | 34 +++++++++++++++++++
 package/nfs-utils/Config.in                   |  2 ++
 package/nfs-utils/nfs-utils.hash              |  4 +--
 package/nfs-utils/nfs-utils.mk                |  2 +-
 4 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch

diff --git a/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
new file mode 100644
index 0000000000..b8dcea63f7
--- /dev/null
+++ b/package/nfs-utils/0001-nfsrahead-fix-linking-while-static-linking.patch
@@ -0,0 +1,34 @@
+From a69014a1b4e5b8068630abe3109f31eb64b6a076 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 10 Aug 2022 00:10:51 +0200
+Subject: [PATCH] nfsrahead: fix linking while static linking
+
+-lmount must preceed -lblkid and to obtain this let's add:
+`pkg-config --libs mount`
+in place of:
+`-lmount`
+This ways the library order will always be correct.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+Pending Upstream:
+https://patchwork.kernel.org/project/linux-nfs/patch/20220809223308.1421081-1-giulio.benetti@benettiengineering.com/
+---
+ tools/nfsrahead/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/nfsrahead/Makefile.am b/tools/nfsrahead/Makefile.am
+index 845ea0d5..280a2eb4 100644
+--- a/tools/nfsrahead/Makefile.am
++++ b/tools/nfsrahead/Makefile.am
+@@ -1,6 +1,6 @@
+ libexec_PROGRAMS = nfsrahead
+ nfsrahead_SOURCES = main.c
+-nfsrahead_LDFLAGS= -lmount
++nfsrahead_LDFLAGS= `pkg-config --libs mount`
+ nfsrahead_LDADD = ../../support/nfs/libnfsconf.la
+ 
+ man5_MANS = nfsrahead.man
+-- 
+2.34.1
+
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index f00debc420..f3cb17918e 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -8,6 +8,8 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  The NFS Linux kernel server.
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index a73bf80e70..2efe693875 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.1/sha256sums.asc
-sha256  60dfcd94a9f3d72a12bc7058d811787ec87a6d593d70da2123faf9aad3d7a1df  nfs-utils-2.6.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.2/sha256sums.asc
+sha256  5200873e81c4d610e2462fc262fe18135f2dbe78b7979f95accd159ae64d5011  nfs-utils-2.6.2.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 44653e2707..ed205a26b1 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.1
+NFS_UTILS_VERSION = 2.6.2
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
