Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC27C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 20:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD766084C;
	Fri,  4 Apr 2025 20:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TeFu0oRIYtTo; Fri,  4 Apr 2025 20:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0891E60699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0891E60699;
	Fri,  4 Apr 2025 20:30:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EA5A5E
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 20:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C1AC41E65
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 20:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYSkDDo4cpBl for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 20:30:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0A73D4033F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A73D4033F
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A73D4033F
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 20:30:34 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 0ngNu49qotfOn0ngNuDw44; Fri, 04 Apr 2025 22:30:31 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Fri,  4 Apr 2025 22:30:30 +0200
Message-Id: <20250404203030.2805323-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <83efa708da680e88394c89f786e661be@free.fr>
References: <83efa708da680e88394c89f786e661be@free.fr>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG3edsWgFidkEZS4LskCGsqygstm0RiQAtY9T1+Hxc+4GRjLU18zMwv06KNwo3zZpRpoHIYbnPC8O3XzHKBHv4xZWRbB3p79rOy3mhIosJ30d/skqRV6
 vz7vxfGyOnBeIyUxZnNSCfewtLppPoGqp02zxmr/2rNoYyjq1is0gpWdwtEYkuNpuk9+c5A+z/IISxqm413zUfRO5y+/zf8PA7RyRTjepus6N0wyXZXghrnu
 oskr8DP10/H+z7Cj13egpiCXHv+UcYbd83nsjTcZ301ISnS812s4Wid+ZKOB3+Ov
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743798631; bh=Fzd8Dxgm6ktlS36qkn94VgMahLNcfKKvlOfFz7rd8JM=;
 h=From:To:Subject:Date:MIME-Version;
 b=TclZEehrqeMrLGwJ7ctsZYyH9r4vE7JtwTcUtQ1hErY9Uq52L/SVmPh/n9pWCi6Rx
 FiSMI4j+2ahtHSe85lxBW5AP9RvF3cZmug9btKdBr7Dh4+Hg+SVP9erjgRqOMhIT9J
 FEnZvzEUuxNTIxZDGr3QMjVUb4K9+Gs3pbZkTXsS6fh466QsRSwCM9N4TgBj+LHefx
 awIRHHgzwMM3eybhjnz61rywPv332RVaw3SqKEUB72z2/mBbivbdICzxr9mpX0YOQL
 KrITfwqNBc7ZjrJTK+Rp+5STJGZ8HEvYxcupTnw7R0uHlkqPcP9eHQo2bcZr5w3efC
 Gci2Z4RZwYHUA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TclZEehr
Subject: [Buildroot] [PATCH v3] package/libfuse3: bump to version 3.17.1
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.1

Add 2 local patches pending upstream, one to fix build with linux version
< 5.9 and one to fix presence checking of static_assert() on C++ version <
11. Let's also fix a linker failure due to missing -latomic if toolchain
has atomic.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix linux version < 5.9 build failure by adding local patch pending upstream
V2->V3:
* fix static_assert() missing function by adding local patch pending upstream
* fix link failure due to missing -latomic if toolchain has atomic
---
 .../0001-Fix-build-with-kernel-5.9.patch      | 72 +++++++++++++++++++
 ...sert-build-failure-with-C-version-11.patch | 49 +++++++++++++
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  7 +-
 4 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 package/libfuse3/0001-Fix-build-with-kernel-5.9.patch
 create mode 100644 package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch

diff --git a/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch b/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch
new file mode 100644
index 0000000000..f47af0ecc7
--- /dev/null
+++ b/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch
@@ -0,0 +1,72 @@
+From 714fcf4123ae5512893019d2c205aad94b6afea6 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 1 Apr 2025 00:53:07 +0200
+Subject: [PATCH] Fix build with kernel < 5.9
+
+linux/close_range.h is only available since kernel 5.9 and
+https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
+resulting in the following build failure:
+
+../util/fusermount.c:40:10: fatal error: linux/close_range.h: No such file or directory
+
+So let's check for header presence and emit HAVE_LINUX_CLOSE_RANGE_H
+accordingly and check for it when including <linux/close_range.h> and
+calling close_range() instead of checking for close_range() function in
+meson and check against HAVE_CLOSE_RANGE.
+
+Upstream: https://github.com/libfuse/libfuse/pull/1185
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build       | 6 +++++-
+ util/fusermount.c | 4 ++--
+ 2 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index cbcd70d..96c655c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
+ # Test for presence of some functions
+ test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
+                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
+-               'utimensat', 'copy_file_range', 'fallocate', 'close_range' ]
++               'utimensat', 'copy_file_range', 'fallocate' ]
+ foreach func : test_funcs
+     private_cfg.set('HAVE_' + func.to_upper(),
+         cc.has_function(func, prefix: include_default, args: args_default))
+@@ -84,6 +84,10 @@ private_cfg.set('HAVE_ICONV',
+ private_cfg.set('HAVE_BACKTRACE',
+         cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
+ 
++# Test if headers exist
++private_cfg.set('HAVE_LINUX_CLOSE_RANGE_H',
++        cc.check_header('#include <linux/close_range.h>'))
++
+ # Test if structs have specific member
+ private_cfg.set('HAVE_STRUCT_STAT_ST_ATIM',
+          cc.has_member('struct stat', 'st_atim',
+diff --git a/util/fusermount.c b/util/fusermount.c
+index dbd947c..da6d5f2 100644
+--- a/util/fusermount.c
++++ b/util/fusermount.c
+@@ -36,7 +36,7 @@
+ #include <stdbool.h>
+ #include <sys/vfs.h>
+ 
+-#ifdef HAVE_CLOSE_RANGE
++#ifdef HAVE_LINUX_CLOSE_RANGE_H
+ #include <linux/close_range.h>
+ #endif
+ 
+@@ -1477,7 +1477,7 @@ static int close_inherited_fds(int cfd)
+ 	if (cfd <= STDERR_FILENO)
+ 		return -EINVAL;
+ 
+-#ifdef HAVE_CLOSE_RANGE
++#ifdef HAVE_LINUX_CLOSE_RANGE_H
+ 	if (cfd < STDERR_FILENO + 2) {
+ 		close_range_loop(STDERR_FILENO + 1, cfd - 1, cfd);
+ 	} else {
+-- 
+2.39.5
+
diff --git a/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch b/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch
new file mode 100644
index 0000000000..3bcff3d256
--- /dev/null
+++ b/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch
@@ -0,0 +1,49 @@
+From 5fafd1a33e9442811074604eeaa060578e589730 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 4 Apr 2025 22:17:49 +0200
+Subject: [PATCH] Fix static_assert build failure with C++ version < 11
+
+At the moment build fails due to lack of static_assert:
+https://gitlab.com/jolivain/buildroot/-/jobs/9606292537
+this means that the check per date is not enough, so let's use meson to
+check if static_assert() is present or not and simplify
+fuse_static_assert() definition by only checking HAVE_STATIC_ASSERT.
+
+Upstream: https://github.com/libfuse/libfuse/pull/1189
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ include/fuse_common.h | 4 +---
+ meson.build           | 2 +-
+ 2 files changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/include/fuse_common.h b/include/fuse_common.h
+index 77efc5d..582505f 100644
+--- a/include/fuse_common.h
++++ b/include/fuse_common.h
+@@ -30,9 +30,7 @@
+ #define FUSE_MAKE_VERSION(maj, min)  ((maj) * 100 + (min))
+ #define FUSE_VERSION FUSE_MAKE_VERSION(FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION)
+ 
+-#if (defined(__cplusplus) && __cplusplus >= 201103L) ||        \
+-	(!defined(__cplusplus) && defined(__STDC_VERSION__) && \
+-	 __STDC_VERSION__ >= 201112L)
++#ifdef HAVE_STATIC_ASSERT
+ #define fuse_static_assert(condition, message) static_assert(condition, message)
+ #else
+ #define fuse_static_assert(condition, message)
+diff --git a/meson.build b/meson.build
+index 96c655c..bab98da 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
+ # Test for presence of some functions
+ test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
+                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
+-               'utimensat', 'copy_file_range', 'fallocate' ]
++               'utimensat', 'copy_file_range', 'fallocate', 'static_assert' ]
+ foreach func : test_funcs
+     private_cfg.set('HAVE_' + func.to_upper(),
+         cc.has_function(func, prefix: include_default, args: args_default))
+-- 
+2.39.5
+
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 6f3b3ce122..b6e919d56b 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  1bc306be1a1f4f6c8965fbdd79c9ccca021fdc4b277d501483a711cbd7dbcd6c  libfuse3-3.16.2.tar.gz
+sha256  b81027fc8f444fb574de7f13edf0cf9810643d2935670c4fe19f140354241208  libfuse3-3.17.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index f5c9dae8f7..768179797b 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.16.2
+LIBFUSE3_VERSION = 3.17.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
@@ -18,6 +18,11 @@ LIBFUSE3_CONF_OPTS = \
 	-Duseroot=false \
 	-Dtests=false
 
+# Uses __atomic_fetch_sub_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBFUSE3_LDFLAGS += -latomic
+endif
+
 define LIBFUSE3_DEVICES
 	/dev/fuse c 666 0 0 10 229 0 0 -
 endef
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
