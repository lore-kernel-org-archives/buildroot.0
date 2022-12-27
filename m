Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A945C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 21:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32214094C;
	Tue, 27 Dec 2022 21:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32214094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAzoRr-mwT6F; Tue, 27 Dec 2022 21:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780314093D;
	Tue, 27 Dec 2022 21:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 780314093D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BA751BF847
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAE6340934
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAE6340934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Ouoxlo3kAY1 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B77134093D
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B77134093D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A556786EF1; Tue, 27 Dec 2022 21:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 22:33:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56763ca01229ead2dba2cfb27025b41c0a5e18ed
X-Git-Newrev: 90a543de880010776b291193eb0d3bc8d27fe3e8
X-Patchwork-Hint: ignore
Message-Id: <20221227213332.A556786EF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvncserver: bump to version
 0.9.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=90a543de880010776b291193eb0d3bc8d27fe3e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- examples and tests can be disabled since
  https://github.com/LibVNC/libvncserver/commit/0b8990784a81823eecc9089263ac1966d17bf399

https://github.com/LibVNC/libvncserver/releases/tag/LibVNCServer-0.9.14

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...to_openssl.c-fix-build-with-libressl-3.5..patch | 66 ----------------------
 ...nt-free-vncRec-memory-in-rfbClientCleanup.patch | 28 ---------
 package/libvncserver/libvncserver.hash             |  2 +-
 package/libvncserver/libvncserver.mk               |  9 ++-
 4 files changed, 5 insertions(+), 100 deletions(-)

diff --git a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch b/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
deleted file mode 100644
index 110976c4bb..0000000000
--- a/package/libvncserver/0001-common-crypto_openssl.c-fix-build-with-libressl-3.5..patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 97fbbd678b2012e64acddd523677bc55a177bc58 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 12 May 2022 20:41:50 +0200
-Subject: [PATCH] common/crypto_openssl.c: fix build with libressl >= 3.5.0
- (#522)
-
-Fix the following build failure with libressl >= 3.5.0:
-
-/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c: In function 'dh_generate_keypair':
-/nvmedata/autobuild/instance-26/output-1/build/libvncserver-0.9.13/common/crypto_openssl.c:149:7: error: dereferencing pointer to incomplete type 'DH' {aka 'struct dh_st'}
-  149 |     dh->p = BN_bin2bn(prime, keylen, NULL);
-      |       ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/49b3940b9d0432cb5fb0c5d22dfa017b18c6e233
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/97fbbd678b2012e64acddd523677bc55a177bc58]
----
- common/crypto_openssl.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/common/crypto_openssl.c b/common/crypto_openssl.c
-index 60d4bd4df..51d7ec2d9 100644
---- a/common/crypto_openssl.c
-+++ b/common/crypto_openssl.c
-@@ -138,14 +138,16 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
- {
-     int result = 0;
-     DH *dh;
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER >= 0x30500000)
-     const BIGNUM *pub_key = NULL;
-     const BIGNUM *priv_key = NULL;
- #endif
- 
-     if(!(dh = DH_new()))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     dh->p = BN_bin2bn(prime, keylen, NULL);
-     dh->g = BN_bin2bn(gen, gen_len, NULL);
- #else
-@@ -154,7 +156,8 @@ int dh_generate_keypair(uint8_t *priv_out, uint8_t *pub_out, const uint8_t *gen,
- #endif
-     if(!DH_generate_key(dh))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined (LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     if(BN_bn2bin(dh->priv_key, priv_out) == 0)
- 	goto out;
-     if(BN_bn2bin(dh->pub_key, pub_out) == 0)
-@@ -181,7 +184,8 @@ int dh_compute_shared_key(uint8_t *shared_out, const uint8_t *priv, const uint8_
- 
-     if(!(dh = DH_new()))
- 	goto out;
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined LIBRESSL_VERSION_NUMBER
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined LIBRESSL_VERSION_NUMBER && LIBRESSL_VERSION_NUMBER < 0x30500000)
-     dh->p = BN_bin2bn(prime, keylen, NULL);
-     dh->priv_key = BN_bin2bn(priv, keylen, NULL);
- #else
diff --git a/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch b/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
deleted file mode 100644
index 7658c112f3..0000000000
--- a/package/libvncserver/0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From bef41f6ec4097a8ee094f90a1b34a708fbd757ec Mon Sep 17 00:00:00 2001
-From: Christian Beier <info@christianbeier.net>
-Date: Sat, 21 Nov 2020 12:52:31 +0100
-Subject: [PATCH] libvncclient: free vncRec memory in rfbClientCleanup()
-
-Otherwise we leak memory. Spotted by Ramin Farajpour Cami
-<ramin.blackhat@gmail.com>, thanks!
-
-[Retrieved from:
-https://github.com/LibVNC/libvncserver/commit/bef41f6ec4097a8ee094f90a1b34a708fbd757ec]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libvncclient/vncviewer.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libvncclient/vncviewer.c b/libvncclient/vncviewer.c
-index d6b91f02b..0a1bdcf6a 100644
---- a/libvncclient/vncviewer.c
-+++ b/libvncclient/vncviewer.c
-@@ -534,6 +534,8 @@ void rfbClientCleanup(rfbClient* client) {
-     client->clientData = next;
-   }
- 
-+  free(client->vncRec);
-+
-   if (client->sock != RFB_INVALID_SOCKET)
-     rfbCloseSocket(client->sock);
-   if (client->listenSock != RFB_INVALID_SOCKET)
diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 8e61a3d0ea..225c42e46a 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0ae5bb9175dc0a602fe85c1cf591ac47ee5247b87f2bf164c16b05f87cbfa81a  LibVNCServer-0.9.13.tar.gz
+sha256  83104e4f7e28b02f8bf6b010d69b626fae591f887e949816305daebae527c9a5  LibVNCServer-0.9.14.tar.gz
 sha256  4d23c8c814e5baf007d854f01d8502e77dc56a41144934e003fb32c4e052d20f  COPYING
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 8f24e2d098..700e26a8d6 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.13
+LIBVNCSERVER_VERSION = 0.9.14
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPL-2.0+
@@ -14,14 +14,13 @@ LIBVNCSERVER_INSTALL_STAGING = YES
 LIBVNCSERVER_DEPENDENCIES = host-pkgconf lzo
 LIBVNCSERVER_CONF_OPTS = -DWITH_LZO=ON
 
-# 0002-libvncclient-free-vncRec-memory-in-rfbClientCleanup.patch
-LIBVNCSERVER_IGNORE_CVES += CVE-2020-29260
-
 # only used for examples
 LIBVNCSERVER_CONF_OPTS += \
+	-DWITH_EXAMPLES=OFF \
 	-DWITH_FFMPEG=OFF \
 	-DWITH_GTK=OFF \
-	-DWITH_SDL=OFF
+	-DWITH_SDL=OFF \
+	-DWITH_TESTS=OFF
 
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBVNCSERVER_CONF_OPTS += -DWITH_THREADS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
