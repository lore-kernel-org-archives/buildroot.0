Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E22A1E82CC8
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 19:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921C4402CC;
	Wed, 27 Sep 2023 19:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921C4402CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ki5C4ExKwqan; Wed, 27 Sep 2023 19:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D1E740097;
	Wed, 27 Sep 2023 19:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D1E740097
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 53D191BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D76960AB3
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 19:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D76960AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J08noPMGyleK for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94C2960670
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C2960670
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82D2B82767; Wed, 27 Sep 2023 19:16:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 21:11:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7cd67517c97cfaed4316faab3015482a93794af
X-Git-Newrev: 197d0a4cb26d1fca3b7efaf1682a36aaaec253a2
X-Patchwork-Hint: ignore
Message-Id: <20230927191659.82D2B82767@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sg3_utils: bump to version 1.48
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

commit: https://git.buildroot.net/buildroot/commit/?id=197d0a4cb26d1fca3b7efaf1682a36aaaec253a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version) and so drop autoreconf
- Update hash of BSD_LICENSE (update in year:
  https://github.com/hreinecke/sg3_utils/commit/551657bfbf3b571a7b8ca6e489a407cb22eab387)

https://github.com/hreinecke/sg3_utils/blob/v1.48/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 --
 .../0001-src-sg_dd.c-fix-musl-build.patch          | 39 ----------------------
 .../0002-configure.ac-fix-uclibc-ng-build.patch    | 36 --------------------
 package/sg3_utils/sg3_utils.hash                   |  4 +--
 package/sg3_utils/sg3_utils.mk                     |  4 +--
 5 files changed, 3 insertions(+), 82 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 95ea697c49..1040dba905 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1304,8 +1304,6 @@ package/ser2net/S50ser2net Indent Shellcheck Variables
 package/setools/0001-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch Upstream
 package/setserial/0001-build-system-fix.patch Upstream
 package/setserial/0002-tiocghayesesp-build-fix.patch Upstream
-package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch Upstream
-package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch Upstream
 package/shadowsocks-libev/0001-configure.ac-use-pkg-config-to-find-netfilter_conntr.patch Upstream
 package/shadowsocks-libev/0002-fix-maybe-uninitialized-errors.patch Upstream
 package/shadowsocks-libev/0003-lib-Makefile.am-remove-static-from-LDFLAGS.patch Upstream
diff --git a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch b/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
deleted file mode 100644
index 50a81a78a4..0000000000
--- a/package/sg3_utils/0001-src-sg_dd.c-fix-musl-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c93ad13ecd8ddfbb8bb3e4d5d5ad7f3f2c633db6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 14 Nov 2021 12:37:16 +0100
-Subject: [PATCH] src/sg_dd.c: fix musl build
-
-Fix the following build failure on musl raised since version 1.47 and
-https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675:
-
-sg_dd.c: In function 'main':
-sg_dd.c:2402:17: error: unknown type name 'uint'; did you mean 'int'?
- 2402 |                 uint off;
-      |                 ^~~~
-      |                 int
-
-Fixes:
- - http://autobuild.buildroot.org/results/9ead59ffefefe2a4e3b94a153b3d23231736d882
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/7]
----
- src/sg_dd.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sg_dd.c b/src/sg_dd.c
-index 9d05c93..35e2423 100644
---- a/src/sg_dd.c
-+++ b/src/sg_dd.c
-@@ -2399,7 +2399,7 @@ main(int argc, char * argv[])
-             res = blocks * blk_sz;
-             if (iflag.zero && iflag.ff && (blk_sz >= 4)) {
-                 uint32_t pos = (uint32_t)skip;
--                uint off;
-+                uint32_t off;
- 
-                 for (k = 0, off = 0; k < blocks; ++k, off += blk_sz, ++pos) {
-                     for (j = 0; j < (blk_sz - 3); j += 4)
--- 
-2.33.0
-
diff --git a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch b/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
deleted file mode 100644
index 4c475ee1ff..0000000000
--- a/package/sg3_utils/0002-configure.ac-fix-uclibc-ng-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 1e95d5b8c507a49f6d15d2795dc46d82b4d1ded0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 16 Nov 2021 08:41:48 +0100
-Subject: [PATCH] configure.ac: fix uclibc-ng build
-
-Fix the following build failure with uclibc-ng raised because SG_IO is
-not defined:
-
-/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: sg_dd.o: in function `sg_read_low.constprop.0':
-sg_dd.c:(.text+0xc6c): undefined reference to `sg_chk_n_print3'
-
-Fixes:
- - http://autobuild.buildroot.org/results/38a0dfc70a21ce574368b7a485deb231f778b3e7
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/doug-gilbert/sg3_utils/pull/8]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0a65d94..23378ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -107,7 +107,7 @@ case "${host}" in
- 		AC_DEFINE_UNQUOTED(HAVE_NVME, 1, [Found NVMe])
- 		check_for_getrandom
-                 CFLAGS="$CFLAGS -D__USE_MINGW_ANSI_STDIO";;
--        *-*-linux-gnu* | *-*-linux*)
-+        *-*-linux-gnu* | *-*-linux* | *-*-uclinux-gnu* | *-*-uclinux*)
-                 AC_DEFINE_UNQUOTED(SG_LIB_LINUX, 1, [sg3_utils on linux])
- 		check_for_linux_sg_v4_hdr
- 		check_for_getrandom
--- 
-2.33.0
-
diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
index ff2ef55180..0a06595a31 100644
--- a/package/sg3_utils/sg3_utils.hash
+++ b/package/sg3_utils/sg3_utils.hash
@@ -1,6 +1,6 @@
 # Locally calculated from download (no sig, hash)
-sha256  ddb0cab85fedd8b0db020f3e3f02f6967a055616bf16ea9d5c7408cde41472b2  sg3_utils-1.47.tar.xz
+sha256  d6b9a41690d540e58d1e99c26ac8db37336c849ef6a03f96ea48ca2fe334dbfa  sg3_utils-1.48.tar.xz
 
 # Hash for license files
 sha256  d212debdb0a5d7754c977f6dc53bb6c88b4ace7ab784ddbccd06bb970adb1a37  COPYING
-sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
+sha256  6b1a1de0b3394002973daaa407b93a1d2c13efd8dd1a32095d6872c36f09ba66  BSD_LICENSE
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index b291bd69d9..3d85a59a57 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SG3_UTILS_VERSION = 1.47
+SG3_UTILS_VERSION = 1.48
 SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
 SG3_UTILS_SITE = http://sg.danny.cz/sg/p
 SG3_UTILS_LICENSE = BSD-2-Clause (library)
@@ -13,8 +13,6 @@ ifeq ($(BR2_PACKAGE_SG3_UTILS_PROGS),y)
 SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
-# We're patching configure.ac
-SG3_UTILS_AUTORECONF = YES
 
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
