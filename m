Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE5BC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EA06141C;
	Wed,  5 Apr 2023 20:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EA06141C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WL7--sBa1wBR; Wed,  5 Apr 2023 20:16:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6DE76142B;
	Wed,  5 Apr 2023 20:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6DE76142B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8333A1BF364
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58BF741917
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BF741917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIQrtFGOD8e0 for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05FB841903
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:16:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05FB841903
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E7870838DE; Wed,  5 Apr 2023 20:16:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:14:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b5b68df6011e654393d8750d860170422426f93
X-Git-Newrev: 13812ee16e5050fe13d86fea38f6142dcd585b53
X-Patchwork-Hint: ignore
Message-Id: <20230405201609.E7870838DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/daemon: bump to version 0.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=13812ee16e5050fe13d86fea38f6142dcd585b53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patches.

Update license to include mode licenses. Add license file hashes and
update hashes of existing files for added licenses, as well as
formatting and copyright date updates.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-daemon-fix-build-with-musl-libc-again.patch | 46 ----------------------
 .../0002-Fix-build-with-NDEBUG-defined.patch       | 46 ----------------------
 package/daemon/daemon.hash                         |  8 ++--
 package/daemon/daemon.mk                           |  6 +--
 4 files changed, 8 insertions(+), 98 deletions(-)

diff --git a/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch b/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
deleted file mode 100644
index 48d95f122f..0000000000
--- a/package/daemon/0001-daemon-fix-build-with-musl-libc-again.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From b879e6886498fdd147287bffdf5867378c7f3299 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 24 Jun 2021 14:28:10 +0300
-Subject: [PATCH] daemon: fix build with musl libc (again)
-
-Commit 6b28c54dd95b3 added HAVE_SYS_TTYDEFAULTS_H to guard
-sys/ttydefaults.h include. This breaks musl libc build because
-HAVE_SYS_TTYDEFAULTS_H is not defined until config.h is included.
-
-Move sys/ttydefaults.h include below config.h
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/raforg/daemon/pull/4
-
- daemon.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/daemon.c b/daemon.c
-index 5c5ef2cb86df..f88a0d49bf84 100644
---- a/daemon.c
-+++ b/daemon.c
-@@ -1011,9 +1011,6 @@ I<elogind(8)>
- #ifdef _RESTORE_POSIX_SOURCE
- #define _POSIX_SOURCE
- #endif
--#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
--#include <sys/ttydefaults.h>
--#endif
- #include <dirent.h>
- #include <sys/wait.h>
- #include <sys/stat.h>
-@@ -1037,6 +1034,10 @@ I<elogind(8)>
- #include <systemd/sd-login.h>
- #endif
- 
-+#ifdef HAVE_SYS_TTYDEFAULTS_H /* For CEOF in musl libc (Linux only) */
-+#include <sys/ttydefaults.h>
-+#endif
-+
- /* Configuration file entries */
- 
- typedef struct Config Config;
--- 
-2.30.2
-
diff --git a/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch b/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
deleted file mode 100644
index e99e9d8ed7..0000000000
--- a/package/daemon/0002-Fix-build-with-NDEBUG-defined.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fc84d8d572ffcecb533fd6d6d025abea12ce027e Mon Sep 17 00:00:00 2001
-Message-Id: <fc84d8d572ffcecb533fd6d6d025abea12ce027e.1622722814.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 3 Jun 2021 15:01:10 +0300
-Subject: [PATCH] Fix build with NDEBUG defined
-
-Build with NDEBUG fails because the debug() macro becomes empty. This
-creates invalid syntax with the debug() call is the only statement in
-the body of a 'for' loop.
-
-This fixes build failures like:
-
-daemon.c: In function 'show':
-daemon.c:3607:2: error: expected expression before '}' token
-  }
-  ^
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/raforg/daemon/pull/3
-
- libslack/err.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libslack/err.h b/libslack/err.h
-index 106bdb01e074..7acfbe46d60a 100644
---- a/libslack/err.h
-+++ b/libslack/err.h
-@@ -40,10 +40,10 @@
- #undef check
- 
- #ifdef NDEBUG
--#define debug(args)
--#define vdebug(args)
--#define debugsys(args)
--#define vdebugsys(args)
-+#define debug(args) do {} while (0);
-+#define vdebug(args) do {} while (0);
-+#define debugsys(args) do {} while (0);
-+#define vdebugsys(args) do {} while (0);
- #define check(cond, mesg) (void_cast(0))
- #else
- #define debug(args) debugf args;
--- 
-2.30.2
-
diff --git a/package/daemon/daemon.hash b/package/daemon/daemon.hash
index c490f71548..5ad7bf6ce2 100644
--- a/package/daemon/daemon.hash
+++ b/package/daemon/daemon.hash
@@ -1,5 +1,7 @@
 # From http://www.libslack.org/daemon/
-sha256  74f12e6d4b3c85632489bd08431d3d997bc17264bf57b7202384f2e809cff596  daemon-0.8.tar.gz
+sha256  b34b37543bba43bd086e59f4b754c8102380ae5c1728b987c890d5da4b4cf3ca  daemon-0.8.2.tar.gz
 # Locally calculated
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
-sha256  91329bb9be4ae0b7800081fa054e9bb760c60005b26958c1fb8461bc66bcd998  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
+sha256  35e31504fc0aec878e86900dde1d90a04404833c182f50d5678d873910bb11eb  COPYING
+sha256  5a93d5831e1297ab10fe643e1a631e83be392896da14ee2951285a79012df69d  LICENSES/BSD-3-Clause.txt
+sha256  aaf135472f81c5b4a0dca9367e5bb5e9750032b5bebe5442b36e4c0a47430df3  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index 96a163e597..5e7e497ff1 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-DAEMON_VERSION = 0.8
+DAEMON_VERSION = 0.8.2
 DAEMON_SITE = http://libslack.org/daemon/download
-DAEMON_LICENSE = GPL-2.0+
-DAEMON_LICENSE_FILES = LICENSE COPYING
+DAEMON_LICENSE = GPL-2.0+, LGPL-2.0+, BSD-3-Clause
+DAEMON_LICENSE_FILES = LICENSE COPYING LICENSES/BSD-3-Clause.txt LICENSES/GPL-2.0-or-later.txt
 
 define DAEMON_CONFIGURE_CMDS
 	(cd $(@D); ./configure)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
