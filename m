Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210BCC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D904D405AA;
	Fri, 10 Jul 2026 13:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFgyvOA-5fHS; Fri, 10 Jul 2026 13:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE12440BC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691131;
	bh=vh60Kckxcp7FhG1/1qTlUQLjDtoSNc6avIH/aAnHQuA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DH/0lAJwsW18OKqTKpBLna46kGctdHKg4AoMadhfcHDwGEcPfUzCpZfHmOaYPg4eL
	 9g67eAZq3G2CXFKX3zKXCuIGAeh6SAvX+RRaSLrBhCcIJzsJz363O8eXmukFfYFDkb
	 lUK4yfh9cp4vZSMOjG6kBIMK20aEjCcbR985oHJ4j2JQROgBvxXUR+iJYE/9Js4Hgm
	 /CTB+yqKHWuz1gthWkwUFgwujyqNm4PC7UmLtlESSDHEGhnHLACiP1OGLjTHSHa9z/
	 M/iQ6yKtU3Ni7+Z2ov2LNyFWgoaPutZO28zq4jQ2qu9g0qJmdP8wYmSII2rifM2zek
	 sisyNjY8FQe2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE12440BC2;
	Fri, 10 Jul 2026 13:45:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6BF3A3C
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D75E940AD5
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmmwNVsDO89p for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:45:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE14B40B22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE14B40B22
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:45:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D67068868B; Fri, 10 Jul 2026 13:44:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 15:00:39 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 780f60dc1486a347acb291ee0b5bc59210746c76
X-Git-Newrev: 28ae0cac6ffb3aae435a1f728c24fd94864f52bc
X-Patchwork-Hint: ignore
Message-Id: <20260710134427.D67068868B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gnupg2: security
 bump version to 2.5.21
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/28ae0cac6ffb3aae435a1f728c24fd94864f52bc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://lists.gnupg.org/pipermail/gnupg-announce/2026q3/000506.html

Fixes CVE-2026-34182.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit be70e1b9f30eb0df8b0a40ff06fe5056ed853504)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gnupg2/gnupg2.hash | 4 ++--
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f69b7c6eac..a53f46c67a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,5 +1,5 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  96371ec0260da5a22edbf8e4d3bf0e54b3ea5b8e  gnupg-2.5.20.tar.bz2
-sha256  6461266e99c308419a379abe6c356d54c214136c4589bd65951091138989ffc6  gnupg-2.5.20.tar.bz2
+sha1  51fae4f4d902787624eb7047f6d3e7c263ad7690  gnupg-2.5.21.tar.bz2
+sha256  e3af2c8caa46a66a9329fa7c6880af260451914d819595beabc2c26597b31352  gnupg-2.5.21.tar.bz2
 # Locally calculated
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 7756023798..05acd4811d 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.5.20
+GNUPG2_VERSION = 2.5.21
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
