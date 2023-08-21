Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CD1EE4993
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 11:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4920281E66;
	Mon, 21 Aug 2023 11:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4920281E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0DPbsbMSlGhA; Mon, 21 Aug 2023 11:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B74581E6F;
	Mon, 21 Aug 2023 11:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B74581E6F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F00B11BF361
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C69D740134
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 11:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C69D740134
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rm0txmKFFq6L for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 11:17:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A59DF400D7
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 11:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A59DF400D7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A9685F56; Mon, 21 Aug 2023 11:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Aug 2023 13:16:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57ff5f7d2a9d2cf49e76a0c1e874fc1698eb7778
X-Git-Newrev: 2298de68530283f329147f0da9c5acd039ff561c
X-Patchwork-Hint: ignore
Message-Id: <20230821111744.92A9685F56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/file: bump version to
 5.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=2298de68530283f329147f0da9c5acd039ff561c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Patch is included upstream.
See here for Changes in 5.45:
https://mailman.astron.com/pipermail/file/2023-July/001205.html
See here for Changes in 5.44:
https://mailman.astron.com/pipermail/file/2022-December/001042.html

The hash of src/vasprintf.c, which is used as one of the license
files, has been updated due to source code changes that do not affect
the licensing terms.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 ...src-file.c-fix-build-without-wide-support.patch | 39 ----------------------
 package/file/file.hash                             |  6 ++--
 package/file/file.mk                               |  2 +-
 4 files changed, 4 insertions(+), 44 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e4a60e7aef..0956243143 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -449,7 +449,6 @@ package/ffmpeg/0003-libavutil-Fix-mips-build.patch Upstream
 package/ffmpeg/0004-configure-add-extralibs-to-extralibs_xxx.patch Upstream
 package/ficl/0001-fix-Makefile.patch Upstream
 package/ficl/0002-Makefile.linux-pass-LDFLAGS.patch Upstream
-package/file/0001-src-file.c-fix-build-without-wide-support.patch Upstream
 package/flatbuffers/0001-include-flatbuffers-base.h-fix-build-on-musl.patch Upstream
 package/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch Upstream
 package/flex/0002-build-make-it-possible-to-disable-the-build-of-the-f.patch Upstream
diff --git a/package/file/0001-src-file.c-fix-build-without-wide-support.patch b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
deleted file mode 100644
index 29be9fa2cd..0000000000
--- a/package/file/0001-src-file.c-fix-build-without-wide-support.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From f2ab09d0e1388657f6b7e62bacc383ebea91f5b9 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 26 Oct 2022 00:23:32 +0200
-Subject: [PATCH] src/file.c: fix build without wide support
-
-Fix the following build failure without wide support (e.g. on uclibc)
-raised since version 5.43 and
-https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:
-
-file.c: In function 'fname_print':
-file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
-  605 |    putc(c);
-      |          ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://bugs.astron.com/view.php?id=398]
----
- src/file.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/file.c b/src/file.c
-index f5f46524..1c23defc 100644
---- a/src/file.c
-+++ b/src/file.c
-@@ -615,7 +615,7 @@ fname_print(const char *inname)
- 	for (i = 0; i < n; i++) {
- 		unsigned char c = CAST(unsigned char, inname[i]);
- 		if (isprint(c)) {
--			putc(c);
-+			putc(c, stdout);
- 			continue;
- 		}
- 		file_octal(c);
--- 
-2.35.1
-
diff --git a/package/file/file.hash b/package/file/file.hash
index 49fa9e1e1b..08e8497471 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,7 +1,7 @@
 # Locally calculated after verifying signature
-# ftp://ftp.astron.com/pub/file/file-5.43.tar.gz.asc
+# ftp://ftp.astron.com/pub/file/file-5.45.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  8c8015e91ae0e8d0321d94c78239892ef9dbc70c4ade0008c0e95894abfb1991  file-5.43.tar.gz
+sha256  fc97f51029bb0e2c9f4e3bffefdaf678f0e039ee872b9de5c002a6d09c784d82  file-5.45.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  4ccb60d623884ef637af4a5bc16b2cb350163e2135e967655837336019a64462  src/mygetopt.h
-sha256  cc3d8704489d08eaefcaee8c639cc6436c6f0f6b2b03986d3ba7521a1a1d2fc9  src/vasprintf.c
+sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index 9b751e2696..5fc540bc9d 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.43
+FILE_VERSION = 5.45
 FILE_SITE = ftp://ftp.astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-4-Clause (one file), BSD-3-Clause (one file)
 FILE_LICENSE_FILES = COPYING src/mygetopt.h src/vasprintf.c
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
