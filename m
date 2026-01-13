Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E31AD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59596823FF;
	Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_bm2SkMFL5q; Tue, 13 Jan 2026 20:59:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACCD83E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337997;
	bh=U7AYwhlCbXlxcwnHZ7hDNbwEyBq1ocCNjHtkUhM2U1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k2YpAFEPW/TweUpjggZDvgGxLzjC+im5mcWpOYn2uKMYbfkH1Iok7iEBU8oJAxubV
	 EJeAa+J8sYHt/J30oq0C0VznAekF8hXJ8nkoO+XPSuxqx7oi6vskIupNelJg/1LJ8U
	 EpUAjpOfpECU5+pLkXVIXwguBgl/PVyS/c4RxRSsq5NTGH0qY6qFmMTJYjsXxc11RG
	 WlHwZ0AZRekRZ8Jt4W8n045tqL6fietPTYSK5igl5TLjnbGXLTchaMqmGz45mgDPyt
	 TVh9exXvAfz2FMhRPRSeaes3E0IciKeqLqZH6aV1qJnYla1/3QBMCiY7v11frBKcgh
	 7qgMIg8JLbv4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACCD83E90;
	Tue, 13 Jan 2026 20:59:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3E511CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4CCEF407A2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gm5d_wWgSqrc for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCD8A40793
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCD8A40793
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB32380F55; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c476184155d6729df579b8ae081a737a9b489a87
X-Git-Newrev: 43329222f5412e00a63d94f72b89428287e42257
X-Patchwork-Hint: ignore
Message-Id: <20260113205848.DB32380F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xfs: bump version to
 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=43329222f5412e00a63d94f72b89428287e42257
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-July/003520.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xfs/xapp_xfs.hash | 6 +++---
 package/x11r7/xapp_xfs/xapp_xfs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xfs/xapp_xfs.hash b/package/x11r7/xapp_xfs/xapp_xfs.hash
index ed802f86a0..a857f69552 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.hash
+++ b/package/x11r7/xapp_xfs/xapp_xfs.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003175.html
-sha256  3d8ac3e8add7eeb1dc199dff6c59f90a2dbe7aa4332c1e12192350f2cda1c1e6  xfs-1.2.1.tar.xz
-sha512  0f8b019e0d922b3d859110154e0ec58493f66507f9787cd41a6c03ad7a05b3293f088f1004e4aaa81e017a524c06d23915669f91ed5e1c2679b33c43de15e70d  xfs-1.2.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-July/003520.html
+sha256  b70bd46331e241b30e5e00dbdc2eabb7f3f8880cd44244acde13d7976d098ecc  xfs-1.2.2.tar.xz
+sha512  e8983ddade7015c87db1278093701b9e62c7d09003150ed7347a9b83b8f245e8ac9fe2d86d61bb4469bbbea86a71366ef299541793326d9dbbb1b9c0572bcba9  xfs-1.2.2.tar.xz
 # Locally computed
 sha256  0314ea37f40eff3c9ffe44b3924b2a768422f006a754e8286bfd1c73203d225e  COPYING
diff --git a/package/x11r7/xapp_xfs/xapp_xfs.mk b/package/x11r7/xapp_xfs/xapp_xfs.mk
index 50a0412181..d96647e1df 100644
--- a/package/x11r7/xapp_xfs/xapp_xfs.mk
+++ b/package/x11r7/xapp_xfs/xapp_xfs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XFS_VERSION = 1.2.1
+XAPP_XFS_VERSION = 1.2.2
 XAPP_XFS_SOURCE = xfs-$(XAPP_XFS_VERSION).tar.xz
-XAPP_XFS_SITE = https://xorg.freedesktop.org/releases/individual/app
+XAPP_XFS_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XFS_LICENSE = MIT
 XAPP_XFS_LICENSE_FILES = COPYING
 XAPP_XFS_DEPENDENCIES = xlib_libFS xlib_libXfont2 xorgproto
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
