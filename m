Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6870FC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 13:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C601417E0;
	Wed,  3 Jul 2024 13:54:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cS1Ufc_7iceL; Wed,  3 Jul 2024 13:53:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A14414C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A14414C3;
	Wed,  3 Jul 2024 13:53:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DA6F11BF980
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D215A40319
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 13:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cr0-GwWOzAmT for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92902400AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92902400AF
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AC4683BD2; Wed,  3 Jul 2024 13:53:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 15:25:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32aacc4737e106a7ddb2f2129d4ab9f2279dcf92
X-Git-Newrev: 0ca30887794c0e9d333df7bcbb162f926bce3ca0
X-Patchwork-Hint: ignore
Message-Id: <20240703135352.7AC4683BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfcgi: update the patches to be
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ca30887794c0e9d333df7bcbb162f926bce3ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libfcgi fails to build with output:

    Applying 0001-link-against-math.patch using patch:
    patching file libfcgi/Makefile.am
    Hunk #1 FAILED at 18.
    1 out of 1 hunk FAILED -- saving rejects to file libfcgi/Makefile.am.rej

    Applying 0002-disable-examples.patch using patch:
    patching file Makefile.am
    Hunk #1 FAILED at 4.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej

This commit refreshes the package patches on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                          | 2 +-
 package/libfcgi/0001-link-against-math.patch | 4 +++-
 package/libfcgi/0002-disable-examples.patch  | 8 +++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dca7253453..ca94fb56b0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -809,7 +809,7 @@ package/libeXosip2/0001-src-eXtl_dtls.c-fix-build-with-libressl-3.4.1.patch lib_
 package/libedit/0001-check-bsd-functions-in-libbsd.patch lib_patch.Upstream
 package/libevent/0001-Don-t-define-BIO_get_init-for-LibreSSL-3-5.patch lib_patch.Upstream
 package/libfcgi/0001-link-against-math.patch lib_patch.Upstream
-package/libfcgi/0002-disable-examples.patch lib_patch.Sob lib_patch.Upstream
+package/libfcgi/0002-disable-examples.patch lib_patch.Upstream
 package/libffi/0001-Fix-use-of-compact-eh-frames-on-MIPS.patch lib_patch.Upstream
 package/libfm/0001-modules-fix-cross-compilation.patch lib_patch.Upstream
 package/libfreeimage/0001-no-root-install.patch lib_patch.Upstream
diff --git a/package/libfcgi/0001-link-against-math.patch b/package/libfcgi/0001-link-against-math.patch
index efba67123e..909a295bd6 100644
--- a/package/libfcgi/0001-link-against-math.patch
+++ b/package/libfcgi/0001-link-against-math.patch
@@ -3,12 +3,14 @@ Link libfcgi against the math library.
 Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
 [Louis: rebase on top of 2.4.2]
 Signed-off-by: Louis Rannou <louis.rannou@smile.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 Index: b/libfcgi/Makefile.am
 ===================================================================
 --- a/libfcgi/Makefile.am
 +++ b/libfcgi/Makefile.am
-@@ -18,4 +18,5 @@
+@@ -19,6 +19,7 @@
                       os_@SYSTEM@.c
  libfcgi_la_CC      = @PTHREAD_CC@
  libfcgi_la_CFLAGS  = @PTHREAD_CFLAGS@
diff --git a/package/libfcgi/0002-disable-examples.patch b/package/libfcgi/0002-disable-examples.patch
index 4a9916f02a..ccd01c0ce0 100644
--- a/package/libfcgi/0002-disable-examples.patch
+++ b/package/libfcgi/0002-disable-examples.patch
@@ -1,3 +1,5 @@
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 Common subdirectories: libfcgi-2.4.0.orig/cgi-fcgi and libfcgi-2.4.0/cgi-fcgi
 Common subdirectories: libfcgi-2.4.0.orig/doc and libfcgi-2.4.0/doc
 Common subdirectories: libfcgi-2.4.0.orig/examples and libfcgi-2.4.0/examples
@@ -8,9 +10,9 @@ Common subdirectories: libfcgi-2.4.0.orig/libfcgi and libfcgi-2.4.0/libfcgi
 diff -du libfcgi-2.4.0.orig/Makefile.am libfcgi-2.4.0/Makefile.am
 --- libfcgi-2.4.0.orig/Makefile.am	2001-12-22 14:05:39.000000000 +0100
 +++ libfcgi-2.4.0/Makefile.am	2014-07-19 16:56:21.935216540 +0200
-@@ -4,7 +4,7 @@
- #  $Id: Makefile.am,v 1.7 2001/12/22 13:05:39 robs Exp $
- #
+@@ -10,7 +10,7 @@
+ 		aclocal.m4 m4/libtool.m4 m4/lt*.m4 Makefile.in install-sh missing ltmain.sh \
+ 		COPYING INSTALL
  
 -SUBDIRS = libfcgi cgi-fcgi examples include
 +SUBDIRS = libfcgi cgi-fcgi include
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
