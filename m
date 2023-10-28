Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E336C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2BA0442D9F;
	Sat, 28 Oct 2023 21:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2BA0442D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ajhLVveHczo4; Sat, 28 Oct 2023 21:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BC4042F34;
	Sat, 28 Oct 2023 21:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BC4042F34
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CFB61BF86D
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BEC18613C3
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEC18613C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rl5X6Rm7PSx3 for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F6B26139E
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F6B26139E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7847B85F52; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3499c75ccf8b481fb3499a218920a3e276b09fa9
X-Git-Newrev: 8716942ca68e98e384746c09871fedfb36c0f629
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.7847B85F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: security bump to version
 1.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=8716942ca68e98e384746c09871fedfb36c0f629
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- tests can be disabled since version 1.2.3 and
  https://github.com/zchunk/zchunk/commit/e2e3d6b14e944530837db43dd73413ce84a1e1f5
- docs can be disabled since version 1.2.3 and
  https://github.com/zchunk/zchunk/commit/af6c10e8be324d1194982c6a8db001f72d50dbf6
- Fix CVE-2023-46228: zchunk before 1.3.2 has multiple integer overflows
  via malformed zchunk files to lib/comp/comp.c, lib/comp/zstd/zstd.c,
  lib/dl/multipart.c, or lib/header.c.

https://github.com/zchunk/zchunk/compare/1.2.2...1.3.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |   2 -
 ...fix-argp-standalone-wrap-and-find_library.patch | 106 ---------------------
 .../0002-zck-declare-write_data-as-static.patch    |  34 -------
 package/zchunk/zchunk.hash                         |   2 +-
 package/zchunk/zchunk.mk                           |   3 +-
 5 files changed, 3 insertions(+), 144 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b1d0b93b32..bb23c60a25 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1542,8 +1542,6 @@ package/ympd/0002-added-forward-declarations.patch Upstream
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch Upstream
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch Upstream
 package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch Upstream
-package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch Upstream
-package/zchunk/0002-zck-declare-write_data-as-static.patch Upstream
 package/zic/0001-remove-dependency-check-on-version-file.patch Upstream
 package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch Upstream
 package/zip/0002-configure-Don-t-use-host-CPP.patch Upstream
diff --git a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch b/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
deleted file mode 100644
index 6c9cdba3ad..0000000000
--- a/package/zchunk/0001-meson-fix-argp-standalone-wrap-and-find_library.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 473c97cda44b95f5cea08a0cdd566e602df564db Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Thu, 21 Apr 2022 14:24:01 -0600
-Subject: [PATCH] meson: fix argp-standalone wrap and find_library
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-473c97cda44b95f5cea08a0cdd566e602df564db]
----
- .github/workflows/main.yml       | 27 ---------------------------
- meson.build                      |  6 +++---
- subprojects/argp-standalone.wrap |  7 +++++++
- 3 files changed, 10 insertions(+), 30 deletions(-)
- create mode 100644 subprojects/argp-standalone.wrap
-
-diff --git a/.github/workflows/main.yml b/.github/workflows/main.yml
-index c49806f..35667af 100644
---- a/.github/workflows/main.yml
-+++ b/.github/workflows/main.yml
-@@ -35,25 +35,11 @@ jobs:
-     steps:
-       - uses: actions/checkout@v2
- 
--      - uses: actions/checkout@v2
--        with:
--          repository: wolfv/argp-standalone
--          path: argp-standalone
--
-       - name: Install mamba
-         uses: mamba-org/provision-with-micromamba@main
-         with:
-           environment-file: .github/environment.yml
- 
--      - name: Compile argp-standalone
--        shell: cmd /C CALL {0}
--        run: |
--          CALL micromamba activate zchunk_test_env
--          cd argp-standalone
--          meson setup builddir
--          meson compile -C builddir --prefix=%CONDA_PREFIX%\Library
--          meson install -C builddir
--
-       - name: Compile zchunk
-         shell: cmd /C CALL {0}
-         run: |
-@@ -75,11 +61,6 @@ jobs:
-     steps:
-       - uses: actions/checkout@v2
- 
--      - uses: actions/checkout@v2
--        with:
--          repository: wolfv/argp-standalone
--          path: argp-standalone
--
-       - uses: actions/setup-python@v1
-         with:
-           python-version: '3.x'
-@@ -87,14 +68,6 @@ jobs:
-       - name: Install meson and ninja
-         run: pip install meson ninja
- 
--      - name: Compile argp-standalone
--        shell: cmd /C CALL {0}
--        run: |
--          cd argp-standalone
--          meson setup builddir
--          meson compile -C builddir
--          meson install -C builddir
--
-       - name: Compile zchunk
-         shell: cmd /C CALL {0}
-         run: |
-diff --git a/meson.build b/meson.build
-index 1c6b32d..aa7dd25 100644
---- a/meson.build
-+++ b/meson.build
-@@ -58,10 +58,10 @@ endif
- 
- # argp-standalone dependency (if required)
- if build_machine.system() == 'windows' or build_machine.system() == 'darwin' or build_machine.system() == 'freebsd' or not cc.links('#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct argp_state *state) { argp_usage(state); return 0; }; void main() {}')
--    if fs.is_dir(join_paths([get_option('prefix'), 'include']))
--        inc += include_directories(join_paths([get_option('prefix'), 'include']))
-+    argplib = cc.find_library('argp', has_headers : ['argp.h'], required: false)
-+    if not argplib.found()
-+        argplib = dependency('argp-standalone')
-     endif
--    argplib = cc.find_library('argp', dirs : join_paths([get_option('prefix'), 'lib']))
- else
-     argplib = dependency('', required : false)
- endif
-diff --git a/subprojects/argp-standalone.wrap b/subprojects/argp-standalone.wrap
-new file mode 100644
-index 0000000..14c0b63
---- /dev/null
-+++ b/subprojects/argp-standalone.wrap
-@@ -0,0 +1,7 @@
-+[wrap-git]
-+directory = argp-standalone-1.4.1
-+url = https://github.com/argp-standalone/argp-standalone.git
-+revision = 21855f34ec9997c37e1a08cd69497336513a5800
-+
-+[provide]
-+dependency_names = argp-standalone
--- 
-2.25.1
-
diff --git a/package/zchunk/0002-zck-declare-write_data-as-static.patch b/package/zchunk/0002-zck-declare-write_data-as-static.patch
deleted file mode 100644
index 3c48ab3d50..0000000000
--- a/package/zchunk/0002-zck-declare-write_data-as-static.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Wed, 4 May 2022 16:32:48 -0600
-Subject: [PATCH] zck: declare write_data as static
-
-This needs to be declared static to avoid a symbol conflict:
-io.c:(.text+0xe8): multiple definition of `write_data'; src/zck.p/zck.c.o:zck.c:(.text+0x1f4): first defined here
-
-Fixes:
- - http://autobuild.buildroot.net/results/225/22590a7038a40da3700d56c1f82f7dc74225702a
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-477c4e891bd4d9e41fcbaa07cd1a37c0975df5cc]
----
- src/zck.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/zck.c b/src/zck.c
-index 7727479..83b2630 100644
---- a/src/zck.c
-+++ b/src/zck.c
-@@ -159,7 +159,7 @@ static error_t parse_opt (int key, char *arg, struct argp_state *state) {
- 
- static struct argp argp = {options, parse_opt, args_doc, doc};
- 
--void write_data(zckCtx *zck, char *data, ssize_t in_size) {
-+static void write_data(zckCtx *zck, char *data, ssize_t in_size) {
-     if(zck_write(zck, data, in_size) < 0) {
-         LOG_ERROR("%s", zck_get_error(zck));
-         exit(1);
--- 
-2.25.1
-
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
index fa097d4ae0..15103a9ea0 100644
--- a/package/zchunk/zchunk.hash
+++ b/package/zchunk/zchunk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bc36f13b1bcb2ab52d046bfc3ec04a9bd1f89b070b4e8fca52eded235a583526  zchunk-1.2.2.tar.gz
+sha256  4d923d32af7db33f3c0a6655b258e857a2ca564912cf85ddce14e9b1b7d495bf  zchunk-1.3.2.tar.gz
 sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
index 2acdaba3a1..39d51ac352 100644
--- a/package/zchunk/zchunk.mk
+++ b/package/zchunk/zchunk.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-ZCHUNK_VERSION = 1.2.2
+ZCHUNK_VERSION = 1.3.2
 ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
 ZCHUNK_LICENSE = BSD-2-Clause
 ZCHUNK_LICENSE_FILES = LICENSE
 ZCHUNK_CPE_ID_VENDOR = zchunk
 ZCHUNK_INSTALL_STAGING = YES
+ZCHUNK_CONF_OPTS = -Ddocs=false -Dtests=false
 
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 ZCHUNK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
