Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11203C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD43260A3E;
	Mon,  8 Jul 2024 20:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LKiHIL1mQgGY; Mon,  8 Jul 2024 20:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A25E760A5E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A25E760A5E;
	Mon,  8 Jul 2024 20:20:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3B0641BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7C73404D4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pqMzRMjSNuR for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6DD404D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B6DD404D1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EFB081843; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:13:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ebc7c69d56430c34eba4c869d1d4fe4d1e8de55
X-Git-Newrev: 3805820d550467121d74320a8fb76663fb57b698
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.6EFB081843@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janus-gateway: update the patches
 to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3805820d550467121d74320a8fb76663fb57b698
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, janus-gateway fails to build with output:

    Applying 0002-Add-test-for-Wunused-but-set-variable.patch using patch:
    patching file src/Makefile.am
    Hunk #1 succeeded at 132 (offset -19 lines).
    patching file configure.ac
    Hunk #1 succeeded at 12 (offset -1 lines).
    Hunk #2 FAILED at 67.
    1 out of 2 hunks FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                    |  1 -
 .../0002-Add-test-for-Wunused-but-set-variable.patch   | 18 ++++++++++--------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0a1d262745..9e9c493711 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -767,7 +767,6 @@ package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
 package/iucode-tool/S00iucode-tool lib_sysv.Variables
 package/iwd/S40iwd Shellcheck lib_sysv.Variables
 package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
-package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch lib_patch.Upstream
 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch lib_patch.Upstream
 package/jose/0002-man-add-option-to-skip-building-man-pages.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
diff --git a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
index 31796d6e28..4596577af3 100644
--- a/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
+++ b/package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch
@@ -20,8 +20,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 [rebased against v1.0.3)
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: rejected
-(https://github.com/meetecho/janus-gateway/pull/1789)]
+Upstream: rejected (https://github.com/meetecho/janus-gateway/pull/1789)
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+
 ---
  Makefile.am                 |  1 +
  configure.ac                |  6 ++-
@@ -30,10 +32,10 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  create mode 100644 m4/ax_check_compile_flag.m4
 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index f961fdb..3ddbe59 100644
+index 96d361e53be0..a8bfd17c930c 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -151,6 +151,7 @@ janus_CFLAGS = \
+@@ -132,6 +132,7 @@ janus_CFLAGS = \
  	-DEVENTDIR=\"$(eventdir)\" \
  	-DLOGGERDIR=\"$(loggerdir)\" \
  	-DCONFDIR=\"$(confdir)\" \
@@ -42,10 +44,10 @@ index f961fdb..3ddbe59 100644
  	$(NULL)
  
 diff --git a/configure.ac b/configure.ac
-index ca17a29..beef91a 100644
+index c37c85b7ab06..5afe0ef0bbff 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -13,6 +13,9 @@ AM_SILENT_RULES([yes])
+@@ -12,6 +12,9 @@ AM_SILENT_RULES([yes])
  AC_USE_SYSTEM_EXTENSIONS
  
  AC_PROG_CC
@@ -55,7 +57,7 @@ index ca17a29..beef91a 100644
  
  LT_PREREQ([2.2])
  LT_INIT
-@@ -64,8 +67,7 @@ clang*)
+@@ -65,8 +68,7 @@ cc*)
  	CFLAGS="$CFLAGS \
  		-Wcast-align \
  		-Wno-override-init \
@@ -64,7 +66,7 @@ index ca17a29..beef91a 100644
 +		-Wunsafe-loop-optimizations"
  esac
  
- JANUS_VERSION=103
+ JANUS_VERSION=1102
 diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
 new file mode 100644
 index 0000000..51df0c0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
