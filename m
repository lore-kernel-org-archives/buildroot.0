Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A357BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:00:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A3160FE3
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 31A3160FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 025A5817F2;
	Sun, 17 Oct 2021 17:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O5V1cSAt-FtO; Sun, 17 Oct 2021 17:00:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65A4580F75;
	Sun, 17 Oct 2021 17:00:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 370DA1BF295
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3251F40108
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8yV2hClzQJNs for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3004B400F6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 790F295CDF; Sun, 17 Oct 2021 16:56:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:59:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69147f0391efa5c2a62f6413a4f588383e774bfa
X-Git-Newrev: ebc6c7e5b4317add90aca500656b51a4aaa30e7f
X-Patchwork-Hint: ignore
Message-Id: <20211017165650.790F295CDF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glibc: remove glibc csky fork
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

commit: https://git.buildroot.net/buildroot/commit/?id=ebc6c7e5b4317add90aca500656b51a4aaa30e7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Before removing csky gcc fork, remove the glibc fork.

csky support has been merged in glibc 2.29 [1].

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5f72b00591ce4d1b4c0418294ffe1623983d5679

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Asked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash | 2 --
 package/glibc/glibc.mk                                            | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash b/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
deleted file mode 100644
index a61bd65f80..0000000000
--- a/package/glibc/7630ed2fa60caea98f500e4a7a51b88f9bf1e176/glibc.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated (fetched from https://github.com/c-sky/glibc)
-sha512 9deb2deceefe347d72de13510a5baa3de00f94c684f3b25e136ca3660f61e65a69f2115abb488c2ab0fa93cda8535853ce1e13e186efcc8434ecc4049efd82b5  glibc-7630ed2fa60caea98f500e4a7a51b88f9bf1e176.tar.gz
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index c911c29554..3862e0624b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -4,10 +4,6 @@
 #
 ################################################################################
 
-ifeq ($(BR2_csky),y)
-GLIBC_VERSION = 7630ed2fa60caea98f500e4a7a51b88f9bf1e176
-GLIBC_SITE = $(call github,c-sky,glibc,$(GLIBC_VERSION))
-else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
@@ -19,7 +15,6 @@ GLIBC_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 # *NEVER* decide on a version string by looking at the mirror.
 # Then check that the mirror has been synced already (happens once a day.)
 GLIBC_SITE = $(call github,bminor,glibc,$(GLIBC_VERSION))
-endif
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
 GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
