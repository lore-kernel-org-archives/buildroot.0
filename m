Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A4C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 17:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B74940141;
	Sat, 15 Jan 2022 17:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vThOExzJu53e; Sat, 15 Jan 2022 17:31:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7922F4088F;
	Sat, 15 Jan 2022 17:31:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65E331BF3BE
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 17:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F554038E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 17:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MR35Z12F6aFe for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 17:31:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7472C40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 17:31:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EDA018258B; Sat, 15 Jan 2022 17:25:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 18:31:19 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 6aa6048432f9bf55527d79997f77b0f6feacae8c
X-Git-Newrev: d7642ecec5ea91fc1aabb72153d0dc497cc0471e
X-Patchwork-Hint: ignore
Message-Id: <20220115172504.EDA018258B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/libopenssl: bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7642ecec5ea91fc1aabb72153d0dc497cc0471e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
