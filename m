Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88093F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2A384E09;
	Tue, 14 Apr 2026 17:49:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIE5-XajwXqM; Tue, 14 Apr 2026 17:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0EED84A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188958;
	bh=Hxx5ibIBh6KCSXmNXrzkoIpP1bVpkxBBCD0bbZ64WNw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W9zx93odrnTXmdW711poSz899O1O0iY+GCsY9qQ8dWV9+FVUQUzO1XvT0kitEzHXW
	 TBcMx+azOOHw85Y3nYiHsiNi4BtgOKWHJI5fnXohvEuIZzVgPUA7SgcfkrVOgMUnFN
	 4KZHqQEvvbW8zPItqjzHeRZDuDQoOqZEBiFCZuVinOEV80kWgj2r4jF4aPNIke+mIc
	 kH60tHeUxCunSHAuwopiqnsu4wj9rYLCQdNinGKY3VViD0yDWS6C2+PI1rmcCe31yx
	 QzW8D6Zq7Ey/Lq4U+HIXgU+4FaiXDjHnx2F68QcWYJ+FdaYcYHkbqiGFPKTZkxvors
	 rmSbaylMaLZNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0EED84A7B;
	Tue, 14 Apr 2026 17:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10409283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59D4D42771
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iknr8t4Yg5BZ for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDED4273C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DDED4273C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23CD57FB2D; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0aa8a91bb82f5474aa35f15bb626f7bad5bbbf2f
X-Git-Newrev: a4aaad59da2dd744803636ea2447aba348f540c1
X-Patchwork-Hint: ignore
Message-Id: <20260414174852.23CD57FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/slang: disable pcre module
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a4aaad59da2dd744803636ea2447aba348f540c1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The pcre package is unmaintained and will be removed from buildroot.

Slang has no support for pcre2 so we remove the pcre module.

For reference see:
https://fedoraproject.org/wiki/Changes/PcreDeprecation
https://bugzilla.redhat.com/show_bug.cgi?id=2128372
https://src.fedoraproject.org/rpms/slang/c/40c4fb0556a06ad3ad9abf01bcaef50dde0dc8c2?branch=rawhide

https://github.com/LibreELEC/LibreELEC.tv/pull/8299

https://packagehub.suse.com/packages/slang/2_3_3+git16_89d32bb-160000_2_2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/slang/slang.mk | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index 2b3cbdf27a..5d85e40982 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -10,7 +10,7 @@ SLANG_SITE = http://www.jedsoft.org/releases/slang
 SLANG_LICENSE = GPL-2.0+
 SLANG_LICENSE_FILES = COPYING
 SLANG_INSTALL_STAGING = YES
-SLANG_CONF_OPTS = --with-onig=no
+SLANG_CONF_OPTS = --with-onig=no --with-pcre=no
 SLANG_MAKE = $(MAKE1)
 
 # Racy and we don't have/do libtermcap
@@ -26,12 +26,6 @@ SLANG_DEPENDENCIES += libpng
 else
 SLANG_CONF_OPTS += --with-png=no
 endif
-ifeq ($(BR2_PACKAGE_PCRE),y)
-SLANG_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
-SLANG_DEPENDENCIES += pcre
-else
-SLANG_CONF_OPTS += --with-pcre=no
-endif
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SLANG_CONF_OPTS += --with-z=$(STAGING_DIR)/usr
 SLANG_DEPENDENCIES += zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
