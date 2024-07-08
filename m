Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E405C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E99C60A8F;
	Mon,  8 Jul 2024 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUuAMvp7EVij; Mon,  8 Jul 2024 20:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C235860A95
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C235860A95;
	Mon,  8 Jul 2024 20:20:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59AAD1BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44140404D4
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o7zNCBC4JFxb for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EEFF404E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EEFF404E1
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A37A83FF6; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3ac14653b256ad556cdcbd633e1ee9e562e8245
X-Git-Newrev: 3907da674cb3ddefb30314745c9e276a4a3d7487
X-Patchwork-Hint: ignore
Message-Id: <20240708202014.1A37A83FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: update the patches to
 be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3907da674cb3ddefb30314745c9e276a4a3d7487
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, openvmtools fails to build with output:

    Applying 0007-Use-configure-to-test-for-feature-instead-of-platfor.patch using patch:
    patching file configure.ac
    Hunk #1 succeeded at 940 (offset 142 lines).
    Hunk #2 succeeded at 1150 (offset 86 lines).
    patching file lib/misc/idLinux.c
    Hunk #2 succeeded at 1022 (offset 28 lines).
    patching file lib/nicInfo/nicInfoPosix.c
    Hunk #1 FAILED at 34.
    1 out of 1 hunk FAILED -- saving rejects to file lib/nicInfo/nicInfoPosix.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...e-configure-to-test-for-feature-instead-of-platfor.patch | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
index abbc518362..f10e74e152 100644
--- a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -22,6 +22,8 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
 [Retrieved (and slightly updated) from:
 http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/open-vm-tools/open-vm-tools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch?h=sumo]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  open-vm-tools/configure.ac               |  4 ++++
  open-vm-tools/lib/misc/idLinux.c         | 30 ++++++++++++++----------------
@@ -32,7 +34,7 @@ Index: open-vm-tools/configure.ac
 ===================================================================
 --- open-vm-tools.orig/configure.ac
 +++ open-vm-tools/configure.ac
-@@ -798,6 +798,7 @@ AC_CHECK_FUNCS(
+@@ -940,6 +940,7 @@
  
  AC_CHECK_FUNCS([ecvt])
  AC_CHECK_FUNCS([fcvt])
@@ -40,7 +42,7 @@ Index: open-vm-tools/configure.ac
  
  AC_CHECK_FUNC([mkdtemp], [have_mkdtemp=yes])
  
-@@ -1063,10 +1064,13 @@ AC_PATH_PROG(
+@@ -1149,10 +1150,13 @@
  ###
  
  AC_CHECK_HEADERS([crypt.h])
@@ -72,7 +74,7 @@ Index: open-vm-tools/lib/misc/idLinux.c
  #ifdef __APPLE__
  #include <sys/socket.h>
  #include <TargetConditionals.h>
-@@ -997,31 +994,32 @@ Id_EndSuperUser(uid_t uid)  // IN:
+@@ -1025,31 +1022,32 @@
  static Bool
  IdIsSetUGid(void)
  {
@@ -121,8 +123,7 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
 ===================================================================
 --- open-vm-tools.orig/lib/nicInfo/nicInfoPosix.c
 +++ open-vm-tools/lib/nicInfo/nicInfoPosix.c
-@@ -34,9 +34,13 @@
- #include <sys/socket.h>
+@@ -35,9 +35,13 @@
  #include <sys/stat.h>
  #include <errno.h>
  #include <limits.h>
@@ -137,7 +138,7 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
  # include <net/if.h>
  #endif
  #ifndef NO_DNET
-@@ -348,10 +352,7 @@ GuestInfoGetNicInfo(NicInfoV3 *nicInfo)
+@@ -499,10 +503,7 @@
   *
   ******************************************************************************
   */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
