Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05BBD3A696
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 20:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6823780ACD;
	Tue, 29 Oct 2024 20:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mDqTJDe0e_Dg; Tue, 29 Oct 2024 20:21:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C4BE80B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C4BE80B0B;
	Tue, 29 Oct 2024 20:21:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 074A75E50
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC3B260657
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjPHAIT4emfV for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EE7605DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1EE7605DD
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8B0B847AA; Tue, 29 Oct 2024 20:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 19:51:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98fc3879c734ab88ebea2ee74a8b929dee4ae66b
X-Git-Newrev: 518902d4be70104a54c685d3b42c3d1b20790eec
X-Patchwork-Hint: ignore
Message-Id: <20241029202119.C8B0B847AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc-bare-metal: clean up variable
 names
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

commit: https://git.buildroot.net/buildroot/commit/?id=518902d4be70104a54c685d3b42c3d1b20790eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing HOST_ prefix from variables to follow buildroot coding practices.
Adding HOST_ prefix to GCC_BARE_METAL_CONFIGURE_SYMLINK package variable.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc-bare-metal/gcc-bare-metal.mk | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index 501f12bc33..5bb6baa74a 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,15 +4,14 @@
 #
 ################################################################################
 
-HOST_GCC_BARE_METAL_VERSION = 14.2.0
-HOST_GCC_BARE_METAL_SITE = \
-	https://ftp.gnu.org/gnu/gcc/gcc-$(HOST_GCC_BARE_METAL_VERSION)
-HOST_GCC_BARE_METAL_SOURCE = gcc-$(HOST_GCC_BARE_METAL_VERSION).tar.xz
+GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_SITE = https://ftp.gnu.org/gnu/gcc/gcc-$(GCC_BARE_METAL_VERSION)
+GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
-HOST_GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
-HOST_GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
-HOST_GCC_BARE_METAL_CPE_ID_VENDOR = gnu
-HOST_GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
+GCC_BARE_METAL_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
+GCC_BARE_METAL_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
+GCC_BARE_METAL_CPE_ID_VENDOR = gnu
+GCC_BARE_METAL_CPE_ID_PRODUCT = gcc
 
 HOST_GCC_BARE_METAL_DEPENDENCIES = \
 	host-binutils-bare-metal \
@@ -23,12 +22,12 @@ HOST_GCC_BARE_METAL_DEPENDENCIES = \
 
 # gcc doesn't support in-tree build, so we create a 'build'
 # subdirectory in the gcc sources, and build from there.
-define GCC_BARE_METAL_CONFIGURE_SYMLINK
+define HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 	mkdir -p $(@D)/build
 	ln -sf ../configure $(@D)/build/configure
 endef
 
-HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += GCC_BARE_METAL_CONFIGURE_SYMLINK
+HOST_GCC_BARE_METAL_PRE_CONFIGURE_HOOKS += HOST_GCC_BARE_METAL_CONFIGURE_SYMLINK
 HOST_GCC_BARE_METAL_SUBDIR = build
 
 HOST_GCC_BARE_METAL_MAKE_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
