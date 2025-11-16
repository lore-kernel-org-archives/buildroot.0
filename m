Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC27CEBF61
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 21:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FE23406C6;
	Sun, 16 Nov 2025 21:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEbGVxurj09y; Sun, 16 Nov 2025 21:52:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54437406E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54437406E6;
	Sun, 16 Nov 2025 21:52:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EFA5158
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85805406BA
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2aVR1MXahOk for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D38406A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3D38406A5
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83330847F4; Sun, 16 Nov 2025 21:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Nov 2025 22:26:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2193b55bac7ee6e2f09d3316d75a157142462a25
X-Git-Newrev: 1f973844d10d0d840409a964227aa0777f3b3f4c
X-Patchwork-Hint: ignore
Message-Id: <20251116215159.83330847F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libroxml: fix musl build errors
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1f973844d10d0d840409a964227aa0777f3b3f4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/0ff/0ff4394319d2014884328c347ef495da327a562e/

Added Upstream tag to patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 .../0001-src-roxml_mem.h-add-missing-extern.patch  |  3 +-
 package/libroxml/0002-Fix-musl-build-errors.patch  | 69 ++++++++++++++++++++++
 3 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 42a04d2a6b..4821f41cce 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -596,7 +596,6 @@ package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch lib_patch.Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch lib_patch.Upstream
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
-package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstream
 package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
 package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch lib_patch.Upstream
 package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
diff --git a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
index 6f63d7b546..12e67f9c91 100644
--- a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
+++ b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
@@ -13,8 +13,9 @@ libtool: link: /home/peko/autobuild/instance-0/output-1/host/bin/arm-buildroot-l
 Fixes:
  - http://autobuild.buildroot.org/results/b6ac3664d61ad826515b57c4d057b6f001b5167d
 
+Upstream: https://github.com/blunderer/libroxml/commit/34257124eefe0ca095ed54681c818381070ed549
+
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/blunderer/libroxml/pull/79]
 ---
  src/roxml_mem.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/libroxml/0002-Fix-musl-build-errors.patch b/package/libroxml/0002-Fix-musl-build-errors.patch
new file mode 100644
index 0000000000..4931f12d5b
--- /dev/null
+++ b/package/libroxml/0002-Fix-musl-build-errors.patch
@@ -0,0 +1,69 @@
+From abf4404c6c0213666f3fce73cff6e51435eac923 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 15 Nov 2025 12:29:33 +0100
+Subject: [PATCH] Fix musl build errors
+
+src/roxml_cat.c: In function 'display_usage':
+src/roxml_cat.c:21:22: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Wimplicit-function-declaration]
+   21 |         char *name = basename(prgname);
+      |                      ^~~~~~~~
+      |                      rename
+src/roxml_cat.c:21:22: error: initialization of 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
+
+src/roxml_mem.c: In function 'roxml_malloc':
+src/roxml_mem.c:138:18: error: assignment to 'long unsigned int' from 'pthread_t' {aka 'struct __pthread *'} makes integer from pointer without a cast [-Wint-conversion]
+  138 |         cell->id = pthread_self();
+
+src/roxml_utils.h:51:16: error: returning 'pthread_t' {aka 'struct __pthread *'} from a function with return type 'long unsigned int' makes integer from pointer without a cast [-Wint-conversion]
+   51 |         return pthread_self();
+
+Upstream: https://github.com/blunderer/libroxml/pull/86
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/roxml_cat.c   | 1 +
+ src/roxml_mem.c   | 2 +-
+ src/roxml_utils.h | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/roxml_cat.c b/src/roxml_cat.c
+index 11e42d9..4320efd 100644
+--- a/src/roxml_cat.c
++++ b/src/roxml_cat.c
+@@ -5,6 +5,7 @@
+ #include <getopt.h>
+ #include <string.h>
+ #include <errno.h>
++#include <libgen.h>
+ #include "roxml.h"
+ 
+ static struct option long_options[] =
+diff --git a/src/roxml_mem.c b/src/roxml_mem.c
+index 91b5db2..bf757bb 100644
+--- a/src/roxml_mem.c
++++ b/src/roxml_mem.c
+@@ -135,7 +135,7 @@ ROXML_INT void *roxml_malloc(int size, int num, int type)
+ 	cell->next->prev = cell;
+ 	cell = cell->next;
+ 	cell->type = type;
+-	cell->id = pthread_self();
++	cell->id = (unsigned long)pthread_self();
+ 	cell->occ = size;
+ 	cell->ptr = calloc(num, size);
+ 	head_cell.prev = cell;
+diff --git a/src/roxml_utils.h b/src/roxml_utils.h
+index 3f50976..f5fc582 100644
+--- a/src/roxml_utils.h
++++ b/src/roxml_utils.h
+@@ -48,7 +48,7 @@ ROXML_STATIC_INLINE ROXML_INT int roxml_unlock(node_t *n)
+ #else /* CONFIG_XML_THREAD_SAFE==1 */
+ ROXML_STATIC_INLINE ROXML_INT unsigned long int roxml_thread_id(node_t *n)
+ {
+-	return pthread_self();
++	return (unsigned long)pthread_self();
+ }
+ 
+ ROXML_STATIC_INLINE ROXML_INT int roxml_lock_init(node_t *n)
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
