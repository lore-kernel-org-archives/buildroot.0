Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE58BC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B70A612A9;
	Tue,  1 Apr 2025 19:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO4YJQoXprmx; Tue,  1 Apr 2025 19:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FD906114F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FD906114F;
	Tue,  1 Apr 2025 19:45:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FEA617E
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 392D54097F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpVQWJV6jgtv for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 19:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.41;
 helo=smtpcmd0641.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1CF3F40147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF3F40147
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1CF3F40147
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 19:45:09 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id zhXntP430qRlLzhXntBWw6; Tue, 01 Apr 2025 21:45:07 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  1 Apr 2025 21:45:06 +0200
Message-Id: <20250401194506.317668-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <46b77ff81a96ebcb9e707d4de114a79e@free.fr>
References: <46b77ff81a96ebcb9e707d4de114a79e@free.fr>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHrr8vZr6KCYbahl6pyTuWYPPOf/IoagU8p/GkEovlhkncnYfHFYOOlyPEkmUY91VTHrPvMd0THDIiRp8j4SU2CZoFDDTjouRrBWe6JZz2ppn5Nzvokd
 NFHNL0EC7OP3nANoEXlcofXB/DHbnQ8QtxArwh5IkaOICN31DNomBj26M2yYc4nX4q6ZKQzChlxGzP4JUC44VNVAQWz3f6biEdQWxK3WPCWA98vpUOTzhF3H
 t4WU8Icg1CabxP1wF3hPek7PF7swOFd9g8x7ADXMqqofCmPktNNZ9zy+GphGOi+/
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1743536707; bh=bP7qhIPMRY/HQc2UdIwoBzdUx0De9NqmbGSwWWScAhE=;
 h=From:To:Subject:Date:MIME-Version;
 b=H7w/0PBH+BBl1IU6NUDou7LuHWL/jPTXEwcXdZNNZyEXfcMuNN5vNka/Or1ygnA7z
 Qnt6C6taKgIhlAwHSavKbdnT+s2S6HgM+/xjR38mR0SkBEubc8RnINgsVnRWmmzIg6
 YO9WAxNdOQ5F/DYru99iVvi07Ime4HqvAlPZq0qVSIKZjQL4ANKg0w+GdAj2fRGtlP
 SbNxdgqoNP+OjLrYo6jT4NJXwzoThn+uZY7nQdCks2KGamL9X6hK5bAlTg/QI8Mjna
 czRi6yIskaTUFU9vzGUcSXBX4phYom01Za5xZAJgKvUx3MdUKcI36NRElEc+QQOQvx
 /MaHF4Y5ubyWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=H7w/0PBH
Subject: [Buildroot] [PATCH v2] package/libfuse3: bump to version 3.17.1
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

Add local patch pending upstream to fix build with linux version < 5.9.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* fix linux version < 5.9 build failure by adding local patch pending upstream
---
 .../0001-Fix-build-with-kernel-5.9.patch      | 72 +++++++++++++++++++
 package/libfuse3/libfuse3.hash                |  2 +-
 package/libfuse3/libfuse3.mk                  |  2 +-
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 package/libfuse3/0001-Fix-build-with-kernel-5.9.patch

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
index f5c9dae8f7..2fba6792cb 100644
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
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
