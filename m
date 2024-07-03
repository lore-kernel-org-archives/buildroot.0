Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F08BC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 139CD61027;
	Wed,  3 Jul 2024 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPx311q8OrfN; Wed,  3 Jul 2024 20:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 168BB61025
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 168BB61025;
	Wed,  3 Jul 2024 20:25:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 595A21BF36E
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BDD261025
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 20:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SR0DF6B4A9m for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 20:25:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47E3A61027
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47E3A61027
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 20:25:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E5C583C14; Wed,  3 Jul 2024 20:25:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 22:23:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a82ad53371e4d4181e2ba1fa3842a4f3d036a4ea
X-Git-Newrev: 99423ee495ee28789edcc98ff8f92876a294dc37
X-Patchwork-Hint: ignore
Message-Id: <20240703202508.3E5C583C14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ncmpc: update the patches to be
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

commit: https://git.buildroot.net/buildroot/commit/?id=99423ee495ee28789edcc98ff8f92876a294dc37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, ncmpc fails to build with output:

    Applying 0001-meson.build-add-atomic-dependency-for-sparc.patch using patch:
    patching file meson.build
    Hunk #1 succeeded at 232 (offset 58 lines).
    Hunk #2 FAILED at 355.
    1 out of 2 hunks FAILED -- saving rejects to file meson.build.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                      |  1 -
 ...001-meson.build-add-atomic-dependency-for-sparc.patch | 16 +++++++++-------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 9a7a3af757..0a1d262745 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1053,7 +1053,6 @@ package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
 package/musl/0002-package-musl-Make-scheduler-functions-Linux-compatib.patch lib_patch.Upstream
 package/nano/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch lib_patch.Upstream
 package/nanocom/0001-fix-build-with-gcc-10.patch lib_patch.Upstream
-package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch lib_patch.Upstream
 package/ne10/0001-CMakeLists-don-t-hard-code-thumb-code-generation.patch lib_patch.Upstream
 package/ne10/0002-fix-build-without-C.patch lib_patch.Upstream
 package/neard/S53neard Shellcheck lib_sysv.Indent lib_sysv.Variables
diff --git a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
index fd24589760..2b726b7437 100644
--- a/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
+++ b/package/ncmpc/0001-meson.build-add-atomic-dependency-for-sparc.patch
@@ -1,4 +1,4 @@
-From d2bd33ec18c146b27fb5aff7dd0089faa195ef9b Mon Sep 17 00:00:00 2001
+From 72ef4c1c3c11fc05c057f2b40b87de92a573f2eb Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 11 Feb 2019 21:42:01 +0100
 Subject: [PATCH] meson.build: add atomic dependency for sparc
@@ -11,16 +11,18 @@ Fixes:
  - http://autobuild.buildroot.org/results/7ac1a07e4f72633d3ec92b79dc5d8c062490abdc
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MusicPlayerDaemon/ncmpc/pull/45]
+Upstream: https://github.com/MusicPlayerDaemon/ncmpc/pull/45
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  meson.build | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index 2e6defc..b393e39 100644
+index fa0eff9408b6..819674cbede4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -174,6 +174,9 @@ else
+@@ -232,6 +232,9 @@ else
    pcre_dep = declare_dependency()
  endif
  
@@ -30,14 +32,14 @@ index 2e6defc..b393e39 100644
  inc = include_directories(
    'src',
  
-@@ -352,6 +355,7 @@ ncmpc = executable('ncmpc',
+@@ -445,6 +448,7 @@ ncmpc = executable('ncmpc',
    sources,
    include_directories: inc,
    dependencies: [
 +    atomic_dep,
      thread_dep,
-     boost_dep,
+     event_dep,
      pcre_dep,
 -- 
-2.14.1
+2.43.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
