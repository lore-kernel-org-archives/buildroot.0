Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A2C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 13:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E32FC40BA7;
	Tue, 16 Jul 2024 13:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrV_NIGYPREJ; Tue, 16 Jul 2024 13:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B3940BB3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B3940BB3;
	Tue, 16 Jul 2024 13:19:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 156BA1BF380
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 036C960A51
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAi16rGsY4Fk for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 13:19:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0744260A3B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0744260A3B
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0744260A3B
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 13:19:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.84.100])
 by gzga-smtp-mta-g1-5 (Coremail) with SMTP id _____wDHj0lnc5ZmZu+dBQ--.17834S2;
 Tue, 16 Jul 2024 21:19:36 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 06:19:08 -0700
Message-ID: <20240716131908.6070-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDHj0lnc5ZmZu+dBQ--.17834S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFyfWF1fGw47AF1xWF4DJwb_yoWrGFWxpF
 4xCw13Cr4xXFZ3G3y8CF12q3WayrWkuF4UGF4jg3W0vr17GF1UJa4UKa48AF15ua9Fv3W5
 XayUGF93uF4Ut3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUga9xUUUUU=
X-Originating-IP: [223.102.84.100]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXAwejWXAmxGDfAAAsT
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=V6ipv
 jrcjvu7lnJHEvdVDhd16hi7HqgqgsMuLI1lkcY=; b=YjphhwhUsuwkg/t5B1Jd5
 GFDbkhpNd4W8ZXxRijb0Ax8FIXQB6F4y+pRh0i7M95NEa8L7C2N/ORD6YNwU6Al3
 vCobvROqG7GUF8gD2yXDETYlo5bIcMytsUfIs6ocUkv9tehLvtm+6kljT7ydMhF+
 3hRPFrdXI79j1bG8ipfX0U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=YjphhwhU
Subject: [Buildroot] [PATCH 1/1] package/crun: bump to version 1.15
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 ...ile-error-without-libseccomp-and-lib.patch | 59 -------------------
 package/crun/crun.hash                        |  2 +-
 package/crun/crun.mk                          |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch

diff --git a/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch b/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
deleted file mode 100644
index 81b08d34b7..0000000000
--- a/package/crun/0001-libcrun-fix-compile-error-without-libseccomp-and-lib.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From ea27b1363ef709ce4b169138017b67ef624b127b Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Tue, 12 Dec 2023 10:47:42 +0800
-Subject: [PATCH] libcrun: fix compile error without libseccomp and libcap
-
-Fixed compile error without libseccomp and libcap, running
-clang-format to format the code style.
-
-Upstream: https://github.com/containers/crun/commit/ea27b1363ef709ce4b169138017b67ef624b127b
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- src/libcrun/container.c | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/src/libcrun/container.c b/src/libcrun/container.c
-index 34649f8..ffcdb24 100644
---- a/src/libcrun/container.c
-+++ b/src/libcrun/container.c
-@@ -23,7 +23,9 @@
- #include "container.h"
- #include "utils.h"
- #include "seccomp.h"
--#include <seccomp.h>
-+#ifdef HAVE_SECCOMP
-+#  include <seccomp.h>
-+#endif
- #include "scheduler.h"
- #include "seccomp_notify.h"
- #include "custom-handler.h"
-@@ -47,7 +49,9 @@
- #include <sys/signalfd.h>
- #include <sys/epoll.h>
- #include <sys/socket.h>
--#include <sys/capability.h>
-+#ifdef HAVE_CAP
-+#  include <sys/capability.h>
-+#endif
- #include <sys/ioctl.h>
- #include <termios.h>
- #include <grp.h>
-@@ -3829,6 +3833,7 @@ populate_array_field (char ***field, char *array[], size_t num_elements)
-   (*field)[i] = NULL;
- }
- 
-+#ifdef HAVE_CAP
- static void
- populate_capabilities (struct features_info_s *info, char ***capabilities, size_t *num_capabilities)
- {
-@@ -3876,6 +3881,7 @@ populate_capabilities (struct features_info_s *info, char ***capabilities, size_
-   (*capabilities)[index] = NULL; // Terminate the array with NULL
-   populate_array_field (&(info->linux.capabilities), *capabilities, *num_capabilities);
- }
-+#endif
- 
- static void
- retrieve_mount_options (struct features_info_s **info)
--- 
-2.34.1
-
diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index c461d78d97..b111e941dd 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  a76982ac076a5c9bf9f85bd8d25b1dc6344e252399a7e9231504357fc019f7cc  crun-1.12.tar.gz
+sha256  a03ba1e58b8823ae77d010024b43bd94c5a99f7d652257b1b23abd2d2cdb087f  crun-1.15.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 005d5fb397..b48f15304b 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.12
+CRUN_VERSION = 1.15
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.44.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
