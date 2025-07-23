Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0613CC83F17
	for <buildroot@archiver.kernel.org>; Wed, 23 Jul 2025 21:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07AD8126C;
	Wed, 23 Jul 2025 21:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id loo0Tmog7lob; Wed, 23 Jul 2025 21:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A6BA812C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A6BA812C8;
	Wed, 23 Jul 2025 21:36:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D37E2DA
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0CE540F6E
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9N8lYUIAUbng for <buildroot@buildroot.org>;
 Wed, 23 Jul 2025 21:36:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22FE340F01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22FE340F01
 for <buildroot@buildroot.org>; Wed, 23 Jul 2025 21:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE80D86A00; Wed, 23 Jul 2025 21:36:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Jul 2025 23:29:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7be91747f8df62fe1e06ec7477fc187990edbb1f
X-Git-Newrev: 9da4457345d6f151dcbf0639e10631ef4e46e078
X-Patchwork-Hint: ignore
Message-Id: <20250723213610.EE80D86A00@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.17.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9da4457345d6f151dcbf0639e10631ef4e46e078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.3

Drop local patches that are upstreamed now.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../libfuse3/0001-Fix-meson-function-tests.patch   | 121 ---------------------
 ...ld-make-special_funcs-check-more-reliable.patch |  41 -------
 package/libfuse3/libfuse3.hash                     |   2 +-
 package/libfuse3/libfuse3.mk                       |   2 +-
 4 files changed, 2 insertions(+), 164 deletions(-)

diff --git a/package/libfuse3/0001-Fix-meson-function-tests.patch b/package/libfuse3/0001-Fix-meson-function-tests.patch
deleted file mode 100644
index 7af9721337..0000000000
--- a/package/libfuse3/0001-Fix-meson-function-tests.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 4840ffe9e8610934d91b27061ff149cc74b41c28 Mon Sep 17 00:00:00 2001
-From: Bernd Schubert <bschubert@ddn.com>
-Date: Thu, 24 Apr 2025 16:49:08 +0200
-Subject: [PATCH] Fix meson function tests
-
-Several meson tests were incorrectly failing
-
-Checking for function "static_assert" : NO (cached)
-Checking for function "pthread_setname_np" : NO (cached)
-Check usable header "#include <linux/close_range.h>" : NO (cached)
-
-These functions get now tested with compilation tests
-and get found on my system.
-
-Checking if "static_assert check" compiles: YES
-Checking if "pthread_setname_np check" compiles: YES
-Checking if "close_range check" compiles: YES
-
-Upstream: https://github.com/libfuse/libfuse/commit/82bcd818fb3e7d5ced9b0c04b7b7a98a892e807e
-Signed-off-by: Bernd Schubert <bschubert@ddn.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build | 67 +++++++++++++++++++++++++++++++++++++++--------------
- 1 file changed, 49 insertions(+), 18 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index ba551ed..d1346d0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -59,6 +59,8 @@ include_default = '''
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#include <assert.h>     /* For static_assert */
-+#include <pthread.h>    /* For pthread_setname_np */
- '''
- args_default = [ '-D_GNU_SOURCE' ]
- 
-@@ -72,32 +74,61 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
- # Test for presence of some functions
- test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
-                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
--               'utimensat', 'copy_file_range', 'fallocate', 'static_assert',
--               'pthread_setname_np' ]
-+               'utimensat', 'copy_file_range', 'fallocate' ]
- foreach func : test_funcs
-     private_cfg.set('HAVE_' + func.to_upper(),
-         cc.has_function(func, prefix: include_default, args: args_default))
- endforeach
--private_cfg.set('HAVE_SETXATTR', 
--        cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
--private_cfg.set('HAVE_ICONV', 
--        cc.has_function('iconv', prefix: '#include <iconv.h>'))
--private_cfg.set('HAVE_BACKTRACE',
--        cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
- 
--# Test if headers exist
--private_cfg.set('HAVE_LINUX_CLOSE_RANGE_H',
--        cc.check_header('#include <linux/close_range.h>'))
-+# Special case checks that need custom code
-+special_funcs = {
-+    'static_assert': '''
-+        #include <assert.h>
-+        static_assert(1, "test");
-+        int main(void) { return 0; }
-+    ''',
-+    'pthread_setname_np': '''
-+        #include <pthread.h>
-+        int main(void) {
-+            pthread_t thread = pthread_self();
-+            pthread_setname_np(thread, "test");
-+            return 0;
-+        }
-+    ''',
-+    'close_range': '''
-+        #include <unistd.h>
-+        #include <fcntl.h>
-+        #include <linux/close_range.h>
-+        int main(void) {
-+            unsigned int flags = CLOSE_RANGE_UNSHARE;
-+            return close_range(3, ~0U, flags);
-+        }
-+    '''
-+}
-+
-+foreach name, code : special_funcs
-+    private_cfg.set('HAVE_' + name.to_upper(),
-+        cc.compiles(code, args: ['-Werror'] + args_default,
-+                 name: name + ' check'))
-+endforeach
-+
-+# Regular function checks
-+private_cfg.set('HAVE_SETXATTR',
-+    cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
-+private_cfg.set('HAVE_ICONV',
-+    cc.has_function('iconv', prefix: '#include <iconv.h>'))
-+private_cfg.set('HAVE_BACKTRACE',
-+    cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
- 
--# Test if structs have specific member
-+# Struct member checks
- private_cfg.set('HAVE_STRUCT_STAT_ST_ATIM',
--         cc.has_member('struct stat', 'st_atim',
--                       prefix: include_default,
--                       args: args_default))
-+    cc.has_member('struct stat', 'st_atim',
-+                  prefix: include_default + '#include <sys/stat.h>',
-+                  args: args_default))
- private_cfg.set('HAVE_STRUCT_STAT_ST_ATIMESPEC',
--         cc.has_member('struct stat', 'st_atimespec',
--                       prefix: include_default,
--                       args: args_default))
-+    cc.has_member('struct stat', 'st_atimespec',
-+                  prefix: include_default + '#include <sys/stat.h>',
-+                  args: args_default))
- 
- #
- # Compiler configuration
--- 
-2.39.5
-
diff --git a/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch b/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
deleted file mode 100644
index dccaf52326..0000000000
--- a/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 6f50c950d09ad09339437b81ce22b36e0e2749c9 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 25 Apr 2025 19:00:14 +0200
-Subject: [PATCH] meson.build: make special_funcs check more reliable
-
-Unfortunately while cross-compiling with build tools like Buildroot it
-happens to have repeated flags or anything that could lead to a warning.
-This way the check fails because of a warning not related to the special
-function. So let's use cc.links() and increase minimum meson_version to
-0.60 since cc.links() has been added during that version.
-
-Upstream: https://github.com/libfuse/libfuse/commit/8e226c6af6f386a88ed53d0a0940ff6b869b372d
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index d1346d0..d3d236d 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1,6 +1,6 @@
- project('libfuse3', ['c'],
-         version: '3.17.2',
--        meson_version: '>= 0.51.0',
-+        meson_version: '>= 0.60.0',
-         default_options: [
-             'buildtype=debugoptimized',
-             'c_std=gnu11',
-@@ -108,7 +108,7 @@ special_funcs = {
- 
- foreach name, code : special_funcs
-     private_cfg.set('HAVE_' + name.to_upper(),
--        cc.compiles(code, args: ['-Werror'] + args_default,
-+        cc.links(code, args: args_default,
-                  name: name + ' check'))
- endforeach
- 
--- 
-2.39.5
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 8b04af83d0..73fe1a84d1 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  9d34adf5bd979cd62479340d9854e6a424a7ead7ee632e4a6da104ec0796f923  libfuse3-3.17.2.tar.gz
+sha256  99dcab8a4be0e5d3c44f882ab9d4a711533f8cb4a4298e41175ff9bb63770fe5  libfuse3-3.17.3.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index fbffc536ba..6b6723dafc 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.17.2
+LIBFUSE3_VERSION = 3.17.3
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
