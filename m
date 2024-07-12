Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B70C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 964DA417F7;
	Fri, 12 Jul 2024 20:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaB4G1qenwFM; Fri, 12 Jul 2024 20:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4489241994
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4489241994;
	Fri, 12 Jul 2024 20:06:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C25EA1BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF3741994
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BDyoi4K__li1 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A052F417F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A052F417F7
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:06:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89BC58617D; Fri, 12 Jul 2024 20:06:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:04:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2f71ca6e68094c322605aea28abdcbf86f37a20
X-Git-Newrev: ceba36f28bc790af40508ed1011e4e88d55f6d27
X-Patchwork-Hint: ignore
Message-Id: <20240712200646.89BC58617D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-mach64:
 fix patch fuzz
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceba36f28bc790af40508ed1011e4e88d55f6d27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, xdriver_xf86-video-mach64 fails to build with output:

    Applying 0001-cross-compile.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 85.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                              | 2 +-
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index c7d49ceffd..842b86bbc8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1483,7 +1483,7 @@ package/x11r7/xdriver_xf86-video-imx/0003-support-glibc-2.20.patch lib_patch.Ups
 package/x11r7/xdriver_xf86-video-imx/0004-Make-video-API-forward-and-backward-compatible.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-paths.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Sob lib_patch.Upstream
+package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
diff --git a/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
index d27617606e..02d34ce9fc 100644
--- a/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
+++ b/package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch
@@ -1,7 +1,9 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 --- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
 +++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
+@@ -80,14 +80,20 @@
+ # Checks for libraries.
  
  if test "$DRI" != no; then
 -	AC_CHECK_FILE([${sdkdir}/dri.h],
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
