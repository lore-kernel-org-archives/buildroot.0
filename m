Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACDAC369C2
	for <buildroot@archiver.kernel.org>; Fri, 25 Apr 2025 22:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6E6160722;
	Fri, 25 Apr 2025 22:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKRrVOy1Kl4V; Fri, 25 Apr 2025 22:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B068E60677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B068E60677;
	Fri, 25 Apr 2025 22:31:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 33A1E31
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E06B605BD
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7gJEJAMXKUu for <buildroot@buildroot.org>;
 Fri, 25 Apr 2025 22:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.116;
 helo=smtpdh17-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 089C66059C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 089C66059C
Received: from smtpdh17-1.aruba.it (smtpdh17-1.aruba.it [62.149.155.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 089C66059C
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 22:31:43 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8Ra8uhJ6etfOn8Ra9uPwxN; Sat, 26 Apr 2025 00:31:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 26 Apr 2025 00:31:40 +0200
Message-Id: <20250425223140.2341210-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAtY/u/4UuCeOAzUzw0Q8yFM6hdM1l0/7ElxYZ8974DWR9UclXfwgd9JvYSNJUQ/2O6YfEdf1b1MQ9XGSHcXv0aOC27kaHbpqLdHh9xu3yZ0gg+CFXtQ
 IgrWMYV4zqIrH00UMCkwg9Bjdo0cLd65gBmtS/5BreELhwiqdK1LoDkPQ0Vgs9dt8HXsBcdNLma14ggWxJwLtImDKq0Pm1H0Ph+YaQ8N+vl7KkT458PwK/ID
 RRXVB9P9jWUWNtp2Mcgg9paEcGKndqFUjT5IlqrU5NA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1745620301; bh=NMaRkyYVTcIaIooGO4kxggK2fHeVvj/pM5fLP9J6deY=;
 h=From:To:Subject:Date:MIME-Version;
 b=hVavTn47/rOqfuKiRb/fnVayNBAhbkkj0UtTTxOMkj8R7NOIccC+MxBGs2t0VlyTR
 q1hOBsH67MrvomS783qcwp0mt1wOw8A0T3DSxGHZpL3zlX0wG5A+hX3zDJ1MKzHqfg
 QER0KRaqzmYH2gbajhvRKVHlBL6DUmwlkSlalz/zyMXTa93up3FypJmtTr/SoS6eRr
 WDQCP8UJ7hIpTACPYe77c1u6KykU7zxXPZTHrRJrbTNAsuX1dv66Zhg3gGYIonv8I7
 wH4jyqm/8oPezcHfrnG9QJP8p4SGrvWRQU3CfNUj0vXFZ9Bvtc4Pk+B3h7/wNoS6O3
 GtvhFS6vUu6tQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=hVavTn47
Subject: [Buildroot] [PATCH] package/libfuse3: fix build failure with no NPTL
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

Add local patches, one upstreamed and one pending upstream to fix the
presence of function pthread_setname_np in runtime.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 .../0001-Fix-meson-function-tests.patch       | 121 ++++++++++++++++++
 ...ke-special_funcs-check-more-reliable.patch |  41 ++++++
 2 files changed, 162 insertions(+)
 create mode 100644 package/libfuse3/0001-Fix-meson-function-tests.patch
 create mode 100644 package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch

diff --git a/package/libfuse3/0001-Fix-meson-function-tests.patch b/package/libfuse3/0001-Fix-meson-function-tests.patch
new file mode 100644
index 0000000000..7af9721337
--- /dev/null
+++ b/package/libfuse3/0001-Fix-meson-function-tests.patch
@@ -0,0 +1,121 @@
+From 4840ffe9e8610934d91b27061ff149cc74b41c28 Mon Sep 17 00:00:00 2001
+From: Bernd Schubert <bschubert@ddn.com>
+Date: Thu, 24 Apr 2025 16:49:08 +0200
+Subject: [PATCH] Fix meson function tests
+
+Several meson tests were incorrectly failing
+
+Checking for function "static_assert" : NO (cached)
+Checking for function "pthread_setname_np" : NO (cached)
+Check usable header "#include <linux/close_range.h>" : NO (cached)
+
+These functions get now tested with compilation tests
+and get found on my system.
+
+Checking if "static_assert check" compiles: YES
+Checking if "pthread_setname_np check" compiles: YES
+Checking if "close_range check" compiles: YES
+
+Upstream: https://github.com/libfuse/libfuse/commit/82bcd818fb3e7d5ced9b0c04b7b7a98a892e807e
+Signed-off-by: Bernd Schubert <bschubert@ddn.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 67 +++++++++++++++++++++++++++++++++++++++--------------
+ 1 file changed, 49 insertions(+), 18 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index ba551ed..d1346d0 100644
+--- a/meson.build
++++ b/meson.build
+@@ -59,6 +59,8 @@ include_default = '''
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
++#include <assert.h>     /* For static_assert */
++#include <pthread.h>    /* For pthread_setname_np */
+ '''
+ args_default = [ '-D_GNU_SOURCE' ]
+ 
+@@ -72,32 +74,61 @@ private_cfg.set_quoted('PACKAGE_VERSION', meson.project_version())
+ # Test for presence of some functions
+ test_funcs = [ 'fork', 'fstatat', 'openat', 'readlinkat', 'pipe2',
+                'splice', 'vmsplice', 'posix_fallocate', 'fdatasync',
+-               'utimensat', 'copy_file_range', 'fallocate', 'static_assert',
+-               'pthread_setname_np' ]
++               'utimensat', 'copy_file_range', 'fallocate' ]
+ foreach func : test_funcs
+     private_cfg.set('HAVE_' + func.to_upper(),
+         cc.has_function(func, prefix: include_default, args: args_default))
+ endforeach
+-private_cfg.set('HAVE_SETXATTR', 
+-        cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
+-private_cfg.set('HAVE_ICONV', 
+-        cc.has_function('iconv', prefix: '#include <iconv.h>'))
+-private_cfg.set('HAVE_BACKTRACE',
+-        cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
+ 
+-# Test if headers exist
+-private_cfg.set('HAVE_LINUX_CLOSE_RANGE_H',
+-        cc.check_header('#include <linux/close_range.h>'))
++# Special case checks that need custom code
++special_funcs = {
++    'static_assert': '''
++        #include <assert.h>
++        static_assert(1, "test");
++        int main(void) { return 0; }
++    ''',
++    'pthread_setname_np': '''
++        #include <pthread.h>
++        int main(void) {
++            pthread_t thread = pthread_self();
++            pthread_setname_np(thread, "test");
++            return 0;
++        }
++    ''',
++    'close_range': '''
++        #include <unistd.h>
++        #include <fcntl.h>
++        #include <linux/close_range.h>
++        int main(void) {
++            unsigned int flags = CLOSE_RANGE_UNSHARE;
++            return close_range(3, ~0U, flags);
++        }
++    '''
++}
++
++foreach name, code : special_funcs
++    private_cfg.set('HAVE_' + name.to_upper(),
++        cc.compiles(code, args: ['-Werror'] + args_default,
++                 name: name + ' check'))
++endforeach
++
++# Regular function checks
++private_cfg.set('HAVE_SETXATTR',
++    cc.has_function('setxattr', prefix: '#include <sys/xattr.h>'))
++private_cfg.set('HAVE_ICONV',
++    cc.has_function('iconv', prefix: '#include <iconv.h>'))
++private_cfg.set('HAVE_BACKTRACE',
++    cc.has_function('backtrace', prefix: '#include <execinfo.h>'))
+ 
+-# Test if structs have specific member
++# Struct member checks
+ private_cfg.set('HAVE_STRUCT_STAT_ST_ATIM',
+-         cc.has_member('struct stat', 'st_atim',
+-                       prefix: include_default,
+-                       args: args_default))
++    cc.has_member('struct stat', 'st_atim',
++                  prefix: include_default + '#include <sys/stat.h>',
++                  args: args_default))
+ private_cfg.set('HAVE_STRUCT_STAT_ST_ATIMESPEC',
+-         cc.has_member('struct stat', 'st_atimespec',
+-                       prefix: include_default,
+-                       args: args_default))
++    cc.has_member('struct stat', 'st_atimespec',
++                  prefix: include_default + '#include <sys/stat.h>',
++                  args: args_default))
+ 
+ #
+ # Compiler configuration
+-- 
+2.39.5
+
diff --git a/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch b/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
new file mode 100644
index 0000000000..c39794e62d
--- /dev/null
+++ b/package/libfuse3/0002-meson.build-make-special_funcs-check-more-reliable.patch
@@ -0,0 +1,41 @@
+From 6f50c950d09ad09339437b81ce22b36e0e2749c9 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 25 Apr 2025 19:00:14 +0200
+Subject: [PATCH] meson.build: make special_funcs check more reliable
+
+Unfortunately while cross-compiling with build tools like Buildroot it
+happens to have repeated flags or anything that could lead to a warning.
+This way the check fails because of a warning not related to the special
+function. So let's use cc.links() and increase minimum meson_version to
+0.60 since cc.links() has been added during that version.
+
+Upstream: https://github.com/libfuse/libfuse/pull/1211
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index d1346d0..d3d236d 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1,6 +1,6 @@
+ project('libfuse3', ['c'],
+         version: '3.17.2',
+-        meson_version: '>= 0.51.0',
++        meson_version: '>= 0.60.0',
+         default_options: [
+             'buildtype=debugoptimized',
+             'c_std=gnu11',
+@@ -108,7 +108,7 @@ special_funcs = {
+ 
+ foreach name, code : special_funcs
+     private_cfg.set('HAVE_' + name.to_upper(),
+-        cc.compiles(code, args: ['-Werror'] + args_default,
++        cc.links(code, args: args_default,
+                  name: name + ' check'))
+ endforeach
+ 
+-- 
+2.39.5
+
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
