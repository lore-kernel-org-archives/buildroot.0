Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16779C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 13:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3B940AF0;
	Wed,  9 Mar 2022 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g25kZyrbkg1D; Wed,  9 Mar 2022 13:34:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EDC140ADE;
	Wed,  9 Mar 2022 13:34:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 169FF1BF869
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B522660F93
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 13:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jt0-pgbygTl for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 13:30:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A17DD60B15
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 13:30:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1799D83915; Wed,  9 Mar 2022 13:21:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 22:02:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 948050c0f9096953555ed7f84835c5297a415a6d
X-Git-Newrev: 0fc614345f1b8389df46b8f2d64cb3ae5a209b6d
X-Patchwork-Hint: ignore
Message-Id: <20220309132156.1799D83915@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poke: bump to version 2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fc614345f1b8389df46b8f2d64cb3ae5a209b6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tested locally with poke testsuite on aarch64 with Qemu:

         === poke Summary ===
 # of expected passes		6320
 # of unsupported tests		7

Build tested with test-pkg:
https://gitlab.com/kubu93/buildroot/-/pipelines/466516470

See:
http://www.jemarch.net/poke-2.0-relnotes.html
http://www.jemarch.net/poke-2.1-relnotes.html

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...c-HELP2MAN-replace-by-true-when-cross-com.patch |  6 ++---
 ...-getrandom.c-fix-build-with-uclibc-1.0.35.patch | 28 +++++++++++-----------
 package/poke/poke.hash                             |  2 +-
 package/poke/poke.mk                               |  2 +-
 4 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
index c169516153..85a76e068e 100644
--- a/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
+++ b/package/poke/0001-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
@@ -1,4 +1,4 @@
-From b35dadae6371c3727cac46ae5bd348b66aa411fc Mon Sep 17 00:00:00 2001
+From 51fb81264323f01a86dd0bdeaf1c7a044a9cb6dc Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Fri, 30 Apr 2021 15:43:59 +0200
 Subject: [PATCH] configure.ac: HELP2MAN replace ':' by 'true' when
@@ -17,10 +17,10 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 2c6f1aef..9c4c9be2 100644
+index a1943b57..c633f719 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -74,7 +74,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
+@@ -90,7 +90,7 @@ gl_LIBTEXTSTYLE_OPTIONAL([0.20.5])
  if test $cross_compiling = no; then
    AM_MISSING_PROG(HELP2MAN, help2man)
  else
diff --git a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
index 757dc3f760..bd20b5d2c6 100644
--- a/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
+++ b/package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch
@@ -1,4 +1,4 @@
-From a0594387565e1e6b4a8a8ba04ad13b135cc1f0b5 Mon Sep 17 00:00:00 2001
+From 236b019b83228d2e37fa07635fb6864ed7dc5fad Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Thu, 1 Apr 2021 07:49:46 +0200
 Subject: [PATCH] lib/getrandom.c: fix build with uclibc < 1.0.35
@@ -15,7 +15,7 @@ In file included from ./sys/random.h:40,
 /tmp/instance-0/output-1/host/x86_64-buildroot-linux-uclibc/sysroot/usr/include/sys/random.h:8:1: note: 'size_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
     7 | #include <features.h>
   +++ |+#include <stddef.h>
-    8 | 
+    8 |
 
 This patch is not upstreamable as it is only a workaround for
 uclibc < 1.0.35, upstream uclibc has been patched with
@@ -26,15 +26,15 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
- jitter/gnulib-local/getrandom.c | 1 +
- gl/getrandom.c                  | 1 +
  gl-libpoke/getrandom.c          | 1 +
+ gl/getrandom.c                  | 1 +
+ jitter/gnulib-local/getrandom.c | 1 +
  3 files changed, 3 insertions(+)
 
-diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/jitter/gnulib-local/getrandom.c
-+++ b/jitter/gnulib-local/getrandom.c
+diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
+index e146873..3948d8d 100644
+--- a/gl-libpoke/getrandom.c
++++ b/gl-libpoke/getrandom.c
 @@ -19,6 +19,7 @@
  
  #include <config.h>
@@ -44,7 +44,7 @@ index 41212fb32..0ad3f9648 100644
  
  #include <errno.h>
 diff --git a/gl/getrandom.c b/gl/getrandom.c
-index 41212fb32..0ad3f9648 100644
+index e146873..3948d8d 100644
 --- a/gl/getrandom.c
 +++ b/gl/getrandom.c
 @@ -19,6 +19,7 @@
@@ -55,10 +55,10 @@ index 41212fb32..0ad3f9648 100644
  #include <sys/random.h>
  
  #include <errno.h>
-diff --git a/gl-libpoke/getrandom.c b/gl-libpoke/getrandom.c
-index 41212fb32..0ad3f9648 100644
---- a/gl-libpoke/getrandom.c
-+++ b/gl-libpoke/getrandom.c
+diff --git a/jitter/gnulib-local/getrandom.c b/jitter/gnulib-local/getrandom.c
+index e146873..3948d8d 100644
+--- a/jitter/gnulib-local/getrandom.c
++++ b/jitter/gnulib-local/getrandom.c
 @@ -19,6 +19,7 @@
  
  #include <config.h>
@@ -68,5 +68,5 @@ index 41212fb32..0ad3f9648 100644
  
  #include <errno.h>
 -- 
-2.30.2
+2.31.1
 
diff --git a/package/poke/poke.hash b/package/poke/poke.hash
index 1367262f54..c30713b91c 100644
--- a/package/poke/poke.hash
+++ b/package/poke/poke.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce054df29560c921230132703ee449fe130b6e25ab03aa6cc796bb401506aa24  poke-1.4.tar.gz
+sha256  cd528e6c1bbc540c3b629c2b4f36b784b30a026b005a38b99283422599442670  poke-2.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  jitter/COPYING
diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index ddd03ae3b0..2852673548 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POKE_VERSION = 1.4
+POKE_VERSION = 2.1
 POKE_SITE = $(BR2_GNU_MIRROR)/poke
 # gnulib license is a mix/mess of public-domain and various GPL and LGPL versions.
 POKE_LICENSE = GPL-3.0+, GPL-3.0+ (jitter), gnulib license (gnulib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
