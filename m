Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9382E107760E
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 20:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B927A4174F;
	Wed, 18 Mar 2026 20:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7OMpD6tAqzuz; Wed, 18 Mar 2026 20:29:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FAD441738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773865796;
	bh=FHMDNHECnJD9Y2TmbDqOaYhpycNDFqFinChsE8KERXY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=r0qJM+vUpzf9M0mjLTLmQf4k4qr2Of3mFZ8H6Jg17aHGKgkZjXoBK5UY+fct/G2im
	 d2+M9wFLooFdoLHQP+BTTBSPPHP0Tymtt9VJqCxPD7lZoJHnuHtAZZeANjqs1k/uJn
	 3xoaeLg0TlwigD+N3EIeL0S35gM/QdtgO1NfnDNkO5s1y560xETZwPApGn39/j/6Uq
	 YO7UOrXCAPFj5zhDIjQlCX1zhUe33mnBbPsr6gaVjB0M+8SDIvfraSI1kCVhogdHlK
	 uW9IDTwTmXgdHa4NmWtY8HGi5PqXQRqWUQuVuqnmfb2+pQZa3fKYz1pSDtTIx3ak8z
	 YtJSYcgbHwWVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FAD441738;
	Wed, 18 Mar 2026 20:29:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 854A21BD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7688440513
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_TLWG8_XHwA for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 20:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A27B440203
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A27B440203
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 20:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C419184898; Wed, 18 Mar 2026 20:29:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Mar 2026 21:28:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 63364f08142de9433874e34dfcf5e90206ef40b9
X-Git-Newrev: 256490256badc5040ab2ba09b25ea1cf04aa71ec
X-Patchwork-Hint: ignore
Message-Id: <20260318202953.C419184898@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-pvr-zattoo: bump version to
 21.0.5-Omega
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/256490256badc5040ab2ba09b25ea1cf04aa71ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 484e12324c..e4930b9fb5 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7e1fab309232e7115efa0868c8c3c13c2e7639628ef8bc59a93bf4aa82a3b20d  kodi-pvr-zattoo-21.0.4-Omega.tar.gz
+sha256  b9bf700f0ee93f0d6b87952e9420e277c384cf0d3b07dc2849f5496304104af9  kodi-pvr-zattoo-21.0.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 6a981e12b7..8171939c60 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 21.0.4-Omega
+KODI_PVR_ZATTOO_VERSION = 21.0.5-Omega
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
