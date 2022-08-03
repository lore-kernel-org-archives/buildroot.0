Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B941AC19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 20:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A9E560B3D;
	Wed,  3 Aug 2022 20:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A9E560B3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cy2EihwOIRp4; Wed,  3 Aug 2022 20:48:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 656D260B4F;
	Wed,  3 Aug 2022 20:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 656D260B4F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31CDB1BF9B9
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DBDE401D8
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 20:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DBDE401D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gy15GrovqQg7 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 20:47:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EBDA401CC
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 20:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EBDA401CC
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 58D1D86DF5; Wed,  3 Aug 2022 20:32:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 22:43:13 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0f14e1e97f1e42faf32f5a433b1e83a5602f9625
X-Git-Newrev: 0c3797f01f6e89cefbf36ad0e41bdd38eb75e28a
X-Patchwork-Hint: ignore
Message-Id: <20220803203259.58D1D86DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gnupg2: security
 bump to version 2.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c3797f01f6e89cefbf36ad0e41bdd38eb75e28a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix CVE-2022-34903: GnuPG through 2.3.6, in unusual situations where an
attacker possesses any secret-key information from a victim's keyring
and other constraints (e.g., use of GPGME) are met, allows signature
forgery via injection into the status line.

https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5a0a9227ba67e1ebabea562dbec113d74e6e8092)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 10 +++++-----
 package/gnupg2/gnupg2.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index caf5dcc883..ec2654be7b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2021q2/000460.html
-sha1  81684626720c91060ae9920936c768df9fc8b2f6  gnupg-2.2.32.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2022q3/000474.html
+sha1  9255a70a984bfbfa5312a9a52a1cf47cb0d1fc84  gnupg-2.3.7.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.32.tar.bz2.sig
-# using key 6DAA6E64A76D2840571B4902528897B826403ADA
-sha256  b2571b35f82c63e7d278aa6a1add0d73453dc14d3f0854be490c844fca7e0614  gnupg-2.2.32.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.3.7.tar.bz2.sig
+# using key 02F38DFF731FF97CB039A1DA549E695E905BA208
+sha256  ee163a5fb9ec99ffc1b18e65faef8d086800c5713d15a672ab57d3799da83669  gnupg-2.3.7.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 0a2cebfab3..7d8424c136 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.32
+GNUPG2_VERSION = 2.3.7
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
