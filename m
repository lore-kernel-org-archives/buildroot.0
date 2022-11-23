Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FB7C43219
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E00BF82059;
	Wed, 23 Nov 2022 09:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E00BF82059
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlPQ0tIrSWAv; Wed, 23 Nov 2022 09:50:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30F4182074;
	Wed, 23 Nov 2022 09:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30F4182074
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 285FF1BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045A860E3B
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045A860E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S453Ml09COkR for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:49:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C8C0607D0
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C8C0607D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28D19842B5; Wed, 23 Nov 2022 09:49:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:42:58 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: aff84680c061d812eea37ecc0ef51e8f51b876c9
X-Git-Newrev: f866ceda908e7b5cb4ff65ae078d025b7ec96fe9
X-Patchwork-Hint: ignore
Message-Id: <20221123094956.28D19842B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libksba: security
 bump to version 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f866ceda908e7b5cb4ff65ae078d025b7ec96fe9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

A severe bug has been found in Libksba , the library used by GnuPG for parsing
the ASN.1 structures as used by S/MIME. The bug affects all versions of Libksba
before 1.6.2 and may be used for remote code execution.

Fix CVE-2022-3515

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9c0311220fb627db8af4a2cd8c3adb067e8a308d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libksba/libksba.hash | 2 +-
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 422048be5f..77485c0cb6 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  dad683e6f2d915d880aa4bed5cea9a115690b8935b78a1bbe01669189307a48b  libksba-1.6.0.tar.bz2
+sha256  fce01ccac59812bddadffacff017dac2e4762bdb6ebc6ffe06f6ed4f6192c971  libksba-1.6.2.tar.bz2
 
 # Hash for license files:
 sha256  8f1b87e551d97b2b23b6d3403a5d598c63ea89824cb8ee351f631f6cab2beaa5  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index ca5fc1d749..3a8b3fa502 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.0
+LIBKSBA_VERSION = 1.6.2
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = ftp://ftp.gnupg.org/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
