Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9DFCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E9EB41F8A;
	Fri, 29 May 2026 08:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BUa17yFjd64; Fri, 29 May 2026 08:25:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 530BD41F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043121;
	bh=Zgtn6qaEVbWlRl1m0ETAJgsxNt8IFQAA9AhOWHcNTno=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aqykv1iJma9WJXaN4pmzPXl831X+HdbuWQF2GSPmKzd4nCXVBHs+4zo+2cB0xi8ae
	 9zczOzIL8QF9OQ951v7G9+1FzfugQuRF4YPSGpORHjOfeIZA7q3GJ/daMVycTOl5NK
	 V/Ed8+xSqsWxrs8VquuGXwnTz/i0Zh75CCAJBVFEt1DHYA+6bnuhaOQFvIB+L+RmPk
	 eU9rAQS9kPE4x+9ny7g48pC8mWF8cw2ky42LK1oNcisLHUrz1dvxjumTRl8GNIaxC6
	 Ly8Umv5dFpCHtJCZORafWB3fskVGHAW5i43RcFmWyi8KCiaTPhk6FMQzR11ETIP/P5
	 c8qiZQnawPTWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 530BD41F60;
	Fri, 29 May 2026 08:25:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DED4328E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFB1241F88
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2LwmO4oxtsbe for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7684041F5A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7684041F5A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A9587171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:19:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1d5d7d47c10692195166dfb70d57bb4d75ec75ff
X-Git-Newrev: d3463e71b1aab6ec14ad369fd25fbf31adf27cb5
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.07A9587171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgpg-error:
 bump version to 1.58
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d3463e71b1aab6ec14ad369fd25fbf31adf27cb5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;h=c60ad85d84da2a1721e6bb8c4ae95e645be1b201;hb=e880193c55f0321bbefc16be3194fdbb7a48078f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a87bfa1183c0b4073a188f13a692b133b92a339c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index d02983d1ca..ede1a2113e 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
-sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
+sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
+sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1fb1076ef3..5207d926df 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.56
+LIBGPG_ERROR_VERSION = 1.58
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
