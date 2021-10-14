Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D8FC433FE
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EF861090
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08EF861090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD2B340674;
	Thu, 14 Oct 2021 21:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RrDHbUM0dVVO; Thu, 14 Oct 2021 21:45:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 296264047E;
	Thu, 14 Oct 2021 21:45:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 694941BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A74D831A9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTqoQq-6niAQ for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EBFF831EF
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 361AD95291; Thu, 14 Oct 2021 21:39:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:33:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a26c32452022f57290f3bffd662fadfe0016ea3
X-Git-Newrev: 3a5ecdf8f65bffe67097a7bb5efa4dcb6dd040b7
X-Patchwork-Hint: ignore
Message-Id: <20211014213947.361AD95291@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libeXosip2: bump to version 5.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a5ecdf8f65bffe67097a7bb5efa4dcb6dd040b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch as it is present upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...-src-eXtls_dtls.c-fix-build-with-libressl.patch | 34 ----------------------
 package/libeXosip2/libeXosip2.hash                 |  2 +-
 package/libeXosip2/libeXosip2.mk                   |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch b/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
deleted file mode 100644
index b153eee65c..0000000000
--- a/package/libeXosip2/0001-src-eXtls_dtls.c-fix-build-with-libressl.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 178632fa5530a72f50376a60d59be2a07e65c28b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 6 Mar 2021 15:20:51 +0100
-Subject: [PATCH] src/eXtls_dtls.c: fix build with libressl
-
-Build with libressl is broken since
-https://git.savannah.nongnu.org/cgit/exosip.git/commit/?id=d7488b7bbf59870192372384ef338a44be23e888
-because libressl does not define SSL_set0_rbio
-
-Fixes:
- - http://autobuild.buildroot.org/results/89d8d4ba99d6dcc1618cf6b5302c124a92d75be9
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to amoizard@antisip.com]
----
- src/eXtl_dtls.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/eXtl_dtls.c b/src/eXtl_dtls.c
-index 40fa658..8ac3a13 100644
---- a/src/eXtl_dtls.c
-+++ b/src/eXtl_dtls.c
-@@ -70,7 +70,7 @@
- #define RANDOM  "random.pem"
- #define DHFILE "dh1024.pem"
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
- 
- static void
- SSL_set0_rbio (SSL * s, BIO * rbio)
--- 
-2.30.0
-
diff --git a/package/libeXosip2/libeXosip2.hash b/package/libeXosip2/libeXosip2.hash
index 53e27e929c..b88a5b4c21 100644
--- a/package/libeXosip2/libeXosip2.hash
+++ b/package/libeXosip2/libeXosip2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3ae88df8573c9e08dbc24fe6195a118845e845109a8e291c91ecd6a2a3b7225  libexosip2-5.2.0.tar.gz
+sha256  87256b45a406f3c038e1e75e31372d526820366527c2af3bb89329bafd87ec42  libexosip2-5.2.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index 3ed637a3d4..b550e293ae 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBEXOSIP2_VERSION = 5.2.0
+LIBEXOSIP2_VERSION = 5.2.1
 # Since version 5.0, letter 'X' in library's name is in lower case
 LIBEXOSIP2_SOURCE = libexosip2-$(LIBEXOSIP2_VERSION).tar.gz
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
