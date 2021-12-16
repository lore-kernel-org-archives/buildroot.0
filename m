Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E3DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FADA401AD;
	Thu, 16 Dec 2021 18:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdOb91O24lEW; Thu, 16 Dec 2021 18:26:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7BD640B54;
	Thu, 16 Dec 2021 18:26:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CD1D1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A15883F09
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H-k6K1mJCmcr for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37C7E83F0C
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C487382297; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8de5996e5cad109baf8f79c0502f355e472e33b5
X-Git-Newrev: 2a28d25d0c61dfd040362c8af0896e73b4eaa71d
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.C487382297@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haveged: bump to version 1.9.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a28d25d0c61dfd040362c8af0896e73b4eaa71d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version) and so autoreconf

https://github.com/jirka-h/haveged/releases/tag/v1.9.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-Check-for-sys-auxv.h-before-using-it.patch | 60 ----------------------
 package/haveged/haveged.hash                       |  2 +-
 package/haveged/haveged.mk                         |  4 +-
 3 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
deleted file mode 100644
index 042135f127..0000000000
--- a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 21 Mar 2021 17:00:08 +0100
-Subject: [PATCH] Check for sys/auxv.h before using it.
-
-- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
-
-Fixes:
-
-  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
-     22 | #include <sys/auxv.h>
-        |          ^~~~~~~~~~~~
-
-[Upstream: https://github.com/jirka-h/haveged/pull/59]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac  | 1 +
- src/haveged.c | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c172a10..a0263f5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -125,6 +125,7 @@ AC_CHECK_HEADERS(stdio.h)
- AC_CHECK_HEADERS(stdlib.h)
- AC_CHECK_HEADERS(string.h)
- AC_CHECK_HEADERS(sys/ioctl.h)
-+AC_CHECK_HEADERS(sys/auxv.h)
- AC_CHECK_HEADERS(sys/mman.h)
- AC_CHECK_HEADERS(sys/types.h)
- AC_CHECK_HEADERS(sys/socket.h)
-diff --git a/src/haveged.c b/src/haveged.c
-index b9cb77b..dad3072 100644
---- a/src/haveged.c
-+++ b/src/haveged.c
-@@ -19,7 +19,9 @@
-  ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- #include "config.h"
-+#if defined(HAVE_SYS_AUXV_H)
- #include <sys/auxv.h>
-+#endif
- #include <stdlib.h>
- #include <stdio.h>
- #include <getopt.h>
-@@ -135,8 +137,10 @@ int main(int argc, char **argv)
- {
-    volatile char *path = strdup(argv[0]);
-    volatile char *arg0 = argv[0];
-+#if defined(HAVE_SYS_AUXV_H)
-    if (path[0] != '/')
-       path = (char*)getauxval(AT_EXECFN);
-+#endif
-    static const char* cmds[] = {
-       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
-       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
--- 
-2.30.2
-
diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index f55e004923..8c62ead7c3 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
+sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 5d76bdc3c9..7035142aee 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.14
+HAVEGED_VERSION = 1.9.15
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 HAVEGED_SELINUX_MODULES = entropyd
-# patch touching configure.ac
-HAVEGED_AUTORECONF = YES
 
 # '--disable-init' as buildroot ships its own sysv/systemd init files
 HAVEGED_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
