Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1080C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608E760AC1;
	Mon,  8 Jul 2024 20:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-ztJ2L6CZt2; Mon,  8 Jul 2024 20:20:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F7F460A67
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F7F460A67;
	Mon,  8 Jul 2024 20:20:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E6291BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85C6F8101F
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4KyXSgp-vsD for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE24881024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE24881024
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACF1083FEA; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:14:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39d124dd7f169e2e7d4dad9bdd1dfd0eff4f3d24
X-Git-Newrev: d584a2e0d593598e61db9ad435f4555c79c71743
X-Patchwork-Hint: ignore
Message-Id: <20240708202013.ACF1083FEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vtun: update the patches to be
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d584a2e0d593598e61db9ad435f4555c79c71743
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, vtun fails to build with output:

    Applying 0002-fix-ssl-headers-checks.patch using patch:
    patching file configure.in
    Hunk #1 succeeded at 169 (offset 3 lines).
    Hunk #2 succeeded at 179 (offset 3 lines).
    Hunk #3 FAILED at 193.
    Hunk #4 FAILED at 208.
    2 out of 4 hunks FAILED -- saving rejects to file configure.in.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vtun/0002-fix-ssl-headers-checks.patch | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/vtun/0002-fix-ssl-headers-checks.patch b/package/vtun/0002-fix-ssl-headers-checks.patch
index 765411af84..a095a1ba58 100644
--- a/package/vtun/0002-fix-ssl-headers-checks.patch
+++ b/package/vtun/0002-fix-ssl-headers-checks.patch
@@ -5,11 +5,13 @@ Do. Not. Do. That. It breaks cross-compilation.
 Also use the SSL headers dir to look for blowfish headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 --- vtun-3.0.3.orig/configure.in	2009-03-29 12:08:51.000000000 +0200
 +++ vtun-3.0.3/configure.in	2013-02-16 23:44:44.004339680 +0100
-@@ -166,7 +166,7 @@
+@@ -169,7 +169,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for md5 Library and Header files ... )
  AC_SEARCH_HEADERS(md5.h,
@@ -18,7 +20,7 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
      ,
      AC_MSG_ERROR( SSL headers not found. )
     )
-@@ -176,7 +176,7 @@
+@@ -179,7 +179,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for blowfish Library and Header files ... )
     AC_SEARCH_HEADERS(blowfish.h,
@@ -27,7 +29,7 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
  	AC_CHECK_LIB(crypto, BF_set_key,
  	    [
  	       LIBS="$LIBS -lcrypto"
-@@ -193,7 +193,7 @@
+@@ -196,7 +196,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for AES Library and Header files ... )
     AC_SEARCH_HEADERS(aes.h,
@@ -35,8 +37,8 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 +    $SSL_HDR_DIR ,
  	AC_CHECK_LIB(crypto, AES_set_encrypt_key,
  	    [
- 	       AC_DEFINE(HAVE_SSL_AES)
-@@ -208,7 +208,7 @@
+ 	       AC_DEFINE(HAVE_SSL_AES, [1], [Define to 1 if you have AES in openssl])
+@@ -211,7 +211,7 @@
     AC_MSG_RESULT()
     AC_CHECKING( for EVP Library and Header files ... )
     AC_SEARCH_HEADERS(evp.h,
@@ -44,4 +46,4 @@ diff -durN vtun-3.0.3.orig/configure.in vtun-3.0.3/configure.in
 +    $SSL_HDR_DIR ,
  	AC_CHECK_LIB(crypto, EVP_EncryptInit,
  	    [
- 	       AC_DEFINE(HAVE_SSL_EVP)
+ 	       AC_DEFINE(HAVE_SSL_EVP, [1], [Define to 1 if you have EVP in openssl])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
