Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA70C611C8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA70C611C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79DB2403EB;
	Sun, 19 Sep 2021 07:14:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I2SueufM15ia; Sun, 19 Sep 2021 07:14:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE15403BB;
	Sun, 19 Sep 2021 07:14:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 595E71BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4901781D73
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClRMiZI1Uy6f for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:14:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DF5981D0C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:14:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 71F528B55A; Sun, 19 Sep 2021 07:12:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 09:12:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49b659b32db138219959c16cf0ff95ca1bd3730f
X-Git-Newrev: 8862c71837a2827e0f20409107ffe52072d4074a
X-Patchwork-Hint: ignore
Message-Id: <20210919071241.71F528B55A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.10.5
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8862c71837a2827e0f20409107ffe52072d4074a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump libfuse3 to version 3.10.5 and remove local patch that has been
upstreamed.

Release notes:
Various improvements to make unit tests more robust.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...1-meson.build-fix-wrong-.symver-detection.patch | 61 ----------------------
 package/libfuse3/libfuse3.hash                     |  2 +-
 package/libfuse3/libfuse3.mk                       |  2 +-
 3 files changed, 2 insertions(+), 63 deletions(-)

diff --git a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch b/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
deleted file mode 100644
index da20c26f19..0000000000
--- a/package/libfuse3/0001-meson.build-fix-wrong-.symver-detection.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 3aba09a5c56e017746c5c1652dbc845f4db7374a Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Tue, 3 Aug 2021 23:39:46 +0200
-Subject: [PATCH] meson.build: fix wrong .symver detection
-
-As pointed here [1] __has_attribute() is broken for many attributes and
-if it doesn't support the specific attribute it returns true, so we
-can't really rely on that for this check. This lead to Buildroot
-libfuse3 build failure [2] where that shows up with:
-```
-error: symver is only supported on ELF platforms
-```
-Indeed Microblaze doesn't support ELF since it doesn't include elfos.h,
-but __has_attribute(symver) returns true.
-
-So let's substitute the #ifdef __has_attribute() with a stronger test on
-a function foo() with __attribute__((symver ("test@TEST"))).
-
-[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766
-[2]: http://autobuild.buildroot.net/results/d6c/d6cfaf2aafaeda3c12d127f6a2d2e175b25e654f/build-end.log
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- meson.build | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index b0250ee..a7281f3 100644
---- a/meson.build
-+++ b/meson.build
-@@ -96,20 +96,18 @@ endif
- # to have __has_attribute, then they are too old to support symver)
- # other compilers might not have __has_attribute, but in those cases
- # it is safe for this check to fail and for us to fallback to the old _asm_
--# method for symver
-+# method for symver. Anyway the attributes not supported by __has_attribute()
-+# unfortunately return true giving a false positive. So let's try to build
-+# using __attribute__ ((symver )) and see the result.
- code = '''
--#if defined __has_attribute
--# if !__has_attribute (symver)
--# error symver attribute not supported
--# endif
--#else
--#error __has_attribute not defined, assume we do not have symver
--#endif
-+__attribute__ ((symver ("test@TEST")))
-+void foo(void) {
-+}
- 
- int main(void) {
-     return 0;
- }'''
--if cc.compiles(code, args: [ '-O0', '-c'])
-+if cc.compiles(code, args: [ '-O0', '-c', '-Werror'])
-      message('Compiler supports symver attribute')
-      add_project_arguments('-DHAVE_SYMVER_ATTRIBUTE', language: 'c')
- else
--- 
-2.25.1
-
diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 0414264bf8..cce2b11171 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  bfcb2520fd83db29e9fefd57d3abd5285f38ad484739aeee8e03fbec9b2d984a  libfuse3-3.10.4.tar.gz
+sha256  e73f75e58da59a0e333d337c105093c496c0fd7356ef3a5a540f560697c9c4e6  libfuse3-3.10.5.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index fc747c5bfd..767382271e 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.10.4
+LIBFUSE3_VERSION = 3.10.5
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
