Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E26C3DA6D
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4B9280DF8;
	Mon, 19 May 2025 10:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7wdAZayu12u; Mon, 19 May 2025 10:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EFC80DAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EFC80DAB;
	Mon, 19 May 2025 10:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F623193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9B7F417C6
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EhYYGt8Dd2bi for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 801D0417F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 801D0417F7
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BC46873D7; Mon, 19 May 2025 10:39:57 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 25 Apr 2025 18:18:18 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 446c09332a8510d793f09759cc2ebd17be6309f2
X-Git-Newrev: 40d37d98b790680b975f5af0039e07e9f0150ef4
X-Patchwork-Hint: ignore
Message-Id: <20250519103957.7BC46873D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libfuse3: bump to
 version 3.17.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=40d37d98b790680b975f5af0039e07e9f0150ef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.2

Drop local patches that are upstreamed now.

Fixes:
https://autobuild.buildroot.net/results/f3c/f3cfaa8ed63483858ffa32b719ea4be68ba6c4f3//

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libfuse3/0001-Fix-build-with-kernel-5.9.patch  | 72 ----------------------
 ...ic_assert-build-failure-with-C-version-11.patch | 49 ---------------
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 4 files changed, 2 insertions(+), 123 deletions(-)

diff --git a/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch b/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch
deleted file mode 100644
index f47af0ecc7..0000000000
--- a/package/libfuse3/0001-Fix-build-with-kernel-5.9.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 714fcf4123ae5512893019d2c205aad94b6afea6 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 1 Apr 2025 00:53:07 +0200
-Subject: [PATCH] Fix build with kernel < 5.9
-
-linux/close_range.h is only available since kernel 5.9 and
-https://github.com/torvalds/linux/commit/60997c3d45d9a67daf01c56d805ae4fec37e0bd8
-resulting in the following build failure:
-
-../util/fusermount.c:40:10: fatal error: linux/close_range.h: No such file or directory
-
-So let's check for header presence and emit HAVE_LINUX_CLOSE_RANGE_H
-accordingly and check for it when including <linux/close_range.h> and
-calling close_range() instead of checking for close_range() function in
-meson and check against HAVE_CLOSE_RANGE.
-
-Upstream: https://github.com/libfuse/libfuse/pull/1185
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build       | 6 +++++-
- util/fusermount.c | 4 ++--
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index cbcd70d..96c655c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
- # Test for presence of some functions
- test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
-                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
--               'utimensat', 'copy_file_range', 'fallocate', 'close_range' ]
-+               'utimensat', 'copy_file_range', 'fallocate' ]
- foreach func : test_funcs
-     private_cfg.set('HAVE_' + func.to_upper(),
-         cc.has_function(func, prefix: include_default, args: args_default))
-@@ -84,6 +84,10 @@ private_cfg.set('HAVE_ICONV',
- private_cfg.set('HAVE_BACKTRACE',
-         cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
- 
-+# Test if headers exist
-+private_cfg.set('HAVE_LINUX_CLOSE_RANGE_H',
-+        cc.check_header('#include <linux/close_range.h>'))
-+
- # Test if structs have specific member
- private_cfg.set('HAVE_STRUCT_STAT_ST_ATIM',
-          cc.has_member('struct stat', 'st_atim',
-diff --git a/util/fusermount.c b/util/fusermount.c
-index dbd947c..da6d5f2 100644
---- a/util/fusermount.c
-+++ b/util/fusermount.c
-@@ -36,7 +36,7 @@
- #include <stdbool.h>
- #include <sys/vfs.h>
- 
--#ifdef HAVE_CLOSE_RANGE
-+#ifdef HAVE_LINUX_CLOSE_RANGE_H
- #include <linux/close_range.h>
- #endif
- 
-@@ -1477,7 +1477,7 @@ static int close_inherited_fds(int cfd)
- 	if (cfd <= STDERR_FILENO)
- 		return -EINVAL;
- 
--#ifdef HAVE_CLOSE_RANGE
-+#ifdef HAVE_LINUX_CLOSE_RANGE_H
- 	if (cfd < STDERR_FILENO + 2) {
- 		close_range_loop(STDERR_FILENO + 1, cfd - 1, cfd);
- 	} else {
--- 
-2.39.5
-
diff --git a/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch b/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch
deleted file mode 100644
index 3bcff3d256..0000000000
--- a/package/libfuse3/0002-Fix-static_assert-build-failure-with-C-version-11.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5fafd1a33e9442811074604eeaa060578e589730 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 4 Apr 2025 22:17:49 +0200
-Subject: [PATCH] Fix static_assert build failure with C++ version < 11
-
-At the moment build fails due to lack of static_assert:
-https://gitlab.com/jolivain/buildroot/-/jobs/9606292537
-this means that the check per date is not enough, so let's use meson to
-check if static_assert() is present or not and simplify
-fuse_static_assert() definition by only checking HAVE_STATIC_ASSERT.
-
-Upstream: https://github.com/libfuse/libfuse/pull/1189
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- include/fuse_common.h | 4 +---
- meson.build           | 2 +-
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/include/fuse_common.h b/include/fuse_common.h
-index 77efc5d..582505f 100644
---- a/include/fuse_common.h
-+++ b/include/fuse_common.h
-@@ -30,9 +30,7 @@
- #define FUSE_MAKE_VERSION(maj, min)  ((maj) * 100 + (min))
- #define FUSE_VERSION FUSE_MAKE_VERSION(FUSE_MAJOR_VERSION, FUSE_MINOR_VERSION)
- 
--#if (defined(__cplusplus) && __cplusplus >= 201103L) ||        \
--	(!defined(__cplusplus) && defined(__STDC_VERSION__) && \
--	 __STDC_VERSION__ >= 201112L)
-+#ifdef HAVE_STATIC_ASSERT
- #define fuse_static_assert(condition, message) static_assert(condition, message)
- #else
- #define fuse_static_assert(condition, message)
-diff --git a/meson.build b/meson.build
-index 96c655c..bab98da 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,7 +72,7 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
- # Test for presence of some functions
- test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
-                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
--               'utimensat', 'copy_file_range', 'fallocate' ]
-+               'utimensat', 'copy_file_range', 'fallocate', 'static_assert' ]
- foreach func : test_funcs
-     private_cfg.set('HAVE_' + func.to_upper(),
-         cc.has_function(func, prefix: include_default, args: args_default))
--- 
-2.39.5
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index b6e919d56b..8b04af83d0 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  b81027fc8f444fb574de7f13edf0cf9810643d2935670c4fe19f140354241208  libfuse3-3.17.1.tar.gz
+sha256  9d34adf5bd979cd62479340d9854e6a424a7ead7ee632e4a6da104ec0796f923  libfuse3-3.17.2.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 768179797b..fbffc536ba 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.17.1
+LIBFUSE3_VERSION = 3.17.2
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
