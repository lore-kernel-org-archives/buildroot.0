Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8450C43458
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 09:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3EB2822C4;
	Wed,  1 Jul 2026 09:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8MfX0tKfsvAG; Wed,  1 Jul 2026 09:19:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74592822C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782897580;
	bh=UJTsBpJsRawwLZT4t8tfJmuXIJU/Q1+GjKFP78zUQXE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=piDYCPUb0+z3IWDg2eh60J41F5vaUA+ch1cBXwxUOEvFcjyTKvXsEN/gsR981qljg
	 xifhiCVKLbkxpJFOImuC9nNQvG2t7qHvWs9+bEcQfM0y9vVULrapsjaM6a1GP2sPd4
	 iJbgcrfNX4vGtkKN/aySfLK3Gt8/I714QQiOSyUXj49v1G2MjGNIbXOluY27x1y3OW
	 6FQFvVZmRwgjdjmRg2Y5VP4+s86aNoekheRK3Ctf3cqel9h56/y6B9Q/1/5LUHw9gt
	 N6n8waCKwwu5hhmTD6w0tFhwXzrx3fcRUyTvr/otow1LmRikW66esYatuYeAneb18l
	 lTbLiRxu5UPfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74592822C0;
	Wed,  1 Jul 2026 09:19:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC68A127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA246822C3
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIRcodbQOb4m for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 09:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6DC482273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6DC482273
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 09:19:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F04287645; Wed,  1 Jul 2026 09:19:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 11:13:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5aa9327458fceb21e0278f37765af1d5175e1cf
X-Git-Newrev: 9030c9a81dc8763b89a4fb9df220dd1aa013cdbc
X-Patchwork-Hint: ignore
Message-Id: <20260701091909.4F04287645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/shadow: needs host-pkgconf
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9030c9a81dc8763b89a4fb9df220dd1aa013cdbc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 4.14.0 and upstream commit 2a5b8810bb17, shadow has
required pkgconfig to find libbsd.

Add a dependency on host-pkgconf.

Fixes: https://autobuild.buildroot.org/results/90f/90ff13ff4c519b0606888eaa90acbd8cd0c0f73a/

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>
[Fiona: fix typo in commit message]
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/shadow/shadow.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index cf05fc1bdc..5f9b69ef88 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -10,9 +10,12 @@ SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
 SHADOW_LICENSE_FILES = COPYING
 SHADOW_CPE_ID_VENDOR = debian
-SHADOW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 SHADOW_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
+SHADOW_DEPENDENCIES = \
+	host-pkgconf \
+	$(TARGET_NLS_DEPENDENCIES)
+
 SHADOW_CONF_OPTS = \
 	--disable-man \
 	--without-btrfs \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
