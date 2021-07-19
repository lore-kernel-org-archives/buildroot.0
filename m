Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A9DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:53:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CDCB61037
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CDCB61037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB54260ADA;
	Tue,  3 Aug 2021 23:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjjFDOgea45S; Tue,  3 Aug 2021 23:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0586360AD1;
	Tue,  3 Aug 2021 23:52:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B56C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7789540EE3
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mndr5YDHacEs for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B48A640ED5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 079DD87059; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 19 Jul 2021 23:19:10 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bef89e381d0d698053a026d6a8cb0ded260bd074
X-Git-Newrev: 46a6b2c031c5ad28b75cb07092779a363786a237
X-Patchwork-Hint: ignore
Message-Id: <20210803211010.079DD87059@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rhash: bump to version
 1.4.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=46a6b2c031c5ad28b75cb07092779a363786a237
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patches (already in version)

https://github.com/rhash/RHash/releases/tag/v1.4.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-configure-allow-cross-compilation.patch   | 57 ----------------------
 .../rhash/0002-configure-add-uclinux-target.patch  | 36 --------------
 package/rhash/rhash.hash                           |  6 +--
 package/rhash/rhash.mk                             |  2 +-
 4 files changed, 4 insertions(+), 97 deletions(-)

diff --git a/package/rhash/0001-configure-allow-cross-compilation.patch b/package/rhash/0001-configure-allow-cross-compilation.patch
deleted file mode 100644
index 6a8f40f184..0000000000
--- a/package/rhash/0001-configure-allow-cross-compilation.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From a3d0ef352529217c9c32ce1a1b1db1420798cbe5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 10 Oct 2020 11:07:39 +0200
-Subject: [PATCH] configure: allow cross-compilation
-
-Some compilers are in fact a wrapper (e.g. to speed compilation with
-ccache or distcc, or as a cross-compiler wrapper). Those wrappers may
-not properly recognise the -v option, or may internally enforce some
-flags that conflict with -v.
-
-Use --version as a fall-back.
-
-With --version. the compiler will report its executable's basename, e.g.
-arm-linux-gcc not gcc. Catter for that by grepping for the compiler
-family name.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[yann.morin.1998@free.fr:
-  - retain "$CC -v" as default, fallback to "$CC --version"
-]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- configure | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index 9d72895..46491f7 100755
---- a/configure
-+++ b/configure
-@@ -513,9 +513,14 @@ else
-   CC_TMP="$CC"
-   test -n "$OPT_CC" && OTHER_CC= || OTHER_CC="gcc cc"
-   for CC in "$CC_TMP" $OTHER_CC; do
-+    cc_name_tmp=
-     if run_cmd "$CC -v"; then
-       cc_name_tmp=$($CC -v 2>&1 | tail -n 1 | cut -d ' ' -f 1)
--      if test "$cc_name_tmp" = "gcc"; then
-+    elif run_cmd "$CC --version"; then
-+      cc_name_tmp=$($CC --version 2>&1 | head -n 1 | cut -d ' ' -f 1)
-+    fi
-+    if test "${cc_name_tmp}"; then
-+      if echo "$cc_name_tmp" | grep -q "gcc"; then
-         cc_name=$cc_name_tmp
-         start_check "$CC version"
-         cc_vendor=gnu
-@@ -539,7 +544,7 @@ else
-         finish_check "$cc_name $cc_version"
-         break
-       fi
--      if $CC -v 2>&1 | grep -q "clang"; then
-+      if echo "$cc_name_tmp" | grep -q "clang"; then
-         start_check "$CC version"
-         cc_vendor=clang
-         cc_version=$($CC -dumpversion 2>&1)
--- 
-2.25.1
-
diff --git a/package/rhash/0002-configure-add-uclinux-target.patch b/package/rhash/0002-configure-add-uclinux-target.patch
deleted file mode 100644
index ca4a55644e..0000000000
--- a/package/rhash/0002-configure-add-uclinux-target.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 683f6875313cab9643402bb1710ebabb76e7c018 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 14 Jan 2021 08:37:06 +0100
-Subject: [PATCH] configure: add uclinux target
-
-Fix the following build failure with
---target=arm-buildroot-uclinux-uclibcgnueabi:
-
-Checking for target OS ... UNKNOWN
-
-Error: Unknown target OS, please specify the --target option
-
-Fixes:
- - http://autobuild.buildroot.org/results/598ca65cf0c7ecf9ceaecb75868b656570ae00d2
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index c8e1ea7..aae4dce 100755
---- a/configure
-+++ b/configure
-@@ -426,7 +426,7 @@ else
-     component=$1
-     part=$(echo $BUILD_TARGET | cut -d '-' -f $component)
-     case "$(echo $part | tr '[A-Z]' '[a-z]')" in
--      linux) TARGET_OS=Linux ;;
-+      linux|uclinux) TARGET_OS=Linux ;;
-       freebsd*) TARGET_OS=FreeBSD ;;
-       gnu/kfreebsd) TARGET_OS=FreeBSD ;;
-       netbsd) TARGET_OS=NetBSD ;;
--- 
-2.29.2
-
diff --git a/package/rhash/rhash.hash b/package/rhash/rhash.hash
index ba7bbb8ab7..e0555af3c2 100644
--- a/package/rhash/rhash.hash
+++ b/package/rhash/rhash.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/rhash/files/rhash/1.4.1/
-sha1  e1f559d060fd07bfca854c8ae3384798bd2ef266  rhash-1.4.1-src.tar.gz
+# From https://sourceforge.net/projects/rhash/files/rhash/1.4.2/
+sha1  fdb0b0c16f3ba3eba734b3adf9f2fc4c427ff987  rhash-1.4.2-src.tar.gz
 # Locally calculated
-sha256  430c812733e69b78f07ce30a05db69563450e41e217ae618507a4ce2e144a297  rhash-1.4.1-src.tar.gz
+sha256  600d00f5f91ef04194d50903d3c79412099328c42f28ff43a0bdb777b00bec62  rhash-1.4.2-src.tar.gz
 sha256  953e55838353335148c90b5a38a4894292680b1d4c37228ffddddbf18ce54bf5  COPYING
diff --git a/package/rhash/rhash.mk b/package/rhash/rhash.mk
index 92abcd29b0..d19c355cbb 100644
--- a/package/rhash/rhash.mk
+++ b/package/rhash/rhash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RHASH_VERSION = 1.4.1
+RHASH_VERSION = 1.4.2
 RHASH_SOURCE = rhash-$(RHASH_VERSION)-src.tar.gz
 RHASH_SITE = https://sourceforge.net/projects/rhash/files/rhash/$(RHASH_VERSION)
 RHASH_LICENSE = 0BSD
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
