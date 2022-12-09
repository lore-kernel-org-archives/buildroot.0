Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0DDC04FDE
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 512D140FFC;
	Fri,  9 Dec 2022 16:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 512D140FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tvQrJSLa32b; Fri,  9 Dec 2022 16:20:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 810234100E;
	Fri,  9 Dec 2022 16:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 810234100E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 72DE21BF37A
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D2AF403CC
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 16:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D2AF403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLXa1WvWLikx for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 16:20:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3732C403C7
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 16:20:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3732C403C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2165B85E8E; Fri,  9 Dec 2022 16:20:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 14:38:52 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 2d8eac03c398a7829e84f6a685266e2810c1c5b0
X-Git-Newrev: 25ab5d22e6a1fe7efbae772400a2f5e5215ee694
X-Patchwork-Hint: ignore
Message-Id: <20221209162027.2165B85E8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/gdb: zlib is
 mandatory, not optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=25ab5d22e6a1fe7efbae772400a2f5e5215ee694
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

zlib is a mandatory dependency of gdb and by default, gdb will use its
internal one. Moreover, --with-zlib has been replaced by
--with-system-zlib since version 7.10 and
https://github.com/bminor/binutils-gdb/commit/fa1f5da0b6ff3622f9bf60e348e149b76920abba

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15131

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3341ceb1e58536cf43a4c000e4bb3cdbff3f6de5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in |  1 +
 package/gdb/gdb.mk    | 12 ++++--------
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index 8fd5eb9fbc..c098a14844 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -19,6 +19,7 @@ config BR2_PACKAGE_GDB
 	depends on BR2_INSTALL_LIBSTDCPP
 	# no gdbserver on or1k
 	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
+	select BR2_PACKAGE_ZLIB
 	# When the external toolchain gdbserver is copied to the
 	# target, we don't allow building a separate gdbserver. The
 	# one from the external toolchain should be used.
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 86e57481de..00e87f596a 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -41,7 +41,8 @@ endif
 # also need ncurses.
 # As for libiberty, gdb may use a system-installed one if present, so
 # we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses
+GDB_DEPENDENCIES = zlib
+HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
@@ -139,6 +140,7 @@ GDB_CONF_OPTS = \
 	--disable-sim \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
 	--without-included-gettext \
+	--with-system-zlib \
 	--disable-werror \
 	--enable-static \
 	--without-mpfr
@@ -222,13 +224,6 @@ else
 GDB_CONF_OPTS += --without-lzma
 endif
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-GDB_CONF_OPTS += --with-zlib
-GDB_DEPENDENCIES += zlib
-else
-GDB_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_PACKAGE_GDB_PYTHON),)
 # This removes some unneeded Python scripts and XML target description
 # files that are not useful for a normal usage of the debugger.
@@ -266,6 +261,7 @@ HOST_GDB_CONF_OPTS = \
 	--enable-threads \
 	--disable-werror \
 	--without-included-gettext \
+	--with-system-zlib \
 	--with-curses \
 	--without-mpfr \
 	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
