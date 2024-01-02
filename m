Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE96BC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E2364014B;
	Tue,  2 Jan 2024 22:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2364014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6a49MqlWkiwT; Tue,  2 Jan 2024 22:34:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 293E1404C2;
	Tue,  2 Jan 2024 22:34:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 293E1404C2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 67D711BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4071D8135F
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4071D8135F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muywj3AmB7ZH for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:34:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE3A08131D
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3A08131D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2ACE83D98; Tue,  2 Jan 2024 22:34:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:22:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f4abda15d3ca3ebd40d9de9cc808e605a71a0733
X-Git-Newrev: 52d405de45d77a737a78fdc3340df0cf32610903
X-Patchwork-Hint: ignore
Message-Id: <20240102223426.B2ACE83D98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.6.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=52d405de45d77a737a78fdc3340df0cf32610903
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches backported from this release.
Backport 2 patches from upstream ML needed for uClibc-ng on mips.

Require kernel 3.17 due getrandom() dependency.
Add host-util-linux to HOST_NFS_UTILS_DEPENDENCIES
(new uuid.h dependency).

Fixes:

  http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...c-libevent-and-libsqlite3-checked-when-nf.patch | 79 ----------------------
 ...fsidd-reexport-.c-Re-add-missing-includes.patch | 44 ++++++++++++
 ...ackend_sqlite.c-Add-missing-sys-syscall.h.patch | 31 +++++++++
 ...xport-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 ------------
 package/nfs-utils/Config.in                        |  5 +-
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  4 +-
 7 files changed, 82 insertions(+), 129 deletions(-)

diff --git a/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
deleted file mode 100644
index a6a6d56d7f..0000000000
--- a/package/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From bc4a5deef9f820c55fdac3c0070364c17cd91cca Mon Sep 17 00:00:00 2001
-From: Wiktor Jaskulski <wjaskulski@adva.com>
-Date: Thu, 11 May 2023 15:28:23 -0400
-Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
- disabled
-
-Upstream: https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- configure.ac | 38 +++++++++++++++-----------------------
- 1 file changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9df52e9c..6fbcb974 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -338,42 +338,34 @@ CPPFLAGS="${nfsutils_save_CPPFLAGS}"
- AC_CHECK_HEADER(uuid/uuid.h, ,
- 	AC_MSG_ERROR([Cannot find needed header file uuid/uuid.h. Install libuuid-devel]))
- 
-+dnl check for libevent libraries and headers
-+AC_LIBEVENT
-+
-+dnl Check for sqlite3
-+AC_SQLITE3_VERS
-+
-+case $libsqlite3_cv_is_recent in
-+yes) ;;
-+unknown)
-+   dnl do not fail when cross-compiling
-+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
-+*)
-+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
-+esac
-+
- if test "$enable_nfsv4" = yes; then
--  dnl check for libevent libraries and headers
--  AC_LIBEVENT
- 
-   dnl check for the keyutils libraries and headers
-   AC_KEYUTILS
- 
--  dnl Check for sqlite3
--  AC_SQLITE3_VERS
--
-   if test "$enable_nfsdcld" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
--    esac
-   fi
- 
-   if test "$enable_nfsdcltrack" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
--    esac
-   fi
- 
- else
--- 
-2.34.1
-
diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
new file mode 100644
index 0000000000..4f79af450e
--- /dev/null
+++ b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
@@ -0,0 +1,44 @@
+From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
+From: Petr Vorel <pvorel@suse.cz>
+Date: Tue, 5 Dec 2023 20:40:36 +0100
+Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
+
+Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
+<sys/un.h> for struct sockaddr_un.
+
+Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
+Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/
+---
+ support/reexport/fsidd.c    | 2 ++
+ support/reexport/reexport.c | 1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
+index 3e62b3fc..814fb48e 100644
+--- a/support/reexport/fsidd.c
++++ b/support/reexport/fsidd.c
+@@ -7,6 +7,8 @@
+ #include <dlfcn.h>
+ #endif
+ #include <event2/event.h>
++#include <sys/un.h>
++#include <unistd.h>
+
+ #include "conffile.h"
+ #include "reexport_backend.h"
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
+index 78516586..1900b336 100644
+--- a/support/reexport/reexport.c
++++ b/support/reexport/reexport.c
+@@ -7,6 +7,7 @@
+ #endif
+ #include <sys/types.h>
+ #include <sys/vfs.h>
++#include <unistd.h>
+ #include <errno.h>
+
+ #include "nfsd_path.h"
+--
+2.43.0
diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
new file mode 100644
index 0000000000..88e1a9068d
--- /dev/null
+++ b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
@@ -0,0 +1,31 @@
+From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Tue, 5 Dec 2023 23:20:33 +0100
+Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
+
+This fixes build on systems which actually needs getrandom()
+(to get SYS_getrandom).
+
+Fixes: f92fd6ca ("support/backend_sqlite.c: Add getrandom() fallback")
+Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
+Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Signed-off-by: Petr Vorel <pvorel@suse.cz>
+Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/
+---
+ support/reexport/backend_sqlite.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 0eb5ea37..54dfe447 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -7,6 +7,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <sys/syscall.h>
+ #include <unistd.h>
+
+ #ifdef HAVE_GETRANDOM
+--
+2.43.0
diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
deleted file mode 100644
index 6612847be7..0000000000
--- a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sun, 11 Jun 2023 08:57:11 +0200
-Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H
-
-Upstream: http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=8125c6f4ad156a9bad0dc2cc42e0243380fc478d
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- support/reexport/fsidd.c    | 2 ++
- support/reexport/reexport.c | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
-index 37649d06..d4b245e8 100644
---- a/support/reexport/fsidd.c
-+++ b/support/reexport/fsidd.c
-@@ -3,7 +3,9 @@
- #endif
- 
- #include <assert.h>
-+#ifdef HAVE_DLFCN_H
- #include <dlfcn.h>
-+#endif
- #include <event2/event.h>
- #include <limits.h>
- #include <stdint.h>
-diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
-index d597a2f7..d9a700af 100644
---- a/support/reexport/reexport.c
-+++ b/support/reexport/reexport.c
-@@ -2,7 +2,9 @@
- #include <config.h>
- #endif
- 
-+#ifdef HAVE_DLFCN_H
- #include <dlfcn.h>
-+#endif
- #include <stdint.h>
- #include <stdio.h>
- #include <sys/random.h>
--- 
-2.39.2
-
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index b4568dc6f3..02cc7e78cc 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -1,11 +1,12 @@
-comment "nfs-utils needs a toolchain w/ threads"
+comment "nfs-utils needs a toolchain w/ threads, headers >= 3.17"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
 config BR2_PACKAGE_NFS_UTILS
 	bool "nfs-utils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_SQLITE
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 015906553d..9d74991df1 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.3/sha256sums.asc
-sha256  38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1  nfs-utils-2.6.3.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.4/sha256sums.asc
+sha256  01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d  nfs-utils-2.6.4.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 3c85be0558..a11ba154ad 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.3
+NFS_UTILS_VERSION = 2.6.4
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -22,7 +22,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
