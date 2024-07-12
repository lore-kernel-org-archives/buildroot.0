Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEA0C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DE2409AE;
	Fri, 12 Jul 2024 20:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oCNhxjFhnUB6; Fri, 12 Jul 2024 20:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F86C409E0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F86C409E0;
	Fri, 12 Jul 2024 20:02:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C3B1BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE48A4011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KUqUgPkTp4T for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C84174000B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C84174000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:02:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA6858619E; Fri, 12 Jul 2024 20:02:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:00:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2547a3b32d2be1fc2b49da8d6b81f0c711821212
X-Git-Newrev: f2f71ca6e68094c322605aea28abdcbf86f37a20
X-Patchwork-Hint: ignore
Message-Id: <20240712200208.BA6858619E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-tdfx: fix
 patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f2f71ca6e68094c322605aea28abdcbf86f37a20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, xdriver_xf86-video-tdfx fails to build with output:

    Applying 0001-cross.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 67.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                    | 2 +-
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 63a27410ca..c7d49ceffd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1485,7 +1485,7 @@ package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-pat
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Sob lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Sob lib_patch.Upstream
+package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
 package/x11vnc/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch lib_patch.Upstream
diff --git a/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch b/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
index e53591bb0b..f9880afb54 100644
--- a/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
+++ b/package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch
@@ -1,8 +1,10 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 --- xf86-video-tdfx-1.3.0/configure.ac.orig	2007-06-10 21:01:54.000000000 +0200
 +++ xf86-video-tdfx-1.3.0/configure.ac	2007-06-10 21:02:06.000000000 +0200
-@@ -67,13 +67,20 @@
- # Checks for header files.
- AC_HEADER_STDC
+@@ -75,13 +75,20 @@
+ 	      [#include "xorg-server.h"])
+ CPPFLAGS="$SAVE_CPPFLAGS"
  
 -if test "$DRI" != no; then
 +if test "x$DRI" != xno; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
