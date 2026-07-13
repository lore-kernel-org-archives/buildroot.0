Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44AEC44501
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0A18101C;
	Mon, 13 Jul 2026 10:22:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Q46blOHnIqp; Mon, 13 Jul 2026 10:22:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A90A80EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938167;
	bh=IzFXW7KhCfkVIrQaxEjzeeCJaeHoqgfD9NyRZCKDYco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=d41MSkqj2ybKv++ceVGoEELONBpiVtKmQtnC9zFiBE1k95x2Liuu+ZZ1K3Nq/KaTe
	 1QwURlSQgXXjcakP65K9IIq+RiFXJMN1EDC14VsM6XvM9PplMy9wSomENMDu3plsuH
	 dQnoMpIkwpg06xo1UBYczGmUMqYna9TA32MKrdV/d8NLHGS0Gcnw2jzPesxkulTuF9
	 sOqvr8z1pMZK4Xsua6ZPrOAAIxFvk0ysAHl7VQ/4PlRdOJo3VD/E6wWdXR8MBrU0kb
	 vQlclKJ8ykch9AlgqVOs4bXJQ9Vp8KT4n83jAhd71AVoQ7QTuEzX4/YuOD9NHxXUjt
	 3ehZTcdfbPWFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A90A80EBB;
	Mon, 13 Jul 2026 10:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C04C928D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B246B60717
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9wsDKJvsGIV for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05809606DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05809606DF
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:22:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2D34887B2; Mon, 13 Jul 2026 10:22:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 11:57:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0875457c116c432431118cb2d5e34afb6a321bdd
X-Git-Newrev: 5638ee04c8dddb9ebfb7b047efb574f657e1b052
X-Patchwork-Hint: ignore
Message-Id: <20260713102210.C2D34887B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libecoli: bump version to 0.11.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5638ee04c8dddb9ebfb7b047efb574f657e1b052
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release note of the new versions:
https://github.com/rjarry/libecoli/releases/tag/v0.11.3
https://github.com/rjarry/libecoli/releases/tag/v0.11.2
https://github.com/rjarry/libecoli/releases/tag/v0.11.1
https://github.com/rjarry/libecoli/releases/tag/v0.11.0

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libecoli/libecoli.hash | 2 +-
 package/libecoli/libecoli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 4045c7e19d..882f01fa99 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  ec359850f4f338b607d05200d508736b14eaa30fca8aefdfde980a283afd789d  libecoli-0.10.1.tar.gz
+sha256  25ed9638452fa050749746c863574dfd47df95bde98347d210c9deedea188151  libecoli-0.11.3.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index 96617a1689..5d4b3993f8 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.10.1
+LIBECOLI_VERSION = 0.11.3
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
