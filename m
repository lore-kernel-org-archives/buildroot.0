Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564CDC433FE
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 07:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04108409D3;
	Mon, 14 Nov 2022 07:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04108409D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJ563j_RHyrq; Mon, 14 Nov 2022 07:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1F40409D9;
	Mon, 14 Nov 2022 07:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1F40409D9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 70BD71BF8C7
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FFF60D80
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 07:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FFF60D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlV7iqJdE8NL for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4844960D7F
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4844960D7F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37061838C4; Mon, 14 Nov 2022 07:20:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 08:18:05 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ee698523b2d4bf766caca94fa1faf15d832ec645
X-Git-Newrev: 4b648d371afcd888db113841a4ac8c27ccc4c3d0
X-Patchwork-Hint: ignore
Message-Id: <20221114072057.37061838C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/multipath-tools:
 bump to version 0.8.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b648d371afcd888db113841a4ac8c27ccc4c3d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Text has been added to README.md, but the section about licenses hasn't
been modified. Unfortunately there are still many files without license
info, so the small piece of text in README.md that says files with no
license info are LGPL-2.0 is still relevant.

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
[Arnout: update README.md hash]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b790ff27d5461df4de22732611a1eb4beee68f91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ultipath-use-pkg-config-to-get-path-to-he.patch | 69 ----------------------
 package/multipath-tools/multipath-tools.hash       |  4 +-
 package/multipath-tools/multipath-tools.mk         |  2 +-
 3 files changed, 3 insertions(+), 72 deletions(-)

diff --git a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
deleted file mode 100644
index 0d46f12a69..0000000000
--- a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 922855e245c8bdadc0d24b5b706549b18fb5f079 Mon Sep 17 00:00:00 2001
-From: Alexander Egorenkov <egorenar-dev@posteo.net>
-Date: Sat, 21 Nov 2020 11:08:56 +0100
-Subject: [PATCH] kpartx, libmultipath: use pkg-config to get path to
- headers
-
-Use pkg-config in Makefile to find path to devmapper and udev headers
-to enable cross-compilation.
-
-Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
----
- kpartx/Makefile       |  2 +-
- libmultipath/Makefile | 12 ++++++------
- 2 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/kpartx/Makefile b/kpartx/Makefile
-index 2906a984..29573890 100644
---- a/kpartx/Makefile
-+++ b/kpartx/Makefile
-@@ -8,7 +8,7 @@ LDFLAGS += $(BIN_LDFLAGS)
- 
- LIBDEPS += -ldevmapper
- 
--ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_task_set_cookie,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_COOKIE
- endif
- 
-diff --git a/libmultipath/Makefile b/libmultipath/Makefile
-index 62ba16e8..3ad9130c 100644
---- a/libmultipath/Makefile
-+++ b/libmultipath/Makefile
-@@ -20,27 +20,27 @@ ifdef SYSTEMD
- 	endif
- endif
- 
--ifneq ($(call check_func,dm_task_no_flush,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_task_no_flush,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_FLUSH -D_GNU_SOURCE
- endif
- 
--ifneq ($(call check_func,dm_task_get_errno,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_task_get_errno,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_GET_ERRNO
- endif
- 
--ifneq ($(call check_func,dm_task_set_cookie,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_task_set_cookie,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_COOKIE
- endif
- 
--ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,/usr/include/libudev.h),0)
-+ifneq ($(call check_func,udev_monitor_set_receive_buffer_size,$(shell $(PKG_CONFIG) --variable=includedir libudev)/libudev.h),0)
- 	CFLAGS += -DLIBUDEV_API_RECVBUF
- endif
- 
--ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_task_deferred_remove,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_DEFERRED
- endif
- 
--ifneq ($(call check_func,dm_hold_control_dev,/usr/include/libdevmapper.h),0)
-+ifneq ($(call check_func,dm_hold_control_dev,$(shell $(PKG_CONFIG) --variable=includedir devmapper)/libdevmapper.h),0)
- 	CFLAGS += -DLIBDM_API_HOLD_CONTROL
- endif
- 
--- 
-2.29.2
-
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index f063848681..58d8de369c 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  ff45ddb18a1effbfbe5712f513dd3b7146c68141091fc1c2489af8d6197026ef  multipath-tools-0.8.8.tar.gz
+sha256  27a426facea0474e6dc48e026a94f7c86890d3f27b439b07ec26b0b9887b0cc4  multipath-tools-0.8.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  b1bd70cc61ab014cc2e744af6b117db481ef4fa5d59cb3a21d86059935c666df  README.md
+sha256  a3777a6b4433a23246eed8a88ca8466e3d21a2f758c03d060201fe2c44ff5484  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index eecfe39002..c0b7c5721e 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.8
+MULTIPATH_TOOLS_VERSION = 0.8.9
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
