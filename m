Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13E0EA71AD
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 22:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7ED960AA7;
	Sun, 19 Apr 2026 22:03:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYbfSm8GFJ_I; Sun, 19 Apr 2026 22:03:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C52461002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776636186;
	bh=9Uoe2iJvi8/nxXfPfGUX6YxqZNlvjw9j2bkVjMkVKe0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ek0sAqm7WH2YvIj3XdHM49aLpYN0Q981sOvHVjx1AAy/qD3FSoJDcdfdvoD1jE2cv
	 N9UHPTel+h/qSS/nDt0HFVC/I0uou6PDd8iG9MeIqxhqlCYhpcZND2LLrWEWSpiYSO
	 HOgR0V0ieN9E8TFOvIYYvOZAvso/LnP/iiQEfGdg1QUw2Q98Yw6ewVmEEbFVDb5fQA
	 FzDvk0BvPDMqh9HPSs/G6N/TqxDOXoKyZEC6ke52p9lxoFYt+8cwll8k3SicyFofxz
	 mAWDjJISWabXCkUBn6r6ubVqrB3kvNpgW9R83D7UAZnRlhTukMS+P5x8rnJkEzxu9M
	 obY6STnJhFsxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C52461002;
	Sun, 19 Apr 2026 22:03:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EA5D82B8
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D002C61002
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7a7EDKwikxsG for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D668660AA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D668660AA7
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C68E820E1; Sun, 19 Apr 2026 22:03:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 00:02:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 367f1c2ea2084aa3be415537c3c281753d491a5f
X-Git-Newrev: 23a3df15ed2a7499b52cbbf044c0129651fb2e75
X-Patchwork-Hint: ignore
Message-Id: <20260419220302.8C68E820E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: bump version to 2.9.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/23a3df15ed2a7499b52cbbf044c0129651fb2e75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add dependency to libnl that became mandatory with commit:
https://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commitdiff;h=d2fa3421f857e04de7f79cdf3114a0fe73983d25

Add 3 local patches pending upstream to fix build failures.

Release announce:
https://lore.kernel.org/linux-nfs/955a922e-c12d-435b-a698-caf73312f01d@redhat.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...h_key_file-fix-missing-string.h-inclusion.patch | 28 ++++++++
 ...ompat.h-file-to-deal-with-old-Linux-api-a.patch | 77 ++++++++++++++++++++++
 ...t-backend_sqlite.c-fix-getrandom-fallback.patch | 30 +++++++++
 package/nfs-utils/Config.in                        |  1 +
 package/nfs-utils/nfs-utils.hash                   |  4 +-
 package/nfs-utils/nfs-utils.mk                     |  6 +-
 6 files changed, 141 insertions(+), 5 deletions(-)

diff --git a/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
new file mode 100644
index 0000000000..838d519d5a
--- /dev/null
+++ b/package/nfs-utils/0001-fh_key_file-fix-missing-string.h-inclusion.patch
@@ -0,0 +1,28 @@
+From 2d99ff0aa8a3b4d20558bce742edaaed9d24b3cb Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 7 Apr 2026 17:23:13 +0200
+Subject: [PATCH] fh_key_file: fix missing string.h inclusion
+
+Add #include <string.h> to fix build failure.
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-1-giulio.benetti@benettiengineering.com/T/#t
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/nfs/fh_key_file.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
+index 5f5eafc1..81ea1500 100644
+--- a/support/nfs/fh_key_file.c
++++ b/support/nfs/fh_key_file.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <errno.h>
++#include <string.h>
+ #include <uuid/uuid.h>
+ 
+ #include "nfslib.h"
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
new file mode 100644
index 0000000000..c5c57c6503
--- /dev/null
+++ b/package/nfs-utils/0002-Introduce-compat.h-file-to-deal-with-old-Linux-api-a.patch
@@ -0,0 +1,77 @@
+From 218e1b572123f527bd92c17ebb7ac00c2a7e6c01 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Tue, 7 Apr 2026 17:47:40 +0200
+Subject: [PATCH] Introduce compat.h file to deal with old Linux api and fix
+ build failure due to missing NETLINK_EXT_ACK
+
+In compat.h check if NETLINK_EXT_ACK exists, otherwise define it to fix
+build failure and where at the moment <linux/netlink.h> is included
+let's include "compat.h"
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-2-giulio.benetti@benettiengineering.com/T/#u
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/export/cache.c       |  2 +-
+ support/export/cache_flush.c |  2 ++
+ support/include/compat.h     | 10 ++++++++++
+ utils/nfsdctl/nfsdctl.c      |  1 +
+ 4 files changed, 14 insertions(+), 1 deletion(-)
+ create mode 100644 support/include/compat.h
+
+diff --git a/support/export/cache.c b/support/export/cache.c
+index 2f128d7d..65008f51 100644
+--- a/support/export/cache.c
++++ b/support/export/cache.c
+@@ -40,7 +40,7 @@
+ #include <netlink/genl/ctrl.h>
+ #include <netlink/msg.h>
+ #include <netlink/attr.h>
+-#include <linux/netlink.h>
++#include "compat.h"
+ 
+ #ifdef USE_SYSTEM_NFSD_NETLINK_H
+ #include <linux/nfsd_netlink.h>
+diff --git a/support/export/cache_flush.c b/support/export/cache_flush.c
+index ed7b964f..2a24dec7 100644
+--- a/support/export/cache_flush.c
++++ b/support/export/cache_flush.c
+@@ -38,6 +38,8 @@ extern int no_netlink;
+ #include "sunrpc_netlink.h"
+ #endif
+ 
++#include "compat.h"
++
+ static int nl_send_flush(struct nl_sock *sock, int family, int cmd)
+ {
+ 	struct nl_msg *msg;
+diff --git a/support/include/compat.h b/support/include/compat.h
+new file mode 100644
+index 00000000..83229b65
+--- /dev/null
++++ b/support/include/compat.h
+@@ -0,0 +1,10 @@
++#ifndef COMPAT_H
++#define COMPAT_H
++
++#include <linux/netlink.h>
++
++#ifndef NETLINK_EXT_ACK
++#define NETLINK_EXT_ACK 11
++#endif
++
++#endif /* COMPAT_H */
+diff --git a/utils/nfsdctl/nfsdctl.c b/utils/nfsdctl/nfsdctl.c
+index 016dd2eb..c7126748 100644
+--- a/utils/nfsdctl/nfsdctl.c
++++ b/utils/nfsdctl/nfsdctl.c
+@@ -26,6 +26,7 @@
+ #include <netlink/msg.h>
+ #include <netlink/attr.h>
+ #include <linux/netlink.h>
++#include "compat.h"
+ 
+ #include <readline/readline.h>
+ #include <readline/history.h>
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
new file mode 100644
index 0000000000..86d615ca34
--- /dev/null
+++ b/package/nfs-utils/0003-support-backend_sqlite.c-fix-getrandom-fallback.patch
@@ -0,0 +1,30 @@
+From dbd44e7d6d4140e5e9d01f0a6daf6f3e45e5acbc Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 8 Apr 2026 14:28:28 +0200
+Subject: [PATCH] support/backend_sqlite.c: fix getrandom() fallback
+
+In old Linux/Glibc versions __NR_getrandom is defined in <sys/random.h>
+so let's add it to fix build failure.
+
+Upstream: https://lore.kernel.org/linux-nfs/20260408173535.3992116-3-giulio.benetti@benettiengineering.com/T/#u
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ support/reexport/backend_sqlite.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/support/reexport/backend_sqlite.c b/support/reexport/backend_sqlite.c
+index 0eb5ea37..a1e981e4 100644
+--- a/support/reexport/backend_sqlite.c
++++ b/support/reexport/backend_sqlite.c
+@@ -9,6 +9,8 @@
+ #include <string.h>
+ #include <unistd.h>
+ 
++#include <sys/syscall.h>
++
+ #ifdef HAVE_GETRANDOM
+ # include <sys/random.h>
+ # if !defined(SYS_getrandom) && defined(__NR_getrandom)
+-- 
+2.47.3
+
diff --git a/package/nfs-utils/Config.in b/package/nfs-utils/Config.in
index 419b605667..295ce28edb 100644
--- a/package/nfs-utils/Config.in
+++ b/package/nfs-utils/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_NFS_UTILS
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # getrandom()
 	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_LIBTIRPC # IPv6 requires libtirpc
 	select BR2_PACKAGE_LIBTIRPC_RPCDB
 	select BR2_PACKAGE_SQLITE
diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 1e3f63d419..19315e60a3 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/sha256sums.asc
-sha256  59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae  nfs-utils-2.8.7.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/2.9.1/sha256sums.asc
+sha256  302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c  nfs-utils-2.9.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 3d391c1804..df9fdbc052 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 2.8.7
+NFS_UTILS_VERSION = 2.9.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
 NFS_UTILS_LICENSE_FILES = COPYING
-NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libtirpc sqlite util-linux
+NFS_UTILS_DEPENDENCIES = host-nfs-utils host-pkgconf libevent libnl libtirpc sqlite util-linux
 NFS_UTILS_CPE_ID_VENDOR = linux-nfs
 
 NFS_UTILS_CONF_ENV = knfsd_cv_bsd_signals=no
@@ -23,7 +23,7 @@ NFS_UTILS_CONF_OPTS = \
 	--with-statedir=/run/nfs \
 	--with-rpcgen=$(HOST_DIR)/bin/rpcgen
 
-HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-sqlite host-util-linux
+HOST_NFS_UTILS_DEPENDENCIES = host-pkgconf host-libtirpc host-libevent host-libnl host-sqlite host-util-linux
 
 HOST_NFS_UTILS_CONF_OPTS = \
 	--enable-tirpc \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
