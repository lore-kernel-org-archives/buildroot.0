Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0E1C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4CE681769;
	Fri, 12 Jul 2024 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXYs0oJZscnp; Fri, 12 Jul 2024 19:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A89884050
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A89884050;
	Fri, 12 Jul 2024 19:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7E31BF279
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69BFC4011D
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 19:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kRxrLzyaoKfq for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 19:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 057734000B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 057734000B
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 19:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E23E181402; Fri, 12 Jul 2024 19:43:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 21:40:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b162aab7c6da6b45dc5ba9ad30b59b4362e2dc2e
X-Git-Newrev: 430921120fdd6285c07557fcae010e10b7715235
X-Patchwork-Hint: ignore
Message-Id: <20240712194301.E23E181402@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: update the patches to be
 applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=430921120fdd6285c07557fcae010e10b7715235
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, udpcast fails to build with output:

    Applying 0001-fix-musl-build.patch using patch:
    patching file receivedata.c
    Hunk #1 FAILED at 1.
    1 out of 1 hunk FAILED -- saving rejects to file receivedata.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                       | 1 -
 package/udpcast/0001-fix-musl-build.patch | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2c0f265d96..9546391d1f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1384,7 +1384,6 @@ package/uboot-tools/0001-drop-configh-from-tools.patch lib_patch.Upstream
 package/uboot-tools/0002-tools-only-in-no-dot-config-targets.patch lib_patch.Upstream
 package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.patch lib_patch.Upstream
 package/ubus/0001-Install-server-and-client-examples.patch lib_patch.Upstream
-package/udpcast/0001-fix-musl-build.patch lib_patch.Upstream
 package/uemacs/01-clear-ixon-termios-flag.patch lib_patch.Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch lib_patch.Upstream
 package/uhttpd/0001-Remove-Werror.patch lib_patch.Upstream
diff --git a/package/udpcast/0001-fix-musl-build.patch b/package/udpcast/0001-fix-musl-build.patch
index 0e213b2793..e24f3e9e94 100644
--- a/package/udpcast/0001-fix-musl-build.patch
+++ b/package/udpcast/0001-fix-musl-build.patch
@@ -15,8 +15,9 @@ Fixes:
  - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status:
-https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/]
+Upstream: https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/4MBES2CPUSUNIZTC7NXCQYS2GAE4DQSG/
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/receivedata.c
 --- udpcast-20211207.orig/receivedata.c	2022-08-13 21:48:06.226588614 +0200
@@ -27,5 +28,5 @@ diff '--color=auto' -Nura udpcast-20211207.orig/receivedata.c udpcast-20211207/r
  #include <unistd.h>
 +#include <stddef.h>
  #include <stdlib.h>
- #include <sys/time.h>
  #include <errno.h>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
