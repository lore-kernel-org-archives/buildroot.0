Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D8C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 10:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77EF383449;
	Tue, 19 Apr 2022 10:40:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RJcgPg6bCFmi; Tue, 19 Apr 2022 10:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B28A833CE;
	Tue, 19 Apr 2022 10:40:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8277C1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E992415CB
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=posteo.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zqcP2UznR33 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 10:40:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 000D6415CF
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 10:40:23 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 7022F240029
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:40:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1650364821; bh=YNoY+Oq6Ih5OVUEvWCHX81wSdHRKgoF9qlBllBkLj84=;
 h=From:To:Cc:Subject:Date:From;
 b=hRdSnl+Jsxa5xjCFK3GGJJ8FHxkOu5Jg2aPAMgtT/UrNood2uovaxfjia6IUJEmHj
 UDOS40WL3ggUeQjWKvcDq0mRHFkjRg38lgrLjIscAG9mfglMMOCx3R0nwb39Oy6DzR
 WCerCICBOI+03wzK/vxE+6A+z8QdvAbQCJfIReWiRCLqqJKUUU52x9aDff2k8DCpD2
 H7JcLETWTzyPCUtjvrrgRts4t9YJylDdVS5ecgyewV2gDF98NMTAmD5OhTG4vkQAIK
 d5IwqSJV6A7ET+LMlwWCN3Q7PUlhkK8sERe8Kf3GV1nI5GpAMw0LqDPUfYvIpwT5Zf
 z70Fa/2FF2mfA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4KjL1067tnz6tmT;
 Tue, 19 Apr 2022 12:40:20 +0200 (CEST)
From: Alexander Egorenkov <egorenar-dev@posteo.net>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 10:40:13 +0000
Message-Id: <20220419104013.23735-1-egorenar-dev@posteo.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.8.9
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
---
 ...ath-use-pkg-config-to-get-path-to-he.patch | 69 -------------------
 package/multipath-tools/multipath-tools.hash  |  2 +-
 package/multipath-tools/multipath-tools.mk    |  2 +-
 3 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch

diff --git a/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch b/package/multipath-tools/0001-kpartx-libmultipath-use-pkg-config-to-get-path-to-he.patch
deleted file mode 100644
index 0d46f12a6947..000000000000
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
index f063848681ea..38558a9633d1 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  ff45ddb18a1effbfbe5712f513dd3b7146c68141091fc1c2489af8d6197026ef  multipath-tools-0.8.8.tar.gz
+sha256  27a426facea0474e6dc48e026a94f7c86890d3f27b439b07ec26b0b9887b0cc4  multipath-tools-0.8.9.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index eecfe3900233..c0b7c5721ebe 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.8
+MULTIPATH_TOOLS_VERSION = 0.8.9
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
