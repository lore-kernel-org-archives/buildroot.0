Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF36C433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B830860E0F;
	Tue,  1 Nov 2022 20:26:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B830860E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pi7486et93Eu; Tue,  1 Nov 2022 20:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF25D60D70;
	Tue,  1 Nov 2022 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF25D60D70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D06F21BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6A3660E0F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A3660E0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DWAX03ooPb1l for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E234560D70
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E234560D70
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CCDEE85EE1; Tue,  1 Nov 2022 20:26:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:19:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d797892474b241eb00fca66ef1956e548233276
X-Git-Newrev: bfe4828f539167c9d891ca322c2e54b4961508e7
X-Patchwork-Hint: ignore
Message-Id: <20221101202612.CCDEE85EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: bump to version 3.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfe4828f539167c9d891ca322c2e54b4961508e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch | 2 +-
 package/libressl/libressl.hash                              | 2 +-
 package/libressl/libressl.mk                                | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index 1c59aec723..48f3fa16e0 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -20,7 +20,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -408,11 +408,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -412,11 +412,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 7a7638b2db..0988e6a36d 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  3ab5e5eaef69ce20c6b170ee64d785b42235f48f2e62b095fca5d7b6672b8b28  libressl-3.5.3.tar.gz
+sha256  acfac61316e93b919c28d62d53037ca734de85c46b4d703f19fd8395cf006774  libressl-3.6.1.tar.gz
 # Locally computed
 sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 85d1fe5e3a..8fd7bccbc4 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.5.3
+LIBRESSL_VERSION = 3.6.1
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
