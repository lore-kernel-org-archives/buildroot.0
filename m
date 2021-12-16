Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26784C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBF5A82486;
	Thu, 16 Dec 2021 19:51:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyPUB92W-8_b; Thu, 16 Dec 2021 19:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFF681D7D;
	Thu, 16 Dec 2021 19:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 854501C113E
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 750F0417AA
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cNu21GVLRls for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:51:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3E39417A9
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:51:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 323F481DED; Thu, 16 Dec 2021 19:45:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:23:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7f7124ee0a1fa328f26fb1b6ca940bc0018f5e3
X-Git-Newrev: 2b906b975a956bd2b6352b2eec6c3c697317bbbe
X-Patchwork-Hint: ignore
Message-Id: <20211216194555.323F481DED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: bump version to 1.1.1m
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b906b975a956bd2b6352b2eec6c3c697317bbbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Minor bugfix release:

 Changes between 1.1.1l and 1.1.1m [14 Dec 2021]

  *) Avoid loading of a dynamic engine twice.
     [Bernd Edlinger]

  *) Fixed building on Debian with kfreebsd kernels
     [Mattias Ellert]

  *) Prioritise DANE TLSA issuer certs over peer certs
     [Viktor Dukhovni]

  *) Fixed random API for MacOS prior to 10.12
     These MacOS versions don't support the CommonCrypto APIs
     [Lenny Primak]

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 93c688d9dd..a055cbc270 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-1.1.1l.tar.gz.sha256
-sha256  0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1  openssl-1.1.1l.tar.gz
+# From https://www.openssl.org/source/openssl-1.1.1m.tar.gz.sha256
+sha256  f89199be8b23ca45fc7cb9f1d8d3ee67312318286ad030f5316aca6462db6c96  openssl-1.1.1m.tar.gz
 
 # License files
 sha256  c32913b33252e71190af2066f08115c69bc9fddadf3bf29296e20c835389841c  LICENSE
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index f139213315..bd8ef6141a 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 1.1.1l
+LIBOPENSSL_VERSION = 1.1.1m
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = OpenSSL or SSLeay
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
