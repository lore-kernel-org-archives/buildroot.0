Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B445C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:58:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD5C42E6D;
	Fri, 28 Feb 2025 16:58:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SMgFUvJ9BvmV; Fri, 28 Feb 2025 16:58:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9A0F502DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A0F502DD;
	Fri, 28 Feb 2025 16:58:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECFA1DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A3049478
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvfrGnrTJL1m for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B316D42DF9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B316D42DF9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A743C87B5B; Fri, 28 Feb 2025 16:30:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Jan 2025 23:31:19 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2eba7b1a97d9a0503defe667c25011cdfba7a7cd
X-Git-Newrev: 9347328193221d1c24a6024eded39e8b74d00433
X-Patchwork-Hint: ignore
Message-Id: <20250228163010.A743C87B5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libiberty: remove
 package
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9347328193221d1c24a6024eded39e8b74d00433
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

host-libiberty was only used by host-prelink-cross, which has now been
removed.

The dependency of host-gdb on host-libiberty was not because it was
needed, but because if both host-libiberty and host-gdb were built,
host-gdb should be built after host-liberty. See commit
f0a583ddc4c2cab121330284e316f54229dee492 ("package/gdb: depend on
libiberty")

Fixes:

  http://autobuild.buildroot.net/results/82d2d7d30c8e00bf6e9918c3d989f65a7330d381/ (host-binutils)
  http://autobuild.buildroot.net/results/a4674122a683e4842c1fd913da80a3e6e484d5a5/ (host-binutils-bare-metal)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/gdb/gdb.mk               |  4 +---
 package/libiberty/libiberty.hash |  1 -
 package/libiberty/libiberty.mk   | 32 --------------------------------
 3 files changed, 1 insertion(+), 36 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index c966cdc10b..69f7979149 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -30,9 +30,7 @@ GDB_PRE_CONFIGURE_HOOKS += GDB_CONFIGURE_SYMLINK
 # For the host variant, we really want to build with XML support,
 # which is needed to read XML descriptions of target architectures. We
 # also need ncurses.
-# As for libiberty, gdb may use a system-installed one if present, so
-# we must ensure ours is installed first.
-HOST_GDB_DEPENDENCIES = host-expat host-libiberty host-ncurses host-zlib
+HOST_GDB_DEPENDENCIES = host-expat host-ncurses host-zlib
 
 # Disable building documentation
 GDB_MAKE_OPTS += MAKEINFO=true
diff --git a/package/libiberty/libiberty.hash b/package/libiberty/libiberty.hash
deleted file mode 120000
index e0655d3af3..0000000000
--- a/package/libiberty/libiberty.hash
+++ /dev/null
@@ -1 +0,0 @@
-../binutils/binutils.hash
\ No newline at end of file
diff --git a/package/libiberty/libiberty.mk b/package/libiberty/libiberty.mk
deleted file mode 100644
index ac6afc44ca..0000000000
--- a/package/libiberty/libiberty.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# libiberty
-#
-################################################################################
-
-LIBIBERTY_VERSION = 2.41
-LIBIBERTY_SOURCE = binutils-$(LIBIBERTY_VERSION).tar.xz
-LIBIBERTY_SITE = $(BR2_GNU_MIRROR)/binutils
-HOST_LIBIBERTY_DL_SUBDIR = binutils
-
-# We're only building libiberty here, not the full binutils suite
-LIBIBERTY_LICENSE = LGPL-2.1+
-LIBIBERTY_LICENSE_FILES = COPYING.LIB
-
-LIBIBERTY_SUBDIR = libiberty
-
-# We explicitly disable multilib, as we do in binutils.
-# By default, libiberty installs nothing, so we must force it.
-HOST_LIBIBERTY_CONF_OPTS = \
-	--disable-multilib \
-	--enable-install-libiberty
-
-# Some packages (e.g. host-gdb) will pick this library and build shared
-# objects with it. But libiberty does not honour the --enable-shared and
-# --disable-static flags; it only ever builds a static library no matter
-# what. So we must force -fPIC in build flags.
-HOST_LIBIBERTY_CONF_ENV = \
-	CFLAGS="$(HOST_CFLAGS) -fPIC" \
-	LDFLAGS="$(HOST_LDFLAGS) -fPIC"
-
-$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
