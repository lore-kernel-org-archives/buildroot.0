Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC523C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB95E60A35;
	Mon,  8 Jul 2024 20:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddrq4g3c6D33; Mon,  8 Jul 2024 20:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC5A60A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC5A60A47;
	Mon,  8 Jul 2024 20:20:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 132301BF97C
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EED038109E
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ekzULYfeTjpL for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 328AE80FAD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 328AE80FAD
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1AD3B83FF6; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3597b43b76406741bc0dd177ceeb017a85710ecf
X-Git-Newrev: 2be1f2004ed11010c489e03b4230ac298ecc240e
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.1AD3B83FF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgdiplus: update the patches to
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

commit: https://git.buildroot.net/buildroot/commit/?id=2be1f2004ed11010c489e03b4230ac298ecc240e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libgdiplus fails to build with output:

    Applying 0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch using patch:
    patching file Makefile.am
    patching file configure.ac
    Hunk #1 FAILED at 39.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
index 33746872ac..0ac5ecaad0 100644
--- a/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
+++ b/package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch
@@ -11,6 +11,8 @@ So let's disable the build of unit tests by default and introduce
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 Upstream: https://github.com/mono/libgdiplus/pull/701
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile.am  | 8 ++++++--
  configure.ac | 4 ++++
@@ -38,8 +40,8 @@ diff --git a/configure.ac b/configure.ac
 index 098fd0a664bd..c126ff091e58 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -39,6 +39,10 @@ if test $warnaserror = "yes"; then
-   GDIPLUS_CFLAGS="$GDIPLUS_CFLAGS -Werror -Wno-unknown-warning-option -Wno-clobbered -Wno-typedef-redefinition"
+@@ -47,6 +47,10 @@
+   GDIPLUS_CFLAGS="$GDIPLUS_CFLAGS -Werror -Wno-unknown-warning-option -Wno-clobbered"
  fi
  
 +AC_ARG_ENABLE(unittests, AS_HELP_STRING([--enable-unittests],[Enable building unit tests.]),[unittests=yes],[unittests=no])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
