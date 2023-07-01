Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400C5EB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 14:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBA860E15;
	Sat,  1 Jul 2023 14:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBA860E15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PfeUlfq1-R7e; Sat,  1 Jul 2023 14:00:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4AB960E3E;
	Sat,  1 Jul 2023 14:00:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4AB960E3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03B141BF616
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D218281D34
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 14:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D218281D34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E4sA3i1h3xjl for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBF6181C56
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF6181C56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADC1E85B78; Sat,  1 Jul 2023 14:00:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 15:59:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b838496f942e862f6283028cdf3123015d0664d
X-Git-Newrev: 62ad2ec2191f1b7f3803b5f8dd30dd1b7298796b
X-Patchwork-Hint: ignore
Message-Id: <20230701140030.ADC1E85B78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbsd: bump version to 0.11.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=62ad2ec2191f1b7f3803b5f8dd30dd1b7298796b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://archive.hadrons.org/software/libbsd/libbsd-0.11.4.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.5.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.6.announce
https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce

Removed patch which is included in upstream release:
https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/873639ebb5bc3688e5e78d71e5c0c49469498f46

Update hash of license file, which has changed due to:
- Copyright year updates
- Changes in list of files affected by the different license
- Removal of one part under BSD-4-Clause, but as there are still other
  parts under BSD-4-Clause, this doesn't change the overall license
  information in Buildroot

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-src-local-elf.h-fix-big-endian-sh.patch   | 39 ----------------------
 package/libbsd/libbsd.hash                         |  8 +++--
 package/libbsd/libbsd.mk                           |  2 +-
 4 files changed, 6 insertions(+), 44 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 5a7e1e32bc..373711b6bc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -701,7 +701,6 @@ package/libavl/0001-fix-makefile.patch Upstream
 package/libb64/0001-Integer-overflows.patch Upstream
 package/libb64/0002-Initialize-C++-objects.patch Upstream
 package/libblockdev/0001-Provide-replacement-function-for-strerror_l.patch Upstream
-package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch Upstream
 package/libcdaudio/0001-libcdaudio-enable-autoreconf.patch Upstream
 package/libcec/0001-cecloader-h-fix-null-return.patch Upstream
 package/libcgi/0001-CMakeLists.txt-honour-BUILD_TESTING.patch Upstream
diff --git a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch b/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
deleted file mode 100644
index 8612d268f8..0000000000
--- a/package/libbsd/0001-src-local-elf.h-fix-big-endian-sh.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 93c9f8aa72349a4fe33e2a732100c76f3904eb80 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 7 Jun 2022 19:27:13 +0200
-Subject: [PATCH] src/local-elf.h: fix big endian sh
-
-Fix the following build failure with big endian sh (e.g. sh4aeb):
-
-In file included from nlist.c:44:
-nlist.c: In function '__elf_is_okay__':
-local-elf.h:223:25: error: 'ELFDATA2LMSB' undeclared (first use in this function); did you mean 'ELFDATA2LSB'?
-  223 | #define ELF_TARG_DATA   ELFDATA2LMSB
-      |                         ^~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/2980fb79c208454195d77383f1ece9afbd7f981b
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://gitlab.freedesktop.org/libbsd/libbsd/-/merge_requests/19]
----
- src/local-elf.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/local-elf.h b/src/local-elf.h
-index 1dd3b42..8c4794f 100644
---- a/src/local-elf.h
-+++ b/src/local-elf.h
-@@ -230,7 +230,7 @@
- #if defined(__LITTLE_ENDIAN__)
- #define ELF_TARG_DATA	ELFDATA2LSB
- #elif defined(__BIG_ENDIAN__)
--#define ELF_TARG_DATA	ELFDATA2LMSB
-+#define ELF_TARG_DATA	ELFDATA2MSB
- #else
- #error Unknown SH endianness
- #endif
--- 
-2.35.1
-
diff --git a/package/libbsd/libbsd.hash b/package/libbsd/libbsd.hash
index 17bb32e01c..8b1af44758 100644
--- a/package/libbsd/libbsd.hash
+++ b/package/libbsd/libbsd.hash
@@ -1,3 +1,5 @@
-# From https://lists.freedesktop.org/archives/libbsd/2021-February/000305.html
-sha512  a7015ea1ffa3766b1a4690526a25231898ad8275149b31fb6801082450172249997c36165626d101ffce53b59767a46676eebc0806426922fe4e773a0376c1f5  libbsd-0.11.3.tar.xz
-sha256  ff2fdeeb0fe8bcb9045fe91d69e8312a5b477c54db48dffe34dd1c0d730c5864  COPYING
+# From https://archive.hadrons.org/software/libbsd/libbsd-0.11.7.announce
+sha256  9baa186059ebbf25c06308e9f991fda31f7183c0f24931826d83aa6abd8a0261  libbsd-0.11.7.tar.xz
+sha512  51fda4724f41dd8a4628afd58c21236a7588d9045e337e06eeabf83805a9aaaa53705441ca901ad11f1c65f18e881523bdc97721a7d3d6a5cced27f2450d09a2  libbsd-0.11.7.tar.xz
+# Locally computed
+sha256  7aab3a07716d31ca72e66c1073ef8a0fa0be0daa5df7c3b2cc0c668589142336  COPYING
diff --git a/package/libbsd/libbsd.mk b/package/libbsd/libbsd.mk
index 86df8a97a2..27937c4611 100644
--- a/package/libbsd/libbsd.mk
+++ b/package/libbsd/libbsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBSD_VERSION = 0.11.3
+LIBBSD_VERSION = 0.11.7
 LIBBSD_SOURCE = libbsd-$(LIBBSD_VERSION).tar.xz
 LIBBSD_SITE = https://libbsd.freedesktop.org/releases
 LIBBSD_LICENSE = BSD-2-Clause, BSD-3-Clause, BSD-4-Clause, BSD-5-Clause, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
