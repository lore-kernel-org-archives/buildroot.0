Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED56C282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 22:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B34160BCE;
	Tue, 11 Mar 2025 22:34:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F1mXiXH6RCHv; Tue, 11 Mar 2025 22:34:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3192560B74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3192560B74;
	Tue, 11 Mar 2025 22:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF1831DA
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAA3F40AF1
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:34:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LcUq4niWkblr for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 22:34:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 704CB40F3C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704CB40F3C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 704CB40F3C
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 22:34:46 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 47FA5B0053D;
 Tue, 11 Mar 2025 23:34:43 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue, 11 Mar 2025 23:34:32 +0100
Message-ID: <20250311223432.2054284-1-ju.o@free.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741732484;
 bh=NWu7wddhcmTTXidbo8Tx0gUe/F9B9Dz56z4vLdVyZTY=;
 h=From:To:Cc:Subject:Date:From;
 b=tHfOdVv7T2bNSxVySGVb+3teX1IBp0TpYiW/xf4bSg4PPKVqUyWrfquCbwCd5+ZPc
 1Xv966kW2R4S+GADnJzOQiRQR0VLP18IYNsX4c27pflZX0qbM8CDI38d37jb8tS2Uc
 zSMMZJBgk4DyBuCqx1JU97O/wkSvocpJ5Kz2Gg9Iznf7VKXQlFR7OM5hehO2ObsKYe
 HoCGuti4O6HARhaw2kdQjjtxMs1z1icVH5ZFT/7F35qYG2lDfx+5jhjsueMUCzBdzf
 uztt7FLGJ98MVdweciFFLJoujMYe8ShloqhnUirF8OLMLy7Qn41LeH/0nlAC0cpxZX
 xj46SR1uw9Q4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tHfOdVv7
Subject: [Buildroot] [PATCH next 1/1] package/tig: bump version to 2.5.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since 2.5.10, see:
https://github.com/jonas/tig/releases/tag/tig-2.5.11
https://github.com/jonas/tig/releases/tag/tig-2.5.12

The autoconf configure script of this new version (generated with
autoconf 2.72) now requires pkg-config. Therefore, this commit also
adds host-pkgconf in _DEPENDENCIES.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1711662318
---
 package/tig/tig.hash | 4 ++--
 package/tig/tig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tig/tig.hash b/package/tig/tig.hash
index b5aebb9c5d..4329723f9e 100644
--- a/package/tig/tig.hash
+++ b/package/tig/tig.hash
@@ -1,6 +1,6 @@
 # From:
-# https://github.com/jonas/tig/releases/download/tig-2.5.10/tig-2.5.10.tar.gz.sha256
-sha256  f655cc1366fc10058a2bd505bb88ca78e653ff7526c1b81774c44b9d841210e3  tig-2.5.10.tar.gz
+# https://github.com/jonas/tig/releases/download/tig-2.5.12/tig-2.5.12.tar.gz.sha256
+sha256  5dda8a098810bb499096e17fc9f69c0a5915a23f46be27209fc8195d7a792108  tig-2.5.12.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tig/tig.mk b/package/tig/tig.mk
index d3aa6df62a..58084bc758 100644
--- a/package/tig/tig.mk
+++ b/package/tig/tig.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-TIG_VERSION = 2.5.10
+TIG_VERSION = 2.5.12
 TIG_SITE = https://github.com/jonas/tig/releases/download/tig-$(TIG_VERSION)
 TIG_LICENSE = GPL-2.0+
 TIG_LICENSE_FILES = COPYING
 
-TIG_DEPENDENCIES = ncurses
+TIG_DEPENDENCIES = host-pkgconf ncurses
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TIG_DEPENDENCIES += libiconv
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
