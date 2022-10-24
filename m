Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A735C67871
	for <buildroot@archiver.kernel.org>; Mon, 24 Oct 2022 21:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4119280D41;
	Mon, 24 Oct 2022 21:43:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4119280D41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ioMhO_8gDqSN; Mon, 24 Oct 2022 21:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A59980C27;
	Mon, 24 Oct 2022 21:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A59980C27
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8FA01BF30C
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D12E78132A
 for <buildroot@lists.busybox.net>; Mon, 24 Oct 2022 21:43:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12E78132A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kVFY8Rz8YRR for <buildroot@lists.busybox.net>;
 Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A172381327
 for <buildroot@buildroot.org>; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A172381327
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89D6487049; Mon, 24 Oct 2022 21:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Oct 2022 23:27:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58cc3977e83487bdaa1df232cf7adf6383d49cd7
X-Git-Newrev: 5a948e32fece110c6208c1b0fa1a05d55037a7e7
X-Patchwork-Hint: ignore
Message-Id: <20221024214302.89D6487049@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: bump to version 1.2.13
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5a948e32fece110c6208c1b0fa1a05d55037a7e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop all patches (already in version)
- Replace README by LICENSE file added with
  https://github.com/madler/zlib/commit/352cb28d12baf02863ff5d4d96be0587ced419a1

https://github.com/madler/zlib/releases/tag/v1.2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sue-that-discarded-provided-CC-definition.patch | 28 -----------------
 package/libzlib/0002-fix-CVE-2022-37434.patch      | 35 ----------------------
 .../0003-fix-CVE-2022-37434-regression.patch       | 32 --------------------
 package/libzlib/libzlib.hash                       |  4 +--
 package/libzlib/libzlib.mk                         |  7 ++---
 5 files changed, 4 insertions(+), 102 deletions(-)

diff --git a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch b/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
deleted file mode 100644
index 398e1c9481..0000000000
--- a/package/libzlib/0001-Fix-configure-issue-that-discarded-provided-CC-definition.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 05796d3d8d5546cf1b4dfe2cd72ab746afae505d Mon Sep 17 00:00:00 2001
-From: Mark Adler <madler@alumni.caltech.edu>
-Date: Mon, 28 Mar 2022 18:34:10 -0700
-Subject: [PATCH] Fix configure issue that discarded provided CC definition.
-
-Downloaded from upstream commit:
-https://github.com/madler/zlib/commit/05796d3d8d5546cf1b4dfe2cd72ab746afae505d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/configure b/configure
-index 52ff4a04e..3fa3e8618 100755
---- a/configure
-+++ b/configure
-@@ -174,7 +174,10 @@ if test -z "$CC"; then
-   else
-     cc=${CROSS_PREFIX}cc
-   fi
-+else
-+  cc=${CC}
- fi
-+
- cflags=${CFLAGS-"-O3"}
- # to force the asm version use: CFLAGS="-O3 -DASMV" ./configure
- case "$cc" in
diff --git a/package/libzlib/0002-fix-CVE-2022-37434.patch b/package/libzlib/0002-fix-CVE-2022-37434.patch
deleted file mode 100644
index a61be48536..0000000000
--- a/package/libzlib/0002-fix-CVE-2022-37434.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From eff308af425b67093bab25f80f1ae950166bece1 Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Sat, 30 Jul 2022 15:51:11 -0700
-Subject: [PATCH] Fix a bug when getting a gzip header extra field with
- inflate().
-
-If the extra field was larger than the space the user provided with
-inflateGetHeader(), and if multiple calls of inflate() delivered
-the extra header data, then there could be a buffer overflow of the
-provided space. This commit assures that provided space is not
-exceeded.
-
-Backported from: eff308af425b67093bab25f80f1ae950166bece1
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- inflate.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7be8c6366..7a7289749 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,9 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
-+                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
--                        state->head->extra != Z_NULL) {
--                        len = state->head->extra_len - state->length;
-+                        state->head->extra != Z_NULL &&
-+                        len < state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch b/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
deleted file mode 100644
index 46a58710d2..0000000000
--- a/package/libzlib/0003-fix-CVE-2022-37434-regression.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d Mon Sep 17 00:00:00 2001
-From: Mark Adler <fork@madler.net>
-Date: Mon, 8 Aug 2022 10:50:09 -0700
-Subject: [PATCH] Fix extra field processing bug that dereferences NULL
- state->head.
-
-The recent commit to fix a gzip header extra field processing bug
-introduced the new bug fixed here.
-
-Backported from: 1eb7682f845ac9e9bf9ae35bbfb3bad5dacbd91d
-Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
----
- inflate.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/inflate.c b/inflate.c
-index 7a7289749..2a3c4fe98 100644
---- a/inflate.c
-+++ b/inflate.c
-@@ -763,10 +763,10 @@ int flush;
-                 copy = state->length;
-                 if (copy > have) copy = have;
-                 if (copy) {
--                    len = state->head->extra_len - state->length;
-                     if (state->head != Z_NULL &&
-                         state->head->extra != Z_NULL &&
--                        len < state->head->extra_max) {
-+                        (len = state->head->extra_len - state->length) <
-+                            state->head->extra_max) {
-                         zmemcpy(state->head->extra + len, next,
-                                 len + copy > state->head->extra_max ?
-                                 state->head->extra_max - len : copy);
diff --git a/package/libzlib/libzlib.hash b/package/libzlib/libzlib.hash
index e6ca974e2f..df5e8d723a 100644
--- a/package/libzlib/libzlib.hash
+++ b/package/libzlib/libzlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  7db46b8d7726232a621befaab4a1c870f00a90805511c0e0090441dac57def18  zlib-1.2.12.tar.xz
+sha256  d14c38e313afc35a9a8760dadf26042f51ea0f5d154b0630a31da0540107fb98  zlib-1.2.13.tar.xz
 # License files, locally calculated
-sha256  fc2c3368901700f0acdeb1d8afeaca5923296768ec6824ecdf627aac396001fd  README
+sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index f75502326b..e344cc7ad9 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -4,19 +4,16 @@
 #
 ################################################################################
 
-LIBZLIB_VERSION = 1.2.12
+LIBZLIB_VERSION = 1.2.13
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
 LIBZLIB_SITE = http://www.zlib.net
 LIBZLIB_LICENSE = Zlib
-LIBZLIB_LICENSE_FILES = README
+LIBZLIB_LICENSE_FILES = LICENSE
 LIBZLIB_INSTALL_STAGING = YES
 LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
-# 0002-fix-CVE-2022-37434.patch
-LIBZLIB_IGNORE_CVES = CVE-2022-37434
-
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
