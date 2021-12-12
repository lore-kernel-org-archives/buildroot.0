Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12965C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C76284232B;
	Sun, 12 Dec 2021 15:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AhGCBIq4F2Z6; Sun, 12 Dec 2021 15:14:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E51E84232F;
	Sun, 12 Dec 2021 15:14:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8892C1BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 778566070C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRdlGGSP8ZVr for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:14:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D738606EB
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:14:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9D3B383486; Sun, 12 Dec 2021 15:09:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 16:12:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e60b6f1da53c8192d79c9f8c7c029bb3fee63ea
X-Git-Newrev: d33ad03e75b89feb97a7edeba3156fa2ac417b06
X-Patchwork-Hint: ignore
Message-Id: <20211212150923.9D3B383486@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.15.3
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
Content-Type: multipart/mixed; boundary="===============6673362560068764680=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6673362560068764680==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d33ad03e75b89feb97a7edeba3156fa2ac417b06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0002 due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/d62917d3d7eeb9c5782d7230a4012b5a9235154f

Removed patch 0004-dcesrv_core-fix-build.patch, applied upstream:
https://gitlab.com/samba-team/samba/-/commit/4d5fb7d279ef899307a560da2bed037cda609f10

Added patch to fix build error and added new answer to samba4-cache.txt.

Release notes:
https://www.samba.org/samba/history/samba-4.15.0.html
https://www.samba.org/samba/history/samba-4.15.1.html
https://www.samba.org/samba/history/samba-4.15.2.html
https://www.samba.org/samba/history/samba-4.15.3.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...pre-built-heimdal-build-tools-in-case-of-.patch |  4 +-
 package/samba4/0004-dcesrv_core-fix-build.patch    | 56 ----------------------
 .../0004-lib-util-Add-signal.h-include.patch       | 37 ++++++++++++++
 package/samba4/samba4-cache.txt                    |  1 +
 package/samba4/samba4.hash                         |  4 +-
 package/samba4/samba4.mk                           |  2 +-
 6 files changed, 44 insertions(+), 60 deletions(-)

diff --git a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index b8636958ee..484e6722ea 100644
--- a/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0002-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -75,13 +75,15 @@ index 0ff6dad2f55..f77c177442f 100644
  check_system_heimdal_lib("com_err", "com_right_r com_err", "com_err.h")
  
  if check_system_heimdal_lib("roken", "rk_socket_set_reuseaddr", "roken.h"):
-@@ -96,7 +96,4 @@
+@@ -96,9 +88,6 @@
  #if conf.CHECK_BUNDLED_SYSTEM('tommath', checkfunctions='mp_init', headers='tommath.h'):
  #    conf.define('USING_SYSTEM_TOMMATH', 1)
  
 -check_system_heimdal_binary("compile_et")
 -check_system_heimdal_binary("asn1_compile")
 -
+ conf.env.KRB5_VENDOR = 'heimdal'
  conf.define('USING_SYSTEM_KRB5', 1)
+ conf.define('USING_SYSTEM_HEIMDAL', 1)
 -- 
 2.20.1
diff --git a/package/samba4/0004-dcesrv_core-fix-build.patch b/package/samba4/0004-dcesrv_core-fix-build.patch
deleted file mode 100644
index 75835acdd1..0000000000
--- a/package/samba4/0004-dcesrv_core-fix-build.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 44bccdf7d158ae93ba9a5515038aac2a5ac4fd85 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 27 Mar 2021 17:17:34 +0100
-Subject: [PATCH] dcesrv_core: fix build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Move include of system/network.h to avoid a build error:
-
-In file included from ../../lib/replace/system/network.h:35,
-                 from ../../librpc/rpc/dcesrv_core.c:2658:
-usr/include/unistd.h: At top level:
-usr/include/unistd.h:675:16: error: conflicting types for ‘geteuid’
-  675 | extern __uid_t geteuid (void) __THROW;
-
-Patch sent upstream:
-https://gitlab.com/samba-team/samba/-/merge_requests/1871
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- librpc/rpc/dcesrv_core.c | 11 +----------
- 1 file changed, 1 insertion(+), 10 deletions(-)
-
-diff --git a/librpc/rpc/dcesrv_core.c b/librpc/rpc/dcesrv_core.c
-index 70e0245532e..e761329d157 100644
---- a/librpc/rpc/dcesrv_core.c
-+++ b/librpc/rpc/dcesrv_core.c
-@@ -32,6 +32,7 @@
- #include "lib/tsocket/tsocket.h"
- #include "librpc/gen_ndr/ndr_dcerpc.h"
- #include "lib/util/tevent_ntstatus.h"
-+#include "system/network.h"
- 
- 
- #undef DBGC_CLASS
-@@ -2633,16 +2634,6 @@ _PUBLIC_ void dcesrv_cleanup_broken_connections(struct dcesrv_context *dce_ctx)
- 	}
- }
- 
--/* We need this include to be able to compile on some plateforms
-- * (ie. freebsd 7.2) as it seems that <sys/uio.h> is not included
-- * correctly.
-- * It has to be that deep because otherwise we have a conflict on
-- * const struct dcesrv_interface declaration.
-- * This is mostly due to socket_wrapper defining #define bind swrap_bind
-- * which conflict with the bind used before.
-- */
--#include "system/network.h"
--
- struct dcesrv_sock_reply_state {
- 	struct dcesrv_connection *dce_conn;
- 	struct dcesrv_call_state *call;
--- 
-2.29.2
-
diff --git a/package/samba4/0004-lib-util-Add-signal.h-include.patch b/package/samba4/0004-lib-util-Add-signal.h-include.patch
new file mode 100644
index 0000000000..838a8fa6d7
--- /dev/null
+++ b/package/samba4/0004-lib-util-Add-signal.h-include.patch
@@ -0,0 +1,37 @@
+From d1732a79dbf30c41802245909d0250ebe2b9d92e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sun, 12 Dec 2021 10:27:42 +0100
+Subject: [PATCH] lib/util: Add signal.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes build error with samba-4.15.3 and uClibc:
+
+../../source3/printing/samba-bgqd.c: In function ‘main’:
+../../source3/printing/samba-bgqd.c:340:21: error: ‘SIGPIPE’ undeclared (first use in this function); did you mean ‘EPIPE’?
+../../source3/printing/samba-bgqd.c:384:14: error: ‘SIGTERM’ undeclared (first use in this function)
+
+Patch sent upstream:
+https://gitlab.com/samba-team/samba/-/merge_requests/2296
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ lib/util/signal.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/util/signal.h b/lib/util/signal.h
+index 0663af6ab94..f662ee110d6 100644
+--- a/lib/util/signal.h
++++ b/lib/util/signal.h
+@@ -21,6 +21,7 @@
+ #ifndef _SAMBA_UTIL_SIGNAL_H_
+ #define _SAMBA_UTIL_SIGNAL_H_
+ 
++#include <signal.h>
+ #include <stdbool.h>
+ 
+ /**
+-- 
+2.30.2
+
diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index 75d0343dc9..ba849b7c6e 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -43,3 +43,4 @@ Checking for a 64-bit host to support lmdb: NO
 Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
 Checking value of GNUTLS_MAC_AES_CMAC_128: 203
 Checking whether fcntl supports flags to send direct I/O availability signals: OK
+Checking for gnutls fips mode support: NO
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 033d932732..4749f6f597 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.14.10.tar.asc
-sha256  107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af  samba-4.14.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.3.tar.asc
+sha256  519399404391550345846768ea4dd0fe7fcb04e20c2b891b5eeb02e5554137db  samba-4.15.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index eb1f3b830e..8fa8b53399 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.14.10
+SAMBA4_VERSION = 4.15.3
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES

--===============6673362560068764680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6673362560068764680==--
