Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BE7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 17:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DD08813D8;
	Sat, 15 Jan 2022 17:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MhR-qSAL_jDM; Sat, 15 Jan 2022 17:31:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 755EF813CC;
	Sat, 15 Jan 2022 17:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFA5C1BF3BE
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 17:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93C734087C
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 17:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zRzMbK4xKyzB for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 17:31:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8626403C7
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 17:31:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3973F8258B; Sat, 15 Jan 2022 17:25:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 18:31:24 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 325b341440fa646818796a470eaf45241c7b1503
X-Git-Newrev: 5c7473698ed47c0cc5d385f6a9cd742991bff383
X-Patchwork-Hint: ignore
Message-Id: <20220115172500.3973F8258B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libopenssl: bump
 version to 1.1.1m
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c7473698ed47c0cc5d385f6a9cd742991bff383
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
(cherry picked from commit 2b906b975a956bd2b6352b2eec6c3c697317bbbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index b618e3e56b..e713afef7f 100644
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
