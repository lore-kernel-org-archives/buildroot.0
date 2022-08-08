Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA01C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ECB140222;
	Mon,  8 Aug 2022 14:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4ECB140222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBIGt1ln8y36; Mon,  8 Aug 2022 14:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 421FC40A81;
	Mon,  8 Aug 2022 14:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421FC40A81
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE2E71BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8234408AD
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:40:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8234408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gMo3iCLOweUp for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:40:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1D340873
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1D340873
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 05F7C86FCC; Mon,  8 Aug 2022 14:26:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:38:55 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 10a192a07e1ac309cede246694f6756cdc2dbea4
X-Git-Newrev: ecf8efb292fb410ab8080891fb017d4a01ef3cd5
X-Patchwork-Hint: ignore
Message-Id: <20220808142614.05F7C86FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libp11: bump to
 version 0.4.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ecf8efb292fb410ab8080891fb017d4a01ef3cd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

- Drop patch (already in version)
- This bump will also fix the following build failure with libressl raised
  since bump to version 3.5.2 in commit
  8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

  p11_cert.c: In function 'pkcs11_store_certificate':
  p11_cert.c:310:34: error: dereferencing pointer to incomplete type 'X509' {aka 'struct x509_st'}
    310 |  signature_nid = OBJ_obj2nid(x509->sig_alg->algorithm);
        |                                  ^~

https://github.com/OpenSC/libp11/releases/tag/libp11-0.4.12

Fixes:
 - http://autobuild.buildroot.org/results/3acfa1419b59f7daa58fa8e61abc63ecb00f853c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/0001-Update-wp11_rsa.c.patch | 26 --------------------------
 package/libp11/libp11.hash                  |  2 +-
 package/libp11/libp11.mk                    |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/package/libp11/0001-Update-wp11_rsa.c.patch b/package/libp11/0001-Update-wp11_rsa.c.patch
deleted file mode 100644
index 0a2d6e65ce..0000000000
--- a/package/libp11/0001-Update-wp11_rsa.c.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4968cfc64dbaa39bb479a24d9578d75099e2f337 Mon Sep 17 00:00:00 2001
-From: patchMonkey156 <pagorman@asu.edu>
-Date: Mon, 19 Oct 2020 17:12:15 -0400
-Subject: [PATCH] Update p11_rsa.c
-
-Bugfix for new LibreSSL version 3.2.2
-[Retrieved from:
-https://github.com/OpenSC/libp11/commit/4968cfc64dbaa39bb479a24d9578d75099e2f337]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/p11_rsa.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/p11_rsa.c b/src/p11_rsa.c
-index b6beef0..ff12ed7 100644
---- a/src/p11_rsa.c
-+++ b/src/p11_rsa.c
-@@ -336,7 +336,7 @@ int pkcs11_get_key_size(PKCS11_KEY *key)
- 	return RSA_size(rsa);
- }
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100005L || defined(LIBRESSL_VERSION_NUMBER)
-+#if ( ( defined (OPENSSL_VERSION_NUMBER) && OPENSSL_VERSION_NUMBER < 0x10100005L ) || ( defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x3020199L ) )
- 
- int (*RSA_meth_get_priv_enc(const RSA_METHOD *meth))
- 		(int flen, const unsigned char *from,
diff --git a/package/libp11/libp11.hash b/package/libp11/libp11.hash
index 52d73d4206..0e42bdd4cf 100644
--- a/package/libp11/libp11.hash
+++ b/package/libp11/libp11.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  57d47a12a76fd92664ae30032cf969284ebac1dfc25bf824999d74b016d51366  libp11-0.4.11.tar.gz
+sha256  1e1a2533b3fcc45fde4da64c9c00261b1047f14c3f911377ebd1b147b3321cfd  libp11-0.4.12.tar.gz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING
diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index c1873a920c..7718573ace 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBP11_VERSION = 0.4.11
+LIBP11_VERSION = 0.4.12
 LIBP11_SITE = https://github.com/OpenSC/libp11/releases/download/libp11-$(LIBP11_VERSION)
 LIBP11_DEPENDENCIES = openssl host-pkgconf
 LIBP11_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
