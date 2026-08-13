Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12CAC5CFDB
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 20:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C06B40CDC;
	Thu, 13 Aug 2026 20:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QjvO-Q02Jx14; Thu, 13 Aug 2026 20:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5B8440CD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786652092;
	bh=3FajYwplcMZJ3i3VAdszkCRssfaABYhFKBL/OA2Zcqo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aEM0OUyOGucESB4NU6LhwSLiYXsoj0PL91qXFRJa/e/DFUEYg5bK1WGOMzMhPM3ll
	 70NiJAe4VHKDSRk1rrCmYj+0Pt/Md5SfRAQJOhWYjJYDtvD6b9/h+Uqd8YjHeZi2r8
	 YH2H0Xr/FGRmct9LMDFJAa8nk4ZPpp3KHPLVY2NabENoEUX/Fg5nAdj1+WKL5jWDw1
	 ijokXIJWSkIO8RkoiPQThzJIeI/4l7DYdbRGdCRclMG/wIa/n+fmfzdIJl3ZekO+HT
	 P6EpJI6PpBWNZiDrypUQVgS8ytGpWnjuCYvv8rMuDmbQDorHxMlgK0FhkQVZKKov+m
	 GMMdv9ZRDp/5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5B8440CD8;
	Thu, 13 Aug 2026 20:14:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94FC4323
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E9B9606D0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0DYwdXQkTlPT for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 20:14:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F3D606A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5F3D606A5
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:14:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 397768D508; Thu, 13 Aug 2026 20:14:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 21:47:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b2e6578267d27f37e3a9c8cdc1d053ed862a88b
X-Git-Newrev: ec8c6e44874e4eefaf8b6f7c92464cec6db8c6ef
X-Patchwork-Hint: ignore
Message-Id: <20260813201401.397768D508@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dracut: update URLs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec8c6e44874e4eefaf8b6f7c92464cec6db8c6ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The Github repository has been renamed from dracut-ng to dracut. The
wiki still exists, but the actual documentation has been moved to
dracut-ng.github.io.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dracut/Config.in.host | 2 +-
 package/dracut/dracut.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dracut/Config.in.host b/package/dracut/Config.in.host
index 88dec969c3..af68728457 100644
--- a/package/dracut/Config.in.host
+++ b/package/dracut/Config.in.host
@@ -8,4 +8,4 @@ config BR2_PACKAGE_HOST_DRACUT
 	  dracut-ng is a drop-in replacement for the legacy
 	  dracut project.
 
-	  https://github.com/dracut-ng/dracut-ng/wiki
+	  https://dracut-ng.github.io/dracut/
diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 0bd24d49f4..0bf755319e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DRACUT_VERSION = 112
-DRACUT_SITE = $(call github,dracut-ng,dracut-ng,$(DRACUT_VERSION))
+DRACUT_SITE = $(call github,dracut-ng,dracut,$(DRACUT_VERSION))
 DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
