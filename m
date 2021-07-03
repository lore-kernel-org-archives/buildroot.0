Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7301C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26A7610CC
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A26A7610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739B9404E3;
	Wed,  4 Aug 2021 00:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 204vOurlLqnn; Wed,  4 Aug 2021 00:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31F5B4052E;
	Wed,  4 Aug 2021 00:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43C6C1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7B4040E68
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4sEGBpeYFzxk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC47540647
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 256FD87B09; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 23:11:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8bfdc2663de713776e35becc6a183ac529093b5c
X-Git-Newrev: 7b1524beef11cddd66a39a195dab565cb4a7b317
X-Patchwork-Hint: ignore
Message-Id: <20210803210959.256FD87B09@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgpg-error: bump to
 version 1.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b1524beef11cddd66a39a195dab565cb4a7b317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (not needed since
https://dev.gnupg.org/rE1fb90a7da186ee2ee098a666f6f3a35bb1720e59)

https://dev.gnupg.org/T5194

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-build-Fix-disable-threads.patch           | 39 ++++++++++++++++
 ...01-configure.ac-fix-build-without-threads.patch | 54 ----------------------
 package/libgpg-error/libgpg-error.hash             |  6 +--
 package/libgpg-error/libgpg-error.mk               |  4 +-
 4 files changed, 43 insertions(+), 60 deletions(-)

diff --git a/package/libgpg-error/0001-build-Fix-disable-threads.patch b/package/libgpg-error/0001-build-Fix-disable-threads.patch
new file mode 100644
index 0000000000..2d101aad9b
--- /dev/null
+++ b/package/libgpg-error/0001-build-Fix-disable-threads.patch
@@ -0,0 +1,39 @@
+From 220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Mon, 21 Jun 2021 12:16:20 +0900
+Subject: [PATCH] build: Fix --disable-threads.
+
+* src/gen-lock-obj.sh: Fix generating '}}}'.
+
+--
+
+GnuPG-bug-id: 5495
+Reported-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Fixes-commit: 1fb90a7da186ee2ee098a666f6f3a35bb1720e59
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+[Retrieved from:
+https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/gen-lock-obj.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
+index 258eec6..014667f 100755
+--- a/src/gen-lock-obj.sh
++++ b/src/gen-lock-obj.sh
+@@ -121,10 +121,10 @@ while test "$i" -lt $ac_mtx_size; do
+     fi
+     i=$(( i + 1 ))
+ done
++echo '}}}'
+ fi
+ 
+ cat <<'EOF'
+-}}}
+ ##
+ ## Local Variables:
+ ## mode: c
+-- 
+2.11.0
+
diff --git a/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch b/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch
deleted file mode 100644
index 5f5147e0df..0000000000
--- a/package/libgpg-error/0001-configure.ac-fix-build-without-threads.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 77c89f62f106d88ef2b5963f4a13755c337c793d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 15 Feb 2021 07:56:29 +0100
-Subject: [PATCH] configure.ac: fix build without threads
-
-Cross-compilation of libgpg-error fails on toolchain without threads
-since commit 988211d3d4c1f3d5cfa6b460210f65ab636763b5,
-9ee011259f819a3cf50fe7019fa4366dbc437e0e and
-50e62b36ea01ed25d12c443088b85d4f41a2b3e1
-
-Indeed, since that time, libgpg-error assumes that pthread.h is always
-available resulting in the following error at configure time:
-
-checking for arm-unknown-linux-gnueabi-objdump... (cached) /tmp/instance-1/output-1/host/bin/arm-linux-objdump
-conftest.c:1:10: fatal error: pthread.h: No such file or directory
-    1 | #include <pthread.h>
-      |          ^~~~~~~~~~~
-compilation terminated.
-configure: generated src/lock-obj-pub.native.h using arm-unknown-linux-gnueabi-objdump and gawk
-checking whether to enable log_clock... no
-
-This error will in turn results in a build failure because
-"Can't determine mutex size" is echoed by gen-lock-obj.sh:
-
-In file included from strsource-sym.c:27:
-./gpg-error.h:1115:4: warning: missing terminating ' character
- 1115 | Can't determine mutex size
-      |    ^
-
-Full build log:
-http://autobuild.buildroot.org/results/334/3344c96e5627a9327b0eabe0b27f34490bbabc0d/build-end.log
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://dev.gnupg.org/T5296]
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index b9a2a3e..15d9fdc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -599,7 +599,7 @@ if test x$cross_compiling = xyes; then
-   case $host in
-     *-*-linux*)
-     AC_CHECK_TOOL(OBJDUMP, [objdump])
--    if test -n "$OBJDUMP"; then
-+    if test -n "$OBJDUMP" -a x"$gl_use_threads" != xno; then
-       lock_obj_h_generated=yes
-       if test ! -d src; then mkdir src; fi
-       LOCK_ABI_VERSION=1 host=$host host_alias=$host_alias \
--- 
-2.30.0
-
diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 315c0965cf..4e124941cd 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,10 +1,10 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  66d6270511a48bac0bf347330e7a12c62f3a1ab4  libgpg-error-1.41.tar.bz2
+sha1  5e620d71fc24d287a7ac2460b1d819074bb8b9bb  libgpg-error-1.42.tar.bz2
 
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.41.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.42.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  64b078b45ac3c3003d7e352a5e05318880a5778c42331ce1ef33d1a0d9922742  libgpg-error-1.41.tar.bz2
+sha256  fc07e70f6c615f8c4f590a8e37a9b8dd2e2ca1e9408f8e60459c67452b925e23  libgpg-error-1.42.tar.bz2
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1b35e5c8f0..babcbdaded 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.41
+LIBGPG_ERROR_VERSION = 1.42
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
@@ -15,8 +15,6 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
 LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 LIBGPG_ERROR_CONF_OPTS = --disable-tests \
 		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
-# We're patching configure.ac
-LIBGPG_ERROR_AUTORECONF= YES
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBGPG_ERROR_CONF_OPTS += --enable-threads
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
