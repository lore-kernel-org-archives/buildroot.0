Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8044DEB64D9
	for <buildroot@archiver.kernel.org>; Thu, 15 Jun 2023 06:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FE4F41728;
	Thu, 15 Jun 2023 06:56:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FE4F41728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cIlJYLQlOfhe; Thu, 15 Jun 2023 06:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BD00418FE;
	Thu, 15 Jun 2023 06:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BD00418FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F32F1BF48C
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 987A541F18
 for <buildroot@lists.busybox.net>; Thu, 15 Jun 2023 06:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 987A541F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7OXVRk33LNQ for <buildroot@lists.busybox.net>;
 Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7185C408CA
 for <buildroot@buildroot.org>; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7185C408CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BCD1837BE; Thu, 15 Jun 2023 06:55:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jun 2023 08:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38bef5fbc8c609241bb0fbcde310f5eb296537ae
X-Git-Newrev: 8bbcfc9ca57fe83411db14daf88febda80ea7cc7
X-Patchwork-Hint: ignore
Message-Id: <20230615065520.5BCD1837BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/f2fs-tools: bump to version 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8bbcfc9ca57fe83411db14daf88febda80ea7cc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now upstreamed patches.

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  2 -
 .../0001-configure-ac-fix-cross-compilation.patch  | 88 ----------------------
 ...2-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch | 34 ---------
 package/f2fs-tools/f2fs-tools.hash                 |  2 +-
 package/f2fs-tools/f2fs-tools.mk                   |  2 +-
 5 files changed, 2 insertions(+), 126 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c2316d1d4e..14c9bdbb7a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -444,8 +444,6 @@ package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch Upstream
 package/exim/S86exim Indent Variables
 package/expect/0001-enable-cross-compilation.patch Upstream
 package/expect/0002-allow-tcl-build-directory.patch Upstream
-package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch Upstream
-package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch Upstream
 package/faifa/0001-sha2.c-explicitly-include-endian.h-for-BYTE_ORDER-ma.patch Upstream
 package/faifa/0002-hpav_cfg.c-do-not-include-linux-if_ether.h-for-musl-.patch Upstream
 package/faifa/0003-Makefile.in-fix-asbolute-symlink-of-libfaifa.so.patch Upstream
diff --git a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch b/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
deleted file mode 100644
index 0e3d4da191..0000000000
--- a/package/f2fs-tools/0001-configure-ac-fix-cross-compilation.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 32e7d272344024c216f155c3463dd2d548f3fafd Mon Sep 17 00:00:00 2001
-From: Nick Hainke <vincent@systemli.org>
-Date: Mon, 4 Jul 2022 11:29:19 +0200
-Subject: configure.ac: fix cross compilation
-
-AC_CHECK_LIB seems to not work correctly with OpenWrt. Add possibility
-to disable lz4 and lzo2 manually.
-
-Fixes errors in the form of:
-  Package f2fsck is missing dependencies for the following libraries:
-  liblz4.so.1
-  liblzo2.so.2
-
-Signed-off-by: Nick Hainke <vincent@systemli.org>
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=32e7d272344024c216f155c3463dd2d548f3fafd]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure.ac | 44 ++++++++++++++++++++++++++++++++++----------
- 1 file changed, 34 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ea39461..dbe9ad3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -50,6 +50,18 @@ AC_ARG_WITH([blkid],
- 	[],
- 	[with_blkid=check])
- 
-+AC_ARG_WITH([lzo2],
-+	[AS_HELP_STRING([--without-lzo2],
-+	  [Ignore presence of liblzo2 and disable lzo2 support])],
-+	[],
-+	[with_lzo2=check])
-+
-+AC_ARG_WITH([lz4],
-+	[AS_HELP_STRING([--without-lz4],
-+	  [Ignore presence of liblz4 and disable lz4 support])],
-+	[],
-+	[with_lz4=check])
-+
- # Checks for programs.
- AC_PROG_CC
- AM_PROG_AR
-@@ -71,17 +83,29 @@ AS_IF([test "x$with_blkid" != xno],
-         fi
- 	], -lblkid)])
- 
--AC_CHECK_LIB([lzo2], [main],
--	[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
--		AC_DEFINE([HAVE_LIBLZO2], [1],
--		[Define if you have liblzo2])
--	], [], [])
-+AS_IF([test "x$with_lzo2" != xno],
-+	[AC_CHECK_LIB([lzo2], [main],
-+		[AC_SUBST([liblzo2_LIBS], ["-llzo2"])
-+			AC_DEFINE([HAVE_LIBLZO2], [1],
-+			[Define if you have liblzo2])
-+		],
-+		[if test "x$with_lzo2" != xcheck; then
-+			AC_MSG_FAILURE(
-+                [--with-lzo2 was given, but test for lzo2 failed])
-+        fi
-+	], -llzo2)])
- 
--AC_CHECK_LIB([lz4], [main],
--	[AC_SUBST([liblz4_LIBS], ["-llz4"])
--		AC_DEFINE([HAVE_LIBLZ4], [1],
--		[Define if you have liblz4])
--	], [], [])
-+AS_IF([test "x$with_lz4" != xno],
-+	[AC_CHECK_LIB([lz4], [main],
-+		[AC_SUBST([liblz4_LIBS], ["-llz4"])
-+			AC_DEFINE([HAVE_LIBLZ4], [1],
-+			[Define if you have liblz4])
-+		],
-+		[if test "x$with_lz4" != xcheck; then
-+			AC_MSG_FAILURE(
-+                [--with-lz4 was given, but test for lz4 failed])
-+        fi
-+	], -llz4)])
- 
- AS_IF([test "x$with_selinux" != xno],
- 	[AC_CHECK_LIB([selinux], [getcon],
--- 
-cgit 
-
diff --git a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch b/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
deleted file mode 100644
index b43def6bb7..0000000000
--- a/package/f2fs-tools/0002-f2fs-tools-fix-build-error-on-lz4-1-9-4.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 19f77c6f6277a274434d6d8883f50e7955c6a8db Mon Sep 17 00:00:00 2001
-From: Jaegeuk Kim <jaegeuk@kernel.org>
-Date: Mon, 29 Aug 2022 11:03:35 -0700
-Subject: f2fs-tools: fix build error on lz4-1.9.4
-
-LZ4_STREAMSIZE_U64 is undefined in new lz4 lib.
-
-Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
-[Retrieved from:
-https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?id=19f77c6f6277a274434d6d8883f50e7955c6a8db]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- fsck/compress.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/fsck/compress.c b/fsck/compress.c
-index b413492..b15f0a4 100644
---- a/fsck/compress.c
-+++ b/fsck/compress.c
-@@ -32,10 +32,7 @@
- #ifdef HAVE_LIBLZ4
- #define LZ4_MEMORY_USAGE		14
- #define LZ4_MAX_INPUT_SIZE		0x7E000000 /* 2 113 929 216 bytes */
--#ifndef LZ4_STREAMSIZE
--#define LZ4_STREAMSIZE			(LZ4_STREAMSIZE_U64 * sizeof(long long))
--#endif
--#define LZ4_MEM_COMPRESS		LZ4_STREAMSIZE
-+#define LZ4_MEM_COMPRESS		sizeof(LZ4_stream_t)
- #define LZ4_ACCELERATION_DEFAULT	1
- #define LZ4_WORK_SIZE			ALIGN_UP(LZ4_MEM_COMPRESS, 8)
- #endif
--- 
-cgit 
-
diff --git a/package/f2fs-tools/f2fs-tools.hash b/package/f2fs-tools/f2fs-tools.hash
index 8d5ff31f0d..d1f183afff 100644
--- a/package/f2fs-tools/f2fs-tools.hash
+++ b/package/f2fs-tools/f2fs-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  147d471040b44900283ce2c935f1d35d13d7f40008e7cb8fab2b69f54da01a4f  f2fs-tools-1.15.0.tar.gz
+sha256  208c7a07e95383fbd7b466b5681590789dcb41f41bf197369c41a95383b57c5e  f2fs-tools-1.16.0.tar.gz
 sha256  662abb3a8a80b36ae7036c289dd1e03b361ee5dd2e6fd5211d0d8d029146449f  COPYING
diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index f94244f2ad..a92ab4fe3e 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-F2FS_TOOLS_VERSION = 1.15.0
+F2FS_TOOLS_VERSION = 1.16.0
 F2FS_TOOLS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/snapshot
 F2FS_TOOLS_CONF_ENV = ac_cv_file__git=no
 F2FS_TOOLS_DEPENDENCIES = host-pkgconf util-linux
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
