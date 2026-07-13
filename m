Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64600C44507
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24EE8407F6;
	Mon, 13 Jul 2026 10:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiFJSBMmESHA; Mon, 13 Jul 2026 10:22:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A94B40872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938168;
	bh=GhaGcVAviKUhGNYloUx5v+BRsK3u4aZbM5EwnvtpdJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a+NdNEHLk7bazAIe3TB+/eCck1Yftcc8fJlYeZCI7T+9xdgA0PqaqDO7yWBrVLToX
	 ySAGUMXBwgcwlv4I+vzSfVb/ukXaKJE0jyA/zVXyxudeBwzd4rmSN0gRknEOtoeETx
	 kZVeptdT6gR5M+4Ye2hk+WTL2nZp7ZkZAbPm7wkj+EVkNzCq/ZyWPWLXcUgggLK/lN
	 OjwzZld+gl1jqeW3BEdaw2J0S2MTheqL6FSIHWYsojUlefUNIJmOcCReMCSr53w9LP
	 TUnxDokFbZzQQNi20Yc1kxiCi8QZ6lqouHYgegnmY1HzM3c5ZaimlVzczxwFUyWVMI
	 q2iMRCG33KZoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A94B40872;
	Mon, 13 Jul 2026 10:22:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A9C28D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 062F6401BB
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27_KPLLdspJw for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8474008D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8474008D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05C038866C; Mon, 13 Jul 2026 10:22:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 11:58:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5638ee04c8dddb9ebfb7b047efb574f657e1b052
X-Git-Newrev: 14dd079336703b28364568c817a8e7486958fc53
X-Patchwork-Hint: ignore
Message-Id: <20260713102211.05C038866C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump version to 0.15.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/14dd079336703b28364568c817a8e7486958fc53
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop util-linux dependency, libsmartcols is no longer used.
Bump GCC requirement from 4.9 to 13 for gnu2x and C23 enum underlying
types support.

See the release note of the new version:
https://github.com/DPDK/grout/releases/tag/v0.15.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/Config.in  | 10 ++++------
 package/grout/grout.hash |  2 +-
 package/grout/grout.mk   |  5 ++---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/grout/Config.in b/package/grout/Config.in
index 1cfec41d7a..c57937dc18 100644
--- a/package/grout/Config.in
+++ b/package/grout/Config.in
@@ -2,8 +2,8 @@ config BR2_PACKAGE_GROUT
 	bool "grout"
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
-	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
+	depends on BR2_USE_MMU # dpdk, numactl, libecoli
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_13 # C23 enum underlying types
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
@@ -14,16 +14,14 @@ config BR2_PACKAGE_GROUT
 	select BR2_PACKAGE_NUMACTL
 	select BR2_PACKAGE_LIBECOLI
 	select BR2_PACKAGE_LIBMNL
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
 	help
 	  Graph router based on DPDK
 
-comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
+comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 13, headers >= 4.19"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_13 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index bf3d6b87ec..ead390f8fc 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  4ccceea87ead25dfbee7d44d25283abc61173caf6bae08c9644fa9a6cb6b9ade  grout-0.14.3.tar.gz
+sha256  c4a289d13453a42961db2131a179e95965450feb27505f4c463adbd8970e0440  grout-0.15.0.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 39bdc7f824..0b66995dfe 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.14.3
+GROUT_VERSION = 0.15.0
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
@@ -18,8 +18,7 @@ GROUT_DEPENDENCIES = \
 	libevent \
 	libmnl \
 	numactl \
-	libecoli \
-	util-linux
+	libecoli
 
 define GROUT_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
