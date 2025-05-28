Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFA0C5AD49
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 18:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4219E600CC;
	Wed, 28 May 2025 18:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CREg45oF4mbu; Wed, 28 May 2025 18:51:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FB2960586
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB2960586;
	Wed, 28 May 2025 18:51:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4341A19D
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3503860EBC
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:51:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGCpSPy8bGLF for <buildroot@buildroot.org>;
 Wed, 28 May 2025 18:51:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FD4360EB2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FD4360EB2
 for <buildroot@buildroot.org>; Wed, 28 May 2025 18:51:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F52786E7C; Wed, 28 May 2025 18:51:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 20:48:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd9a6c2b36d92dd38fb3b537ac9645344bec76ac
X-Git-Newrev: 2fb527fcf91b5ba9ff7221d24c5844648f82da8c
X-Patchwork-Hint: ignore
Message-Id: <20250528185148.6F52786E7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uacme: drop unneeded autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb527fcf91b5ba9ff7221d24c5844648f82da8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8c9c1222b79a (package/uacme: bump version to 1.7.6) bumperd the
version to 1.7.6 which includes the patch we carried, so the patch was
dropped, but the corresponding autoreconf was not.

Do so now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 9a2c972604..fc5b97d23d 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,9 +13,6 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
-# 0001-Fix-cross-compilation.patch touches configure.ac
-UACME_AUTORECONF = YES
-
 UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
