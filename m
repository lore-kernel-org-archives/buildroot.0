Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A829C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 12:43:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4672440BE7;
	Tue, 16 Jul 2024 12:43:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yb-bjQ0oAKdp; Tue, 16 Jul 2024 12:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37EF840BF4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37EF840BF4;
	Tue, 16 Jul 2024 12:43:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A9DAB1BF3E3
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D300F403B6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 12:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XPC-33y_Vm39 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BDAE402FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BDAE402FE
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 863B886B9E; Tue, 16 Jul 2024 12:43:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 14:42:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34fbdb0d99d00df578f825f9bf5d211e67413076
X-Git-Newrev: 3d85e9df431af790930e03d860bfa098108888a0
X-Patchwork-Hint: ignore
Message-Id: <20240716124308.863B886B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: bump to 3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d85e9df431af790930e03d860bfa098108888a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dependencies changed: inih dependency was removed, glib2 and lua added.
Tio's meson build system fails to find luajit, so exclude that,
otherwise all versions of lua >= 5.1 are supported.

Retested the build for sparc and sparc64 and the compile issues have
been resolved upstream by reworking the baudrate selection code quite a
while ago[1].

Disable installation of man pages with new build option.

[1] https://github.com/tio/tio/commit/a23be7f2c2bacef428b0e50aa93e37e5b52bdd56

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tio/Config.in | 23 +++++++++++++----------
 package/tio/tio.hash  |  4 ++--
 package/tio/tio.mk    |  6 ++++--
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index e4241fa5e1..953b26a349 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,8 +1,10 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
-	depends on !BR2_sparc64 && !BR2_sparc
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_INIH
+	depends on BR2_USE_MMU # glib2
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	depends on !BR2_PACKAGE_LUAJIT
 	help
 	  "tio" is a simple TTY terminal application which features a
 	  straightforward commandline interface to easily connect to
@@ -10,12 +12,13 @@ config BR2_PACKAGE_TIO
 
 	  https://tio.github.io/
 
-# tio is disabled for sparc and sparc64 architectures because it fails
-# to build with a redefinition of 'struct termio' error, with no proper
-# fix or workaround for now
-comment "tio is disabled for sparc and sparc64 architectures"
-	depends on BR2_sparc64 || BR2_sparc
-
-comment "tio needs a toolchain w/ threads"
+comment "tio needs a toolchain w/ threads, wchar"
+	depends on BR2_USE_MMU
 	depends on !BR2_sparc64 && !BR2_sparc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
+comment "tio needs lua (but not luajit)"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR
+	depends on !BR2_PACKAGE_HAS_LUAINTERPRETER || BR2_PACKAGE_LUAJIT
diff --git a/package/tio/tio.hash b/package/tio/tio.hash
index 02699fdeb4..d1caeeebc6 100644
--- a/package/tio/tio.hash
+++ b/package/tio/tio.hash
@@ -1,5 +1,5 @@
-# From https://github.com/tio/tio/releases/download/v2.7/tio-2.7.tar.xz.sha256sum:
-sha256  bf8fe434848c2c1b6540af0b42503c986068176ddc1a988cf02e521e7de5daa5  tio-2.7.tar.xz
+# From https://github.com/tio/tio/releases/download/v3.5/tio-3.5.tar.xz.sha256sum:
+sha256  efd3e9a406f827ac22d4157e345079dde15ee5a948b24156561d6c97a54e6ec0  tio-3.5.tar.xz
 
 # Hash for license files:
 sha256  9248dee77ee136321f24556a96e07ff8f90461013941884a9defd0ac825ef131  LICENSE
diff --git a/package/tio/tio.mk b/package/tio/tio.mk
index 95831e8ce6..637a7bdd83 100644
--- a/package/tio/tio.mk
+++ b/package/tio/tio.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-TIO_VERSION = 2.7
+TIO_VERSION = 3.5
 TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
 TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
 TIO_LICENSE = GPL-2.0+
 TIO_LICENSE_FILES = LICENSE
-TIO_DEPENDENCIES = inih
+TIO_DEPENDENCIES = libglib2 luainterpreter
+
+TIO_CONF_OPTS += -Dinstall_man_pages=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 TIO_CONF_OPTS +=-Dbashcompletiondir=/usr/share/bash-completion/completions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
