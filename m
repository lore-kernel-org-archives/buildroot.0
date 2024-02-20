Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCACC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 20:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E1D960688;
	Tue, 20 Feb 2024 20:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGxAZfnohUQp; Tue, 20 Feb 2024 20:46:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4694360BE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4694360BE4;
	Tue, 20 Feb 2024 20:46:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F5A41BF33E
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B7BD41605
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 20:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2EM94q-29_Es for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 20:46:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C2E1415FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2E1415FD
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 20:46:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A82987981; Tue, 20 Feb 2024 20:46:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 21:43:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc3f1faa8b8339a72da45efeeb3085045002ca28
X-Git-Newrev: 3e48306a43ed8f21dbd2c1899e0ca02e7e460801
X-Patchwork-Hint: ignore
Message-Id: <20240220204638.7A82987981@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e48306a43ed8f21dbd2c1899e0ca02e7e460801
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.7.5 in
commit b7ee5f3b0e3ef703bafd007cc99da10312d99b9e and
https://github.com/ndilieto/uacme/commit/fe826f4b1931ae508047d8b2693b5b6ac2cb21fd:

checking if mmap(MAP_ANON|MAP_SHARED) works... configure: error: in `/home/autobuild/autobuild/instance-9/output-1/build/uacme-1.7.5':
configure: error: cannot run test program while cross compiling

Fixes: b7ee5f3b0e3ef703bafd007cc99da10312d99b9e
 - http://autobuild.buildroot.org/results/9715ade98f4894c07b640d151daa41813d2bec3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reference patch in comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uacme/0001-Fix-cross-compilation.patch | 29 ++++++++++++++++++++++++++
 package/uacme/uacme.mk                         |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/uacme/0001-Fix-cross-compilation.patch b/package/uacme/0001-Fix-cross-compilation.patch
new file mode 100644
index 0000000000..cc384f2c36
--- /dev/null
+++ b/package/uacme/0001-Fix-cross-compilation.patch
@@ -0,0 +1,29 @@
+From cdf63e24dc475a558400c68714e32d32904e4c57 Mon Sep 17 00:00:00 2001
+From: Nicola Di Lieto <nicola.dilieto@gmail.com>
+Date: Tue, 20 Feb 2024 01:05:00 +0100
+Subject: [PATCH] Fix cross compilation
+
+Commit fe826f4b1931ae508047d8b2693b5b6ac2cb21fd broke cross compilation
+
+Closes https://github.com/ndilieto/uacme/issues/79
+
+Upstream: https://github.com/ndilieto/uacme/commit/cdf63e24dc475a558400c68714e32d32904e4c57
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 77d1230..3bec75b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -355,7 +355,8 @@ if test "x$OPT_UALPN" != "xno"; then
+                 AC_DEFINE(HAVE_MAP_DEVZERO, 1, [if mmap("/dev/zero", MAP_SHARED) works])
+                 AC_MSG_RESULT([yes]),
+                 AC_MSG_RESULT([no])
+-                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)])),
++                AC_MSG_ERROR([ualpn requires MAP_ANON or mmap("/dev/zero", MAP_SHARED)]))
++        ], [
+             AC_COMPILE_IFELSE([AC_LANG_SOURCE([#include <sys/mman.h>
+                              int main() {return mmap(0, 4096, PROT_READ|PROT_WRITE,
+                                 MAP_ANON|MAP_SHARED, -1, 0) == MAP_FAILED;}])],
diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index f02e522761..0fcb5c5c34 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,6 +13,9 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
+# 0001-Fix-cross-compilation.patch touches configure.ac
+UACME_AUTORECONF = YES
+
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
