Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F0C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 08:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FC6606B4;
	Sun, 16 Aug 2026 08:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZalncBynlIct; Sun, 16 Aug 2026 08:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05B8D60657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786867672;
	bh=4wNocIBgQzVW/R/c0IqStjq3OI9NWXU49UK6Y6cikq4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iuZw4isznUo298beDCpl49je+/xBosM+uV8Bjtm1G40PKbVgl4yCbRCCD2WBTW/Yu
	 DXV/+Si7CIka/KBiLhCVGSWvshvwlR0eynsnsxxAN2JuLaIV2GWfxYSkePP3K5x02w
	 IYG/O4EXfc9ofU7y7lWPhDzIllJd8KbQB6AED2foD0CjCVqGs06N9veGDuwHlfelJT
	 403Jwn8gv4SeS3Tyls6jAw9loTlvPHcpguZcWJRIAKRaJnY6F37t155lxyejLgJhab
	 zPdS4bd96yZYDZri6dIre5nLJU/nJPZLOc4iENamlR84DfpzKPrD6jQLiOY72S5f0D
	 vJP497AkaD5DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05B8D60657;
	Sun, 16 Aug 2026 08:07:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B702333
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 693BA400C0
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR6xuwfAmfPc for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 08:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB0574006B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0574006B
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 08:07:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B25AC8DA0B; Sun, 16 Aug 2026 08:06:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 10:05:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c92087605c30bd5c1384a62198855f7836b5215
X-Git-Newrev: e3d5341e01eb83fb4f76a5c721a3363cff8a7f73
X-Patchwork-Hint: ignore
Message-Id: <20260816080658.B25AC8DA0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump version to
 2.8.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3d5341e01eb83fb4f76a5c721a3363cff8a7f73
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes
https://blog.hartwork.org/posts/expat-2-8-3-released/

Fixes CVE-2026-72522.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/expat/expat.hash | 4 ++--
 package/expat/expat.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 2087133382..c5a8816f9b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_2
-sha256  3ad89b8588e6644bd4e49981480d48b21289eebbcd4f0a1a4afb1c29f99b6ab4  expat-2.8.2.tar.xz
+# From https://github.com/libexpat/libexpat/releases/tag/R_2_8_3
+sha256  f6256df90c906773d344da084402b7d3e4f22ed41b1a59c989098a83d3ea0c85  expat-2.8.3.tar.xz
 # Locally calculated
 sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index fb25a4a47b..7645edfd52 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.8.2
+EXPAT_VERSION = 2.8.3
 EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
