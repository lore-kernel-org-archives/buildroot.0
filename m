Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397FAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 07:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D65F640A18;
	Sun, 17 Jul 2022 07:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D65F640A18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aG2HID5A6osz; Sun, 17 Jul 2022 07:20:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8852340A0D;
	Sun, 17 Jul 2022 07:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8852340A0D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5177D1BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C99F846C0
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 07:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C99F846C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wf2gywC5uiGf for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D9A084675
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 07:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9A084675
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B152783902; Sun, 17 Jul 2022 07:06:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 09:19:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9353c93a4f944fe79e4b49ee15014a8eebb26216
X-Git-Newrev: 86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb
X-Patchwork-Hint: ignore
Message-Id: <20220717070652.B152783902@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libp11: bump to version 0.4.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=86ab91483dcb4b60de8c1daa20e2f42bd95ab5fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
