Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441EBD30CC2
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB8F60D72;
	Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RedOw8ur6NIb; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A9B660D7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337932;
	bh=+Uj9FYpVE3FMWllfxoSF/oygNaLHF3ovni7zB9Ws0u8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rmXNOnK/mFTyNJGaOFdeHOgQ6hFw2tqvfZyEp3AwpZdiDBCtrdVROKsGS8azoLzsV
	 FvOvWFBayNit+fq3kkzdsKp7ETrsbcPCxhn5Zv9FdvTHBc1G28N/7SDSmjc+Id7aEb
	 64bH74lYHQ8Q5J0k6ZPNzfxmxUackwhbkdC+YNF+cnX9uJATQcddNu8keDi0zEq5m8
	 5WC04U2lGT8Q4JzO3SE/ymOplLyCFVfgXFtE8i0SNOfsI5IACTuXfYtoolQ+1Zv2kQ
	 hsDkf6LnA5N9YCe/bO73Xz7iIRu2/uJDL5LUDwGcva280+1f7rybsxbArXTD2e0My7
	 w8BtpeVCApq4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A9B660D7A;
	Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C0F71CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3288740C2A
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id znPdDuClPFS9 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E08B40C29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E08B40C29
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B37784685; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 849fa938579f220bdd9bfc8f947cee83db8837bf
X-Git-Newrev: 734eb062b463565a0ffb53d15eaad2387035515e
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.7B37784685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_showfont: bump version
 to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=734eb062b463565a0ffb53d15eaad2387035515e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003602.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_showfont/xapp_showfont.hash | 6 +++---
 package/x11r7/xapp_showfont/xapp_showfont.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_showfont/xapp_showfont.hash b/package/x11r7/xapp_showfont/xapp_showfont.hash
index 7bec4e8728..9b6e0b4276 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.hash
+++ b/package/x11r7/xapp_showfont/xapp_showfont.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-August/003207.html
-sha256  2b9b9f06e65e095ed76ce560b701b9fc47fa63310ee706b54c8787af061d0e56  showfont-1.0.6.tar.xz
-sha512  21a318519492f4ba46a8bcb3590097fc5f96fe01fdb557257ae56bae813671952a2aad6c0df8cd69659e06708571c398e6d97969224cf692e22c8a35c8e6c363  showfont-1.0.6.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003602.html
+sha256  8f725d641c12ef07746d16c892240823eccd045444a1ea182eddf229cc178fe7  showfont-1.0.7.tar.xz
+sha512  6c27b280976d22f35071136e139a654c7be41f5cca3b450a3aa36f8a026b151e700d4e386b0fde8deccef50f8d43338f5d105977a7d11861fccab6c05e480d70  showfont-1.0.7.tar.xz
 # Locally computed
 sha256  c32217021e0507207e2ee6da3fcee3d9e32816003a7153b3357c08cdc97934a8  COPYING
diff --git a/package/x11r7/xapp_showfont/xapp_showfont.mk b/package/x11r7/xapp_showfont/xapp_showfont.mk
index a805f35231..9240345310 100644
--- a/package/x11r7/xapp_showfont/xapp_showfont.mk
+++ b/package/x11r7/xapp_showfont/xapp_showfont.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_SHOWFONT_VERSION = 1.0.6
+XAPP_SHOWFONT_VERSION = 1.0.7
 XAPP_SHOWFONT_SOURCE = showfont-$(XAPP_SHOWFONT_VERSION).tar.xz
 XAPP_SHOWFONT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SHOWFONT_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
