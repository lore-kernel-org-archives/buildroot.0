Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF53C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:37:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EFA960F11
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EFA960F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E19882EB6;
	Sun, 25 Jul 2021 21:37:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-mFnO1nPfDc; Sun, 25 Jul 2021 21:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E2FB82CB7;
	Sun, 25 Jul 2021 21:37:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB5A41BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB2E040281
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLPaQJwiqT3b for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:37:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E413D40278
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:37:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 02FBD88FCC; Sun, 25 Jul 2021 21:03:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:36:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe68d894715e0cfd214444efb586f434802ae2c2
X-Git-Newrev: 766ac5d06501d7d7306c1e184a10ac99add9ea9f
X-Patchwork-Hint: ignore
Message-Id: <20210725210302.02FBD88FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haveged: bump version to 1.9.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=766ac5d06501d7d7306c1e184a10ac99add9ea9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change clock_gettime option from yes/no style to disable/enable one
  (still omitting the explicit disable to keep the configure logic
  defaulting to yes in case no rdtsc is available)

- change to set all available configure options:

  * '--enable-daemon': previous default

  * '--disable-diagnostic': previous default

  * '-disable-init': do not install init files as buildroot ships its
    own sysv/systemd init files

  * '--disable-nistest': disable tests, previous default

  * '--disable-enttest': new option, disable tests

  * '--disable-olt': previous default was yes, disable builtin test

  * '--enable-tune': previous default

- add patch to fix uclibc compile (disable dependency on sys/auxv.h
  introduced with upstream commit [1])

Changelog ([2]):

  - made enttest configurable
  - havegecmd.c - new command added to close the communication socket
    [Werner Fink]

[1] https://github.com/jirka-h/haveged/commit/26d35af198da01220ba4f7a1b987f17012476c00
[2] https://github.com/jirka-h/haveged/releases/tag/v1.9.14

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0001-Check-for-sys-auxv.h-before-using-it.patch | 60 ++++++++++++++++++++++
 package/haveged/haveged.hash                       |  2 +-
 package/haveged/haveged.mk                         | 22 +++++++-
 3 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
new file mode 100644
index 0000000000..042135f127
--- /dev/null
+++ b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
@@ -0,0 +1,60 @@
+From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Sun, 21 Mar 2021 17:00:08 +0100
+Subject: [PATCH] Check for sys/auxv.h before using it.
+
+- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
+
+Fixes:
+
+  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
+     22 | #include <sys/auxv.h>
+        |          ^~~~~~~~~~~~
+
+[Upstream: https://github.com/jirka-h/haveged/pull/59]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac  | 1 +
+ src/haveged.c | 4 ++++
+ 2 files changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index c172a10..a0263f5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -125,6 +125,7 @@ AC_CHECK_HEADERS(stdio.h)
+ AC_CHECK_HEADERS(stdlib.h)
+ AC_CHECK_HEADERS(string.h)
+ AC_CHECK_HEADERS(sys/ioctl.h)
++AC_CHECK_HEADERS(sys/auxv.h)
+ AC_CHECK_HEADERS(sys/mman.h)
+ AC_CHECK_HEADERS(sys/types.h)
+ AC_CHECK_HEADERS(sys/socket.h)
+diff --git a/src/haveged.c b/src/haveged.c
+index b9cb77b..dad3072 100644
+--- a/src/haveged.c
++++ b/src/haveged.c
+@@ -19,7 +19,9 @@
+  ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
+  */
+ #include "config.h"
++#if defined(HAVE_SYS_AUXV_H)
+ #include <sys/auxv.h>
++#endif
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <getopt.h>
+@@ -135,8 +137,10 @@ int main(int argc, char **argv)
+ {
+    volatile char *path = strdup(argv[0]);
+    volatile char *arg0 = argv[0];
++#if defined(HAVE_SYS_AUXV_H)
+    if (path[0] != '/')
+       path = (char*)getauxval(AT_EXECFN);
++#endif
+    static const char* cmds[] = {
+       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
+       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
+-- 
+2.30.2
+
diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index df8c48e214..f55e004923 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d17bd22fa1745daca5ac72e014ed3b0fe5720da4c115953124b1bf2a0aa2b04b  haveged-1.9.13.tar.gz
+sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 3980f80132..5d76bdc3c9 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,14 +4,32 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.13
+HAVEGED_VERSION = 1.9.14
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 HAVEGED_SELINUX_MODULES = entropyd
+# patch touching configure.ac
+HAVEGED_AUTORECONF = YES
+
+# '--disable-init' as buildroot ships its own sysv/systemd init files
+HAVEGED_CONF_OPTS = \
+	--enable-daemon \
+	--disable-diagnostic \
+	--disable-init \
+	--disable-nistest \
+	--disable-enttest \
+	--disable-olt \
+	--enable-tune
 
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
-HAVEGED_CONF_OPTS += --enable-clock_gettime=yes
+HAVEGED_CONF_OPTS += --enable-clock_gettime
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+HAVEGED_CONF_OPTS += --enable-threads
+else
+HAVEGED_CONF_OPTS += --disable-threads
 endif
 
 define HAVEGED_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
