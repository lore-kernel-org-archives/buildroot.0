Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925D1F55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DB1041BC6;
	Sat,  7 Mar 2026 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YHYM7mRNy4CW; Sat,  7 Mar 2026 20:25:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD07041A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772915145;
	bh=lX25umxhjDZd8zBkZm7GH2jqkheIItHNGRgc5tchKFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O2Bhxex9H1qyDz8hhA675nk4gTZ2tbiPoKzH5T37EBxeWuuvg/lypXj/ZkAO0PPlU
	 qe5fDtZgDlrrE7gf48jfM28UfrMnHymGi1dav5QX3Sz76qRAoY2Y3Uh1x5Y98cY1nj
	 tuLqIN9La3Aj0cl1rKE2+nP18+hAIGrIByEdLJssyQzMC1yDFNZBvgQeKwur9vlRcb
	 5EaVB+Ow3/OZz5o15yynhOGflB78mPxgOLGK6B+PFdsIn+amUtT0+Gyk6kgmcdGJQr
	 SIHX2erZF7yfnONCc/2sk/XwjqMA2f5TVT3FqWvdNTQ5XEk23m5QTtQhMUNyYtCkql
	 y3d1Et5GIO1Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD07041A4E;
	Sat,  7 Mar 2026 20:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 938E9158
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7937041A4E
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9C_WloI12AN for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 20:25:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFC5841A3F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFC5841A3F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 20:25:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D08D285E15; Sat,  7 Mar 2026 20:25:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 21:20:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7323bcc1d476e965d31fd3db4046bacf6f7c0e75
X-Git-Newrev: db2d195ac842fda716a3dbc154c94d2feb59d059
X-Patchwork-Hint: ignore
Message-Id: <20260307202543.D08D285E15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/taglib: bump version to 2.2.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/db2d195ac842fda716a3dbc154c94d2feb59d059
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/taglib/taglib/blob/v2.2.1/CHANGELOG.md

Used sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/taglib/taglib.hash | 3 ++-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index f3fc31beea..0db3cfa8d6 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,5 @@
+# From https://github.com/taglib/taglib/releases/tag/v2.2.1
+sha256  7e76b5299dcef427c486bffe455098470c8da91cf3ccb9ea804893df57389b5e  taglib-2.2.1.tar.gz
 # Locally calculated
-sha256  3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba  taglib-2.1.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 60ca045886..cac9f924fc 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.1.1
+TAGLIB_VERSION = 2.2.1
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
