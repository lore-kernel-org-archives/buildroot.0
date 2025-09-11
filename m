Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5100CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 20:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770CD60AC0;
	Thu, 11 Sep 2025 20:13:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Df7jLJ_jDsIo; Thu, 11 Sep 2025 20:13:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9A1A612B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9A1A612B9;
	Thu, 11 Sep 2025 20:13:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17B3625B
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14DDB41FEA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9fn6KhK0I8p3 for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4930442028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4930442028
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38F14843BA; Thu, 11 Sep 2025 20:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Sep 2025 22:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86d698091faf5074efbf7f57bd8dcb4108647085
X-Git-Newrev: cdc7ca446fdf639ae1398318e6cc5788192f0ced
X-Patchwork-Hint: ignore
Message-Id: <20250911201307.38F14843BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsurf: drop support for gtk
 frontend
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cdc7ca446fdf639ae1398318e6cc5788192f0ced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the libgtk2 package, let's drop the gtk
frontend from netsurf. It is worth mentioning that the gtk3 frontend
remains in place as an alternative.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy           | 8 ++++++++
 package/netsurf/Config.in  | 6 ------
 package/netsurf/netsurf.mk | 7 -------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 6abd11924c..d68106d8c1 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
+config BR2_PACKAGE_NETSURF_GTK
+	bool "gtk frontend of netsurf has been removed"
+	select BR2_LEGACY
+	help
+	  Due to the removal of libgtk2, the gtk frontend of netsurf
+	  has been removed. The gtk3 frontend can be used instead for
+	  example.
+
 config BR2_PACKAGE_METACITY
 	bool "metacity has been removed"
 	select BR2_LEGACY
diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index 394befcf28..dd37d876f6 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -40,12 +40,6 @@ config BR2_PACKAGE_NETSURF_SDL
 	help
 	  Select SDL 1.2 frontend.
 
-config BR2_PACKAGE_NETSURF_GTK
-	bool "gtk2 frontend"
-	depends on BR2_PACKAGE_LIBGTK2
-	help
-	  Select GTK+ 2 frontend.
-
 config BR2_PACKAGE_NETSURF_GTK3
 	bool "gtk3 frontend"
 	depends on BR2_PACKAGE_LIBGTK3
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 574c1423df..383cd8ab9d 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -25,17 +25,10 @@ define NETSURF_DUKTAPE_CONFIGURE_CMDS
 endef
 endif
 
-ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
-NETSURF_DEPENDENCIES += libgtk2
-NETSURF_FRONTEND = gtk2
-endif
-
 ifeq ($(BR2_PACKAGE_NETSURF_GTK3),y)
 NETSURF_DEPENDENCIES += libgtk3
 NETSURF_FRONTEND = gtk3
-endif
 
-ifeq ($(BR2_PACKAGE_NETSURF_GTK)$(BR2_PACKAGE_NETSURF_GTK3),y)
 ifeq ($(BR2_PACKAGE_LIBRSVG),y)
 NETSURF_DEPENDENCIES += librsvg
 define NETSURF_SVG_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
