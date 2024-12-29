Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F72AC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1921E4A612;
	Fri, 28 Feb 2025 16:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQwFLZ3rWSzb; Fri, 28 Feb 2025 16:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9DCD4EF7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DCD4EF7A;
	Fri, 28 Feb 2025 16:48:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B4B1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61CA342D41
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ryclq72TWkI for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DF6A42521
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DF6A42521
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4FC9686FB9; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 22:14:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 66a5f9bc742f517ad245e1ba0dcc8837205beedc
X-Git-Newrev: 37a33d865d15561ee37920dd283dd98ee13182eb
X-Patchwork-Hint: ignore
Message-Id: <20250228162953.4FC9686FB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nfs-utils: bump
 version to 2.8.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=37a33d865d15561ee37920dd283dd98ee13182eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

* disable junction and nfsdctl by default
* drop 2 local patches that have been committed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...fsidd-reexport-.c-Re-add-missing-includes.patch | 44 ----------------------
 ...ackend_sqlite.c-Add-missing-sys-syscall.h.patch | 31 ---------------
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  6 ++-
 4 files changed, 7 insertions(+), 78 deletions(-)

diff --git a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch b/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
deleted file mode 100644
index 4f79af450e..0000000000
--- a/package/nfs-utils/0001-reexport-fsidd-reexport-.c-Re-add-missing-includes.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4710e469cd0f512ac5e2c3c4335d8e21b97f21b0 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Tue, 5 Dec 2023 20:40:36 +0100
-Subject: [PATCH] reexport/{fsidd,reexport}.c: Re-add missing includes
-
-Older uClibc-ng requires <unistd.h> for close(2), unlink(2) and write(2),
-<sys/un.h> for struct sockaddr_un.
-
-Fixes: 1a4edb2a ("reexport/fsidd.c: Remove unused headers")
-Fixes: bdc79f02 ("support/reexport.c: Remove unused headers")
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-1-pvorel@suse.cz/
----
- support/reexport/fsidd.c    | 2 ++
- support/reexport/reexport.c | 1 +
- 2 files changed, 3 insertions(+)
-
-diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
-index 3e62b3fc..814fb48e 100644
---- a/support/reexport/fsidd.c
-+++ b/support/reexport/fsidd.c
-@@ -7,6 +7,8 @@
- #include <dlfcn.h>
- #endif
- #include <event2/event.h>
-+#include <sys/un.h>
-+#include <unistd.h>
-
- #include "conffile.h"
- #include "reexport_backend.h"
-diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
-index 78516586..1900b336 100644
---- a/support/reexport/reexport.c
-+++ b/support/reexport/reexport.c
-@@ -7,6 +7,7 @@
- #endif
- #include <sys/types.h>
- #include <sys/vfs.h>
-+#include <unistd.h>
- #include <errno.h>
-
- #include "nfsd_path.h"
---
-2.43.0
diff --git a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch b/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
deleted file mode 100644
index 88e1a9068d..0000000000
--- a/package/nfs-utils/0002-support-backend_sqlite.c-Add-missing-sys-syscall.h.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From aee92881ba80cf2ae7381d19f09e7fbeda57974c Mon Sep 17 00:00:00 2001
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Tue, 5 Dec 2023 23:20:33 +0100
-Subject: [PATCH] support/backend_sqlite.c: Add missing <sys/syscall.h>
-
-This fixes build on systems which actually needs getrandom()
-(to get SYS_getrandom).
-
-Fixes: f92fd6ca ("support/backend_sqlite.c: Add getrandom() fallback")
-Fixes: http://autobuild.buildroot.net/results/c5fde6099a8b228a8bdc3154d1e47dfa192e94ed/
-Reported-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream: https://lore.kernel.org/linux-nfs/20231205223543.31443-2-pvorel@suse.cz/
----
- support/reexport/backend_sqlite.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
-index 0eb5ea37..54dfe447 100644
---- a/support/reexport/backend_sqlite.c
-+++ b/support/reexport/backend_sqlite.c
-@@ -7,6 +7,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/syscall.h>
- #include <unistd.h>
-
- #ifdef HAVE_GETRANDOM
---
-2.43.0
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 9d74991df1..b4ecbd0aec 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.6.4/sha256sums.asc
-sha256  01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d  nfs-utils-2.6.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.1/sha256sums.asc
+sha256  a0be95b08396908048583fcf6b34a7c1ab49d53e8a12eb28673ccfd2eff0c505  nfs-utils-2.8.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 9ea3bae79d..4b008042ce 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.6.4
+NFS_UTILS_VERSION = 2.8.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
@@ -17,6 +17,8 @@ NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
 NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
 	--enable-ipv6 \
+	--disable-junction \
+	--disable-nfsdctl \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
@@ -30,6 +32,8 @@ HOST_NFS_UTILS_CONF_OPTS = \
 	--disable-gss \
 	--disable-uuid \
 	--disable-ipv6 \
+	--disable-junction \
+	--disable-nfsdctl \
 	--without-tcp-wrappers \
 	--with-statedir=/run/nfs \
 	--disable-caps \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
