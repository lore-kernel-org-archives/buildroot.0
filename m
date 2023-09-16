Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FE5CD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 12:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E58440AB6;
	Sat, 16 Sep 2023 12:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E58440AB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b12ODpgPwfgG; Sat, 16 Sep 2023 12:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B770D40B20;
	Sat, 16 Sep 2023 12:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B770D40B20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 175981BF41D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0A6142079
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 12:07:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A6142079
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSPnR955JknM for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 337DE4208D
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 337DE4208D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EDD6867F0; Sat, 16 Sep 2023 12:07:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 14:06:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0612504c4301b3aed4757d9358dd5b5cf09ef1cf
X-Git-Newrev: 9ca60c004d69e1f38000e3a74151b0a90aca7f21
X-Patchwork-Hint: ignore
Message-Id: <20230916120756.1EDD6867F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/multipath-tools: bump version to
 0.9.6
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ca60c004d69e1f38000e3a74151b0a90aca7f21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
[yann.morin.1998@free.fr: split long _DEPENDENCIES line]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/multipath-tools/Config.in            |  3 +++
 package/multipath-tools/multipath-tools.hash |  2 +-
 package/multipath-tools/multipath-tools.mk   | 13 +++++++++++--
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/multipath-tools/Config.in b/package/multipath-tools/Config.in
index 222f78b86c..4c648a6abb 100644
--- a/package/multipath-tools/Config.in
+++ b/package/multipath-tools/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_MULTIPATH_TOOLS
 	select BR2_PACKAGE_LVM2
 	select BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBS
+	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT
 	help
 	  This package provides the following binaries to drive
 	  the Device Mapper multipathing driver:
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index ecaad05e25..158f0faa96 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6ed3cf6e786da20a451d9747cbd4c5817815388b8fc8022d1074b3018479031d  multipath-tools-0.9.4.tar.gz
+sha256  401c6f6e8dc5d3feaaee76280716aee718579ac024ce4f2fae77c798dc7a0f9f  multipath-tools-0.9.6.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index 23b3cc9442..7071e1fd1b 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.9.4
+MULTIPATH_TOOLS_VERSION = 0.9.6
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
@@ -20,7 +20,16 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 	README.md
 MULTIPATH_TOOLS_CPE_ID_VENDOR = opensvc
 
-MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
+MULTIPATH_TOOLS_DEPENDENCIES = \
+	host-pkgconf \
+	json-c \
+	liburcu \
+	libaio \
+	lvm2 \
+	readline \
+	udev \
+	util-linux-libs
+
 MULTIPATH_TOOLS_MAKE_OPTS = \
 	kernel_incdir=$(STAGING_DIR)/usr/include \
 	LIB="lib" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
